import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';

Response onRequest(RequestContext context) {
  if (!isAuthenticated(context)) return authError();

  return Response.json(
    body: {},
  );
}
