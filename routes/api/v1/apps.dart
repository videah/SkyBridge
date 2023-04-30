import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/mastodon/mastodon_application.dart';
import 'package:sky_bridge/models/mastodon/registered_mastodon_application.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final request = context.request;

    // Determine if the request is a JSON request or a form request.
    final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
    Map<String, dynamic> body;
    if (type.contains('application/json')) {
      body = await request.json() as Map<String, dynamic>;
    } else {
      body = await request.formData();
    }

    final app = MastodonApplication.fromJson(body);

    // Construct client ID.
    final clientId = btoa(app.clientName);

    // Construct client secret.
    final data = utf8.encode(clientId);
    final hash = sha1.convert(data);

    // Return fake registered application.
    final registered = RegisteredMastodonApplication(
      id: '123',
      name: app.clientName,
      website: app.website,
      redirectUri: app.redirectUris,
      clientId: clientId,
      clientSecret: hash.toString(),
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
