import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Create a like for a post by its [id].
/// POST /api/v1/statuses/:id/favourite HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#favourite
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

  // Get the user who posted this from the database.
  final did = post.author.did;
  final user = await db.userRecords.filter().didEqualTo(did).findFirst();
  if (user == null) {
    throw Exception('User not found, this should not happen!: $did');
  }

  // Construct DID pair by hand.
  final pairs = {user.did: user.id};
  final mastodonPost = MastodonPost.fromBlueSkyPost(post, pairs);

  // Like the post now that we have everything in order.
  await bluesky.feeds.createLike(cid: post.cid, uri: post.uri);

  // Return the post that we just liked.
  return Response.json(
    body: mastodonPost,
  );
}
