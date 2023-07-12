import 'dart:convert';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/oauth/oauth_access_token.dart';
import 'package:sky_bridge/models/preferences.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

/// Check a request context for a valid bearer token to determine if the
/// request is authenticated.
Future<bsky.Session?> sessionFromContext(RequestContext context) async {
  final header = context.request.headers['Authorization'];
  final token = validateBearerToken(header);

  // Either we don't have a token or it's in an invalid format.
  if (token == null) return null;

  // Check if we have a session for the given DID.
  final record = await db.sessionRecord.findUnique(
    where: SessionRecordWhereUniqueInput(did: token.did),
  );

  // If we already have a session then great! Otherwise, try to create one.
  if (record != null) {
    final json = jsonDecode(record.session) as Map<String, dynamic>;
    final session = bsky.Session.fromJson(json);

    final accessJwt =
        JWT.decode(session.accessJwt).payload as Map<String, dynamic>;
    final refreshJwt =
        JWT.decode(session.refreshJwt).payload as Map<String, dynamic>;

    final accessExp = DateTime.fromMillisecondsSinceEpoch(
      (accessJwt['exp'] as int) * 1000,
    );

    final refreshExp = DateTime.fromMillisecondsSinceEpoch(
      (refreshJwt['exp'] as int) * 1000,
    );
    final now = DateTime.now().toUtc();

    // Let's handle token expiration.
    if (now.isAfter(accessExp)) {
      if (now.isAfter(refreshExp)) {
        // Refresh token is expired. We gotta get a brand new session.
        final newSession = await createBlueskySession(
          identifier: token.identifier,
          appPassword: token.appPassword,
        );

        // Credentials are just straight up invalid. Bail.
        if (newSession == null) return null;

        return newSession;
      } else {
        // The access token is expired but we have a valid refresh token,
        // try to refresh the session.
        final bluesky = bsky.Bluesky.fromSession(session);
        final refreshedSession = await bluesky.servers.refreshSession(
          refreshJwt: session.refreshJwt,
        );

        // Update the session in the database.
        await db.sessionRecord.update(
          where: SessionRecordWhereUniqueInput(did: refreshedSession.data.did),
          data: SessionRecordUpdateInput(
            session: StringFieldUpdateOperationsInput(
              set: jsonEncode(refreshedSession.data.toJson()),
            ),
          ),
        );

        return refreshedSession.data;
      }
    }

    return session;
  } else {
    final newSession = await createBlueskySession(
      identifier: token.identifier,
      appPassword: token.appPassword,
    );

    // Credentials are just straight up invalid. Bail.
    if (newSession == null) return null;

    return newSession;
  }
}

/// Helper function that takes a [RequestContext] and returns user preferences.
SkybridgePreferences preferencesFromContext(RequestContext context) {
  final header = context.request.headers['Authorization'];
  final token = validateBearerToken(header);
  if (token == null) return const SkybridgePreferences();
  return token.preferences;
}

/// Helper function that takes a [RequestContext] and returns an API accessor.
Future<bsky.Bluesky?> blueskyFromContext(RequestContext context) async {
  final session = await sessionFromContext(context);
  if (session == null) return null;
  return bsky.Bluesky.fromSession(session);
}

/// A helper function to return a 401 response for an invalid bearer token.
Response authError() {
  return Response.json(
    statusCode: 401,
    body: {
      'error': 'The access token is invalid',
    },
  );
}

/// Check if [tokenString] is a valid signed bearer token that we can unpack.
OAuthAccessToken? validateBearerToken(String? tokenString) {
  if (tokenString == null) return null;
  if (tokenString.startsWith('Bearer ')) {
    final token = unpackObject(tokenString.substring(7));
    if (token == null) return null;
    return OAuthAccessToken.fromJson(token);
  }
  return null;
}

/// Global list of active sessions.
Map<String, bsky.Session> sessions = {};

/// Create a Bluesky session with the given credentials and store
/// it in [sessions].
Future<bsky.Session?> createBlueskySession({
  required String identifier,
  required String appPassword,
}) async {
  try {
    // Try to authenticate with Bluesky with the given credentials.
    final session = await bsky.createSession(
      identifier: identifier,
      password: appPassword,
    );

    // If we've gotten this far, the credentials are valid.
    // Store the session in the global list for later.
    await db.sessionRecord.upsert(
      where: SessionRecordWhereUniqueInput(
        did: session.data.did,
      ),
      create: SessionRecordCreateInput(
        did: session.data.did,
        session: jsonEncode(session.data.toJson()),
      ),
      update: SessionRecordUpdateInput(
        session: StringFieldUpdateOperationsInput(
          set: jsonEncode(session.data.toJson()),
        ),
      ),
    );
    print('New session created for ${session.data.did}');
    return session.data;
  } catch (e) {
    return null;
  }
}
