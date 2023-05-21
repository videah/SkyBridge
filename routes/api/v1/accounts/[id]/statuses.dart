import 'dart:async';
import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/statuses_params.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final params = context.request.uri.queryParameters;
  final options = StatusesParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  // If we're being asked for pinned posts we return nothing because
  // Bluesky does not have a concept of pinned posts.
  if (options.pinned) {
    return Response.json(
      body: [],
    );
  }

  final user = await db.userRecords.get(int.parse(id));
  if (user == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Get the users posts.
  final feed = await bluesky.feeds.findFeed(actor: user.did, limit: 40);

  // Take all the posts and convert them to MastodonPost futures
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() {
    final futures = feed.data.feed.map(MastodonPost.fromFeedView).toList();
    return Future.wait(futures);
  });

  final exclude = options.excludeReblogs;
  if (exclude) {
    // Remove all posts that are reposts
    posts.removeWhere((post) => post.account.username != session.handle);
  }

  return threadedJsonResponse(
    body: posts,
  );
}
