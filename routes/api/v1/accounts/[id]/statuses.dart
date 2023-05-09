import 'dart:async';
import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/statuses_params.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final params = context.request.uri.queryParameters;
  final options = StatusesParams.fromJson(params);

  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(
    connection,
  );

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

  // Get the users profile.
  final profile = await bluesky.actors.findProfile(actor: user.did);
  final profileInfo = ProfileInfo.fromActorProfile(profile.data);

  // Get the users posts.
  final feed = await bluesky.feeds.findFeed(actor: user.did, limit: 40);

  // Take all the posts and convert them to MastodonPost futures
  // Await all the futures, getting any necessary data from the database.
  final posts = await db.writeTxn(() {
    final futures = feed.data.feed.map((view) {
      return MastodonPost.fromFeedView(view, profile: profileInfo);
    }).toList();
    return Future.wait(futures);
  });

  final exclude = options.excludeReblogs;
  if (exclude) {
    // Remove all posts that are reposts
    posts.removeWhere((post) => post.account.username != connection.handle);
  }

  return Response.json(
    body: posts,
  );
}
