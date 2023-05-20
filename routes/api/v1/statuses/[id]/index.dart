import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';

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
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

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

  // Process replies.
  final processedPost = await processParentPosts(bluesky, [mastodonPost]);

  return Response.json(
    body: processedPost.first,
  );
}
