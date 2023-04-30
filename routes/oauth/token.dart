import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/models/oauth/oauth_token.dart';
import 'package:sky_bridge/models/oauth/oauth_token_request.dart';

Future<Response> onRequest(RequestContext context) async {
  // All tokens we generate right now are totally fake.
  // TODO(videah): Do this properly and use real cryptographic OAuth tokens.

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

    if (oauth.grantType == 'client_credentials') {
      final token = OAuthToken(
        accessToken: 'ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0',
        tokenType: 'Bearer',
        scope: 'read write follow push',
        createdAt: DateTime.now(),
      );

      return Response.json(
        body: token.toJson(),
      );
    } else if (oauth.grantType == 'authorization_code') {
      final token = OAuthToken(
        accessToken: 'ZA-Yj3aBD8U8Cm7lKUp-lm9O9BmDgdhHzDeqsY8tlL0',
        tokenType: 'Bearer',
        scope: 'read write follow push',
        createdAt: DateTime.now(),
      );

      return Response.json(
        body: token.toJson(),
      );
    }

    return Response(statusCode: HttpStatus.unauthorized);
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}