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

  // Get all accounts that are in the feed and add them to the database.
  final accounts = feed.data.feed.map((view) => view.post.author).toList();

  // Mark down any new posts we see in the database.
  final pairs = await markDownFeedView(feed.data.feed)
    ..addAll(await markDownAccounts(accounts));

  // Take all the posts and convert them to Mastodon ones
  final posts = feed.data.feed.map((view) {
    return MastodonPost.fromFeedView(view, pairs);
  }).toList();

  return Response.json(
    body: posts,
  );
}
