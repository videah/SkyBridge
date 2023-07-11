import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/timeline_params.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = TimelineParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final List<MastodonPost> allPosts;
  String? nextCursor;

  // Check if we should allow posts to be backfilled.
  final backfillAllowed = env
      .getOrElse(
        'SKYBRIDGE_ALLOW_BACKFILL',
        () => 'false',
      )
      .toLowerCase();

  if (encodedParams.isNewPostsRequest && backfillAllowed == 'true') {
    // Get all the posts following minId so that Ivory can backfill its timeline
    allPosts = [];

    final lastRead = BigInt.parse(encodedParams.minId!);
    BigInt? maxID;
    String? prevCursor;
    var done = false;

    while (!done) {
      final feed = await bluesky.feeds.findTimeline(
        limit: 100,
        cursor: prevCursor,
      );

      final posts = await databaseTransaction(() async {
        final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
        return Future.wait(futures);
      });

      for (final post in posts) {
        final id = BigInt.parse(post.id);
        if (id <= lastRead) {
          // We've seen the last-read post (or something older than that).
          // That means we're fully caught up with the supplied min_id
          done = true;
          break;
        }

        if (maxID == null || id < maxID) {
          maxID = id - BigInt.one;
        }

        allPosts.add(post);
      }

      print(
        'Loaded ${posts.length} posts (total ${allPosts.length}, new maxID=$maxID)',
      );
      prevCursor = feed.data.cursor;

      if (posts.length < 25) {
        // Bail early and don't try to fetch more posts if the batch was tiny
        done = true;
      }
    }

    nextCursor = prevCursor;
  } else {
    // Make a single, standard request
    final feed = await bluesky.feeds.findTimeline(
      limit: encodedParams.limit,
      cursor: encodedParams.cursor,
    );

    allPosts = await databaseTransaction(() async {
      final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
      return Future.wait(futures);
    });
    nextCursor = feed.data.cursor;
  }

  // Get the parent posts for each post.
  final processedPosts = await processParentPosts(bluesky, allPosts);

  final headers = <String, Object>{};
  if (processedPosts.isNotEmpty && backfillAllowed == 'true') {
    final uri = context.request.uri;

    var lowestID = BigInt.parse('99999999999999999999');
    var highestID = BigInt.from(0);
    for (final post in processedPosts) {
      final id = BigInt.parse(post.id);
      if (id < lowestID) {
        lowestID = id;
      }
      if (id > highestID) {
        highestID = id;
      }
    }

    final prevParams = {'min_id': highestID.toString()};
    final nextParams = {'cursor': nextCursor};
    final prevURI = uri.replace(queryParameters: prevParams);
    final nextURI = uri.replace(queryParameters: nextParams);
    headers['Link'] = '<$prevURI>; rel="prev", <$nextURI>; rel="next"';
  }

  // If the user prefers not to see replies, we need to filter them out.
  final preferences = preferencesFromContext(context);
  if (!preferences.showRepliesInHome) {
    processedPosts.removeWhere((post) => post.inReplyToId != null);
  }

  return threadedJsonResponse(body: processedPosts, headers: headers);
}
