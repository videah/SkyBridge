import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/mastodon/mastodon_application.dart';
import 'package:sky_bridge/models/mastodon/registered_mastodon_application.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final request = context.request;

    // Determine if the request is a JSON request or a form request.
    final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
    final params = context.request.uri.queryParameters;

    Map<String, dynamic> body;
    if (type.contains('application/json')) {
      body = await request.json() as Map<String, dynamic>;
    } else if (params['client_name'] != null) {
      // Some clients like Ice Cubes give the data as query parameters.
      // This isn't mentioned in the Mastodon docs but we handle it here.
      body = params;
    } else {
      body = await request.formData();
    }

    final app = MastodonApplication.fromJson(body);

    // Construct client ID.
    final clientId = btoa(app.clientName);

    // Construct client secret.
    final clientSecret = makeClientSecret(clientId);

    // Return fake registered application.
    final registered = RegisteredMastodonApplication(
      id: '123',
      name: app.clientName,
      website: app.website,
      redirectUri: app.redirectUris,
      clientId: clientId,
      clientSecret: clientSecret,
      vapidKey: '', // Some clients want this field to exist
    );

    return Response.json(
      body: registered.toJson(),
    );
  } else if (context.request.method == HttpMethod.options) {
    return Response(
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'POST, OPTIONS',
        'Access-Control-Allow-Headers': 'Content-Type',
      },
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
