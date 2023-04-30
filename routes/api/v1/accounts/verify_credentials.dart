import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  final profile = await bluesky.actors.findProfile(actor: connection.did);

  // Mark down any new posts we see in the database.
  final pairs = await markDownAccountProfiles([profile.data]);

  final account = MastodonAccount.fromActorProfile(profile.data, pairs);

  return Response.json(
    body: account,
  );
}
