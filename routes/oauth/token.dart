import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_token.dart';
import 'package:sky_bridge/models/oauth/oauth_token_request.dart';

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
      final token = OAuthToken(
        accessToken: 'ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0',
        tokenType: 'Bearer',
        scope: 'read write follow push',
        createdAt: DateTime.now(),
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

        print(oauth.clientSecret);
        print(clientSecret);

        if (oauth.clientId == code.clientId &&
            oauth.clientSecret == clientSecret) {

          final accessToken = packObject({
            'a': code.token,
            's': code.tokenSecret,
          });

          final token = OAuthToken(
            accessToken: accessToken,
            tokenType: 'Bearer',
            scope: code.scope,
            createdAt: DateTime.now(),
          );

          return Response.json(
            body: token.toJson(),
          );
        }
      }
    }

    return Response(statusCode: HttpStatus.unauthorized);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
