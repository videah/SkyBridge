import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_access_token.dart';
import 'package:sky_bridge/models/oauth/oauth_token.dart';
import 'package:sky_bridge/models/oauth/oauth_token_request.dart';
import 'package:sky_bridge/models/preferences.dart';


/// Obtain an access token, to be used during API calls that are not public.
/// POST /oauth/token HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/oauth/#token
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final request = context.request;

    final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
    Map<String, dynamic> body;
    if (type.contains('application/json')) {
      body = await request.json() as Map<String, dynamic>;
    } else {
      body = await request.formData();
    }

    final oauth = OAuthTokenRequest.fromJson(body);

    if (oauth.grantType == GrantType.clientCredentials) {
      // Ivory expects a client credential token but we don't really care
      // about that right now so we just return a dummy token.
      final token = OAuthToken(
        accessToken: 'ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0',
        tokenType: 'Bearer',
        scope: 'read write follow push',
        createdAt: DateTime.now().toUtc(),
      );

      return Response.json(
        body: token.toJson(),
      );
    } else if (oauth.grantType == GrantType.authorizationCode) {
      final code = oauth.code;
      // If we don't have a code, we can't do anything.
      if (code == null) {
        return Response(statusCode: HttpStatus.badRequest);
      }

      if (code.purpose == 'token') {
        final clientSecret = makeClientSecret(code.clientId);

        if (oauth.clientId == code.clientId &&
            oauth.clientSecret == clientSecret) {

          // Attempt to sign in with the provided credentials.
          // If successful a session is stored globally in [sessions].
          final session = await createBlueskySession(
            identifier: code.identifier,
            appPassword: code.appPassword,
          );

          // Credentials don't match a bluesky account, time to bail.
          if (session == null) {
            print('Invalid bluesky credentials, no session could be created.');
            return Response(statusCode: HttpStatus.unauthorized);
          }

          final accessToken = OAuthAccessToken(
            identifier: code.identifier,
            did: session.did,
            appPassword: code.appPassword,
            preferences: SkybridgePreferences(
              showRepliesInHome: code.showRepliesInHome,
            ),
          );

          // Sign the access token with the bridge key and pack it into a
          // string.
          final signedAccessToken = packObject(accessToken.toJson());

          final token = OAuthToken(
            accessToken: signedAccessToken,
            tokenType: 'Bearer',
            scope: code.scope,
            createdAt: DateTime.now().toUtc(),
          );

          return Response.json(
            body: token.toJson(),
          );
        }
      }
    }

    print('Unknown token type requested.');
    return Response(statusCode: HttpStatus.unauthorized);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
