import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/models/params/search_params.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Perform a search.
/// GET /api/v2/search HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/search/#v2
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final body = context.request.uri.queryParameters;
  final params = SearchParams.fromJson(body);

  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // HACK: Ivory uses this endpoint to find unknown posts (like say, in a fake
  // quote post embed) so we detect if the query is a link that contains
  // te base URL and handle it appropriately.
  if (params.limit == 1 &&
      params.resolve == true &&
      params.type == SearchType.statuses) {
    // Do some Regex with /^(.+)\/@([^/]+)\/(\d+)$/
    final match = RegExp(r'^(.+)\/@([^/]+)\/(\d+)$')
        .firstMatch(params.query)
        ?.groups([1, 2, 3]);

    final postId = match?[2];
    if (postId != null) {
      // Get the post from the database.
      // If the post is not in the database we return 404.
      final postRecord = await db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(id: BigInt.parse(postId)),
      );
      if (postRecord == null) Response(statusCode: HttpStatus.notFound);

      // Get the post from bluesky, we assume we already know the post exists
      // and don't bother adding to the database or anything.
      final uri = bsky.AtUri.parse(postRecord!.uri);
      final response = await bluesky.feeds.findPosts(uris: [uri]);
      final post = response.data.posts.first;

      final mastodonPost = await databaseTransaction(
        () => MastodonPost.fromBlueSkyPost(post),
      );

      // Process replies.
      final processedPost = await processParentPosts(bluesky, [mastodonPost]);

      return threadedJsonResponse(
        body: {
          'hashtags': [],
          'accounts': [],
          'statuses': [processedPost.first],
        },
      );
    }
  }

  return Response(statusCode: HttpStatus.notFound);
}
