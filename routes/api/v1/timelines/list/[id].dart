import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/feed_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// View posts in the given list timeline.
/// GET /api/v1/timelines/list/:list_id HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/timelines/#list
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

  // Get the media attachment from the database.
  final idNumber = int.parse(id);
  final record = await db.feedRecords.get(idNumber);
  if (record == null) return Response(statusCode: HttpStatus.notFound);

  final feed = await bluesky.feeds.findCustomFeed(
    generatorUri: bsky.AtUri.parse(record.uri),
  );

  // Take all the posts and convert them to Mastodon ones
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() async {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
    return Future.wait(futures);
  });

  // Get the parent posts for each post.
  final processedPosts = await processParentPosts(bluesky, posts);

  // Return the post that we just liked.
  return threadedJsonResponse(
    body: processedPosts,
  );
}
