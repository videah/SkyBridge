import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:path/path.dart' as path;
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/forms/sign_in_form.dart';
import 'package:sky_bridge/models/oauth/oauth_authorize_params.dart';
import 'package:sky_bridge/models/oauth/oauth_token_code.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = OAuthAuthorizeParams.fromJson(params);

  final signedData = packObject(encodedParams.toJson());

  final file = File(path.join(Directory.current.path, 'public', 'auth.html'));
  final authHtml = await file.readAsString();

  return Response(
    body: authHtml.format({
      'form_data': signedData,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.html.value,
    },
  );
}

Future<Response> _post(RequestContext context) async {
  final request = context.request;
  final data = await request.formData();
  print(data);
  final form = SignInForm.fromJson(data);

  final stuff = unpackObject(form.stuff);
  final auth = OAuthAuthorizeParams.fromJson(stuff!);

  final authPassword = env.getOrElse(
    'SKYBRIDGE_AUTH_PASSWORD',
    () => throw Exception('SKYBRIDGE_AUTH_PASSWORD not set!'),
  );

  // Check if what the user entered matches the password we have on file.
  if (form.password != authPassword) {
    return Response.json(
      statusCode: HttpStatus.unauthorized,
      body: {
        'error': 'Password does not match.',
      },
    );
  }

  final code = OAuthTokenCode(
    token: base64.encode(randomBytes(32)),
    tokenSecret: base64.encode(randomBytes(48)),
    clientId: auth.clientId,
    scope: auth.scope,
  );

  final signedCode = packObject(code.toJson());

  final redirectUri = Uri.parse(auth.redirectUri);
  final redirectUriWithCode = redirectUri.replace(
    queryParameters: {
      'code': signedCode,
    },
  );

  return Response(
    statusCode: HttpStatus.found,
    headers: {
      HttpHeaders.locationHeader: redirectUriWithCode.toString(),
    },
  );
}
