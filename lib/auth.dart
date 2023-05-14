import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_access_token.dart';

/// Check a request context for a valid bearer token to determine if the
/// request is authenticated.
Future<bsky.Session?> sessionFromContext(RequestContext context) async {
  final header = context.request.headers['Authorization'];
  final token = validateBearerToken(header);

  // Either we don't have a token or it's in an invalid format.
  if (token == null) return null;

  // Check if we have a session for the given DID.
  final session = sessions[token.did];

  // If we already have a session then great! Otherwise, try to create one.
  if (session != null) {
    return session;
  } else {
    final newSession = await createBlueskySession(
      identifier: token.identifier,
      appPassword: token.appPassword,
    );

    // Credentials are just straight up invalid. Bail.
    if (newSession == null) return null;

    // We have a valid session, store it globally for later.
    sessions[token.did] = newSession;
    return sessions[token.did];
  }
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
    sessions[session.data.did] = session.data;
    print('New session created for ${session.data.did}');
    return session.data;
  } catch(e) {
    return null;
  }
}
