import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Posts that have been interacted with more than others.
/// GET /api/v1/trends/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/trends/#statuses
Future<Response> onRequest(RequestContext context) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the popular feed, this could break in the future since it's
  // not part of the spec and the bluesky devs intend to switch to a
  // way of picking your own algorithm.
  final feed = await bluesky.unspecced.findPopularFeed(limit: 40);

  // Take all the posts and convert them to Mastodon ones
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() async {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
    return Future.wait(futures);
  });

  return threadedJsonResponse(
    body: posts,
  );
}
