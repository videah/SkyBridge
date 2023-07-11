import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_list.dart';
import 'package:sky_bridge/util.dart';

/// Create a new list.
/// This is used to create custom feed entries in Bluesky's case.
/// GET /api/v1/lists HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/lists/#get
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    // Get a bluesky connection/session from the a provided bearer token.
    // If the token is invalid, bail out and return an error.
    final bluesky = await blueskyFromContext(context);
    if (bluesky == null) return authError();

    var lists = <MastodonList>[];

    // Get saved feeds from the user's preferences.
    final response = await bluesky.actors.findPreferences();
    for (final preference in response.data.preferences) {
      await preference.map(
        adultContent: (_) {},
        contentLabel: (_) {},
        savedFeeds: (feedUris) async {
          // Get the feed generator views for each saved feed, giving us info
          // like the name of the feed and the accompanying IDs.
          final result = await chunkResults<bsky.FeedGeneratorView, bsky.AtUri>(
            items: feedUris.data.savedUris,
            callback: (chunk) async {
              final response = await bluesky.feeds.findGenerators(
                uris: feedUris.data.savedUris,
              );
              return response.data.feeds;
            },
          );

          // Convert the feed generator views to [MastodonList]'s, storing
          // any info in the database we might need to access later.
          lists = await databaseTransaction(() async {
            final listFutures = result.map(
              MastodonList.fromFeedGenerator,
            );
            return Future.wait(listFutures);
          });
        },
        unknown: (_) {},
      );
    }

    return threadedJsonResponse(
      body: lists,
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
