import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// View who reblogged a given post.
/// GET /api/v1/statuses/:id/reblogged_by HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#reblogged_by
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // If the id is not a number we return 404 for now.
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the post from the database.
  // If the post is not in the database we return 404.
  final idNumber = BigInt.parse(id);
  final postRecord = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(id: idNumber),
  );
  if (postRecord == null) Response(statusCode: HttpStatus.notFound);

  final response = await bluesky.feed.getRepostedBy(
    uri: bsky.AtUri.parse(postRecord!.uri),
  );

  // Construct a list of handles from the response.
  final handles = response.data.repostedBy.map((act) => act.handle).toList();

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
  final rebloggers = await databaseTransaction(() {
    return Future.wait(
      profiles.map(MastodonAccount.fromActorProfile),
    );
  });

  return threadedJsonResponse(
    body: rebloggers,
  );
}
