import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/models/forms/revoke_oauth_form.dart';

/// Revoke an access token to make it no longer valid for use.
/// In our case we simply drop the associated session.
/// POST /oauth/revoke HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/oauth/#revoke
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

    // Get the revoke details from the request body.
    final oauth = RevokeOAuthForm.fromJson(body);

    // Remove a session associated with this token.
    sessions.remove(oauth.token.did);

    return Response.json(body: {});
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
