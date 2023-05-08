import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(
    connection,
  );

  final feed = await bluesky.feeds.findTimeline(limit: 40);

  // Take all the posts and convert them to Mastodon ones
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() async {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
    return Future.wait(futures);
  });

  return Response.json(
    body: posts,
  );
}
