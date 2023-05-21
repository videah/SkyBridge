import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Repost a post.
/// POST /api/v1/statuses/:id/reblog HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#boost
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // Only allow POST requests.
  if (context.request.method != HttpMethod.post) {
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

  // Get the user who posted this from the database.
  final did = post.author.did;
  final user = await db.userRecords.filter().didEqualTo(did).findFirst();
  if (user == null) {
    throw Exception('User not found, this should not happen!: $did');
  }

  final mastodonPost = await db.writeTxn(
    () => MastodonPost.fromBlueSkyPost(post),
  );

  // Repost the post now that we have everything in order.
  final repost = await mastodonPost.repost(bluesky);
  if (repost == null) return Response(statusCode: HttpStatus.notFound);

  // Return the repost we just created.
  return threadedJsonResponse(
    body: repost,
  );
}
