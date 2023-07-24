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

/// Displays an authorization form to the user. If approved, it will create and
/// return an authorization code, then redirect to the desired redirect_uri, or
/// show the authorization code if urn:ietf:wg:oauth:2.0:oob was requested.
/// The authorization code can be used while requesting a token to
/// obtain access to user-level methods.
/// GET /oauth/authorize HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/oauth/#authorize
Future<Response> _get(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = OAuthAuthorizeParams.fromJson(params);

  final signedData = packObject(encodedParams.toJson());

  final file = File(path.join(Directory.current.path, 'public', 'auth.html'));
  final authHtml = await file.readAsString();

  final needBridgePass = env.getOrElse(
    'SKYBRIDGE_REQUIRE_AUTH_PASSWORD',
    () => 'true',
  );

  final requireBridgePassword = !(needBridgePass.toLowerCase() == 'false');
  final bridgeClass = requireBridgePassword ? '' : 'hidden';

  return Response(
    body: authHtml.format({
      'form_data': signedData,
      'bridge_password_class': bridgeClass,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.html.value,
    },
  );
}

/// Get sign-in information entered into the form by the user and process
/// it to redirect with an auth token code.
/// POST /oauth/authorize HTTP/1.1
Future<Response> _post(RequestContext context) async {
  final request = context.request;
  final data = await request.formData();
  final form = SignInForm.fromJson(data);

  final stuff = unpackObject(form.stuff);
  if (stuff == null) {
    return Response.json(
      statusCode: HttpStatus.badRequest,
      body: {
        'error': 'Missing signed form object.',
      },
    );
  }

  final auth = OAuthAuthorizeParams.fromJson(stuff);

  final needBridgePass = env.getOrElse(
    'SKYBRIDGE_REQUIRE_AUTH_PASSWORD',
    () => 'true',
  );

  // Check if we need a bridge password, and if so check the user entered
  // the correct one.
  final requireBridgePassword = !(needBridgePass.toLowerCase() == 'false');
  if (requireBridgePassword) {
    final bridgePassword = env.getOrElse(
      'SKYBRIDGE_AUTH_PASSWORD',
      () => throw Exception('SKYBRIDGE_AUTH_PASSWORD not set!'),
    );

    // Check if what the user entered matches the password we have on file.
    if (form.bridgePassword != bridgePassword) {
      print('User entered an invalid bridge password.');
      return Response.json(
        statusCode: HttpStatus.unauthorized,
        body: {
          'error': 'Bridge password does not match.',
        },
      );
    }
  }

  final code = OAuthTokenCode(
    token: base64.encode(randomBytes(32)),
    tokenSecret: base64.encode(randomBytes(48)),
    clientId: auth.clientId,
    scope: auth.scope,
    identifier: form.identifier,
    appPassword: form.appPassword,
    showRepliesInHome: form.showRepliesInHome,
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
      HttpHeaders.locationHeader: stringifyModifiedUri(
        redirectUriWithCode,
        auth.redirectUri,
      ),
    },
  );
}
