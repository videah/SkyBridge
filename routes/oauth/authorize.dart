import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:path/path.dart' as path;
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_token_code.dart';
import 'package:sky_bridge/models/oauth/sign_in_form_data.dart';
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
  final adjustedParams = {
    'purpose': 'auth',
  }..addAll(params);

  final signedData = packObject(adjustedParams);

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
  final form = await request.formData();
  final data = form.fields['stuff']!;

  final stuff = await unpackObject(data);
  final auth = SignInFormData.fromJson(stuff!);

  final code = OAuthTokenCode(
    purpose: 'token',
    token: 'gay',
    tokenSecret: 'gay',
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
