import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// View posts above and below this post in the thread.
/// GET /api/v1/statuses/:id/context HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#context
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

  final posts = await bluesky.feeds.findPostThread(
    uri: bsky.AtUri.parse(postRecord!.uri),
  );

  final parents = <MastodonPost>[];
  final replies = <MastodonPost>[];

  // Get all the post replies.
  final replyFuture = databaseTransaction(
    () async => replies.addAll(await traverseReplies(posts.data.thread, 0)),
  );

  // Get all the post parents.
  final parentFuture = databaseTransaction(
    () async => parents.addAll(await traverseParents(posts.data.thread, 0)),
  );

  // Process both asynchronously.
  await Future.wait([replyFuture, parentFuture]);

  return threadedJsonResponse(
    body: {
      'descendants': replies,
      'ancestors': parents,
    },
  );
}
