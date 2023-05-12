import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';

Future<Response> onRequest(RequestContext context) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final feed = await bluesky.feeds.findTimeline(limit: 40);

  // Take all the posts and convert them to Mastodon ones
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() async {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
    return Future.wait(futures);
  });

  // Get the parent posts for each post.
  final processedPosts = await processParentPosts(bluesky, posts);

  return Response.json(
    body: processedPosts,
  );
}
