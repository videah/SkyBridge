import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  final profile = await bluesky.actors.findProfile(actor: connection.did);

  final account = await db.writeTxn(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  return Response.json(
    body: account,
  );
}
