import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Obtain information about a post.
/// GET /api/v1/statuses/:id HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#get
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // If the id is not a number we return 404 for now.
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Construct bluesky connection.
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  // Get the post from the database.
  // If the post is not in the database we return 404.
  final idNumber = int.parse(id);
  final postRecord = await db.postRecords.get(idNumber);
  if (postRecord == null) Response(statusCode: HttpStatus.notFound);

  // Get the post from bluesky, we assume we already know the post exists
  // and don't bother adding to the database or anything.
  final uri = bsky.AtUri.parse(postRecord!.uri);
  final response = await bluesky.feeds.findPosts(uris: [uri]);
  final post = response.data.posts.first;

  final mastodonPost = await db.writeTxn(
    () => MastodonPost.fromBlueSkyPost(post),
  );

  final processedPost = await processParentPosts(bluesky, [mastodonPost]);

  // Return the post that we just liked.
  return Response.json(
    body: processedPost,
  );
}
