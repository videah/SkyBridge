import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// View posts above and below this spost in the thread.
/// GET /api/v1/statuses/:id/context HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#context
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
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  // Get the post from the database.
  // If the post is not in the database we return 404.
  final idNumber = int.parse(id);
  final postRecord = await db.postRecords.get(idNumber);
  if (postRecord == null) Response(statusCode: HttpStatus.notFound);

  final posts = await bluesky.feeds.findPostThread(
    uri: bsky.AtUri.parse(postRecord!.uri),
  );

  final parents = <MastodonPost>[];
  final replies = <MastodonPost>[];
  await db.writeTxn(
    () async => replies.addAll(await traverseReplies(posts.data.thread, 0)),
  );

  return Response.json(
    body: {
      'descendants': replies,
      'ancestors': parents,
    },
  );
}
