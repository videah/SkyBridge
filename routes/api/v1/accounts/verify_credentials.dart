import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';

Future<Response> onRequest(RequestContext context) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  final profile = await bluesky.actors.findProfile(actor: session.did);

  final account = await db.writeTxn(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  return Response.json(
    body: account,
  );
}
