import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/models/mastodon/mastodon_notification.dart';
import 'package:sky_bridge/util.dart';

/// Publish a new post with the given parameters.
/// POST /api/v1/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#create
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // Construct bluesky connection.
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  final response = await bluesky.notifications.findNotifications();

  final notifs = await MastodonNotification.fromNotificationList(
    response.data.notifications,
    bluesky,
  );

  return Response.json(
    body: notifs,
  );
}
