import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/models/mastodon/mastodon_notification.dart';
import 'package:sky_bridge/models/params/notification_params.dart';
import 'package:sky_bridge/util.dart';

/// Receive notifications for activity on your account or posts.
/// GET /api/v1/notifications HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/notifications/#get
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final params = context.request.uri.queryParameters;
  final encodedParams = NotificationParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final limit = encodedParams.limit <= 100 ? encodedParams.limit : 100;
  // Fetch the notifications with the given parameters.
  final response = await bluesky.notification.listNotifications(
    limit: limit,
    cursor: encodedParams.cursor,
  );
  final nextCursor = response.data.cursor;

  // Convert the response into a list of MastodonNotification objects with
  // the appropriate types and data.
  final notifs = await MastodonNotification.fromNotificationList(
    response.data.notifications,
    bluesky,
  );

  var headers = <String, String>{};
  if (notifs.isNotEmpty) {
    headers = generatePaginationHeaders(
      items: notifs,
      requestUri: context.request.uri,
      nextCursor: nextCursor ?? '',
      getId: (notification) => BigInt.parse(notification.id),
    );
  }

  return threadedJsonResponse(
    body: notifs,
    headers: headers,
  );
}
