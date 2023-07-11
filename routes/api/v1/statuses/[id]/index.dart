import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Obtain information about a post.
/// GET /api/v1/statuses/:id HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#get
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // If the id is not a number we return 404 for now.
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Construct bluesky connection.
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


    // Get the post from bluesky, we assume we already know the post exists
    // and don't bother adding to the database or anything.
    final uri = bsky.AtUri.parse(postRecord!.uri);
    final response = await bluesky.feeds.findPosts(uris: [uri]);
    final post = response.data.posts.first;

    final mastodonPost = await databaseTransaction(
      () => MastodonPost.fromBlueSkyPost(post),
    );

    // Process replies.
    final processedPost = await processParentPosts(bluesky, [mastodonPost]);

  if (context.request.method == HttpMethod.get) {
    return threadedJsonResponse(
      body: processedPost.first,
    );
  } else if (context.request.method == HttpMethod.delete) {
    // Delete the post from bluesky.
    await bluesky.repositories.deleteRecord(uri: uri);

    return threadedJsonResponse(
      body: processedPost.first,
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
