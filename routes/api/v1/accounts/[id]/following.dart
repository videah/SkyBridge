import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Returns accounts which follow the given account.
/// GET /api/v1/accounts/:id/following HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#following
Future<Response> onRequest(RequestContext context, String id) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the user from the database.
  // If the user is not in the database we return 404.
  final idNumber = BigInt.parse(id);
  final userRecord = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (userRecord == null) return Response(statusCode: HttpStatus.notFound);

  final response = await bluesky.graph.getFollows(actor: userRecord.did);

  // Get all the handles from the results and grab the full profile info.
  final handles = response.data.follows.map((actor) => actor.handle).toList();

  // We need to chunk the results because the Bluesky server has a limit on the
  // number of actors you can query at once.
  final profiles = await chunkResults<bsky.ActorProfile, String>(
    items: handles,
    callback: (chunk) async {
      final response = await bluesky.actor.getProfiles(actors: chunk);
      return response.data.profiles;
    },
  );

  // Convert the profiles to MastodonAccount objects.
  final follows = await databaseTransaction(() {
    return Future.wait(
      profiles.map(MastodonAccount.fromActorProfile),
    );
  });

  return threadedJsonResponse(
    body: follows,
  );
}
