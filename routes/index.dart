import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';

Future<Response> onRequest(RequestContext context) async{
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  return Response.json(
    body: {},
  );
}
