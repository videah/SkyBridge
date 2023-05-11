import 'package:bluesky/bluesky.dart' as bsky;
import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_notification.g.dart';

/// Represents a notification of an event relevant to the user.
@JsonSerializable()
class MastodonNotification {
  /// Constructs an instance of [MastodonNotification].
  MastodonNotification({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.account,
    this.status,
  });

  /// Converts JSON into a [MastodonNotification] instance.
  factory MastodonNotification.fromJson(Map<String, dynamic> json) =>
      _$MastodonNotificationFromJson(json);

  /// Converts the [MastodonNotification] to JSON.
  Map<String, dynamic> toJson() => _$MastodonNotificationToJson(this);

  /// Takes a list of [bsky.Notification]s and converts them to a list of
  /// [MastodonNotification]s with the appropriate post data attached.
  ///
  /// DO NOT execute in a [db] transaction, this is handled internally.
  static Future<List<MastodonNotification>> fromNotificationList(
    List<bsky.Notification> notifs,
    bsky.Bluesky bluesky,
  ) async {
    final pairs = <bsky.Notification, bsky.AtUri?>{};
    final postUris = <bsky.AtUri>[];

    // Find the appropriate record for each notification.
    for (final notification in notifs) {
      final unknownRecord = notification.record ?? {};
      // What type of notification is this?
      switch (notification.reason.name) {
        case 'like':
          final subject = unknownRecord['subject'] as Map<String, dynamic>;
          final uriString = subject['uri'] as String;
          final uri = bsky.AtUri.parse(uriString);

          pairs[notification] = uri;
          // If we don't already have this URI marked down, add it to the list.
          if (!postUris.contains(uri)) postUris.add(uri);
          break;
        case 'reply':
          final record = bsky.PostRecord.fromJson(unknownRecord);
          final uri = notification.uri;

          // We store the ID of the post that was replied to
          // in the record for later.
          final reply = record.reply;
          if (reply != null) {
            if (!postUris.contains(reply.parent.uri)) {
              postUris.add(reply.parent.uri);
            }
          }

          pairs[notification] = uri;
          // If we don't already have this URI marked down, add it to the list.
          if (!postUris.contains(uri)) postUris.add(uri);
          break;
        case 'follow':
          // Follows don't have an attached post so we can just store null.
          pairs[notification] = null;
          break;
      }
    }

    // Get all the posts that we need to attach to the notifications in
    // an efficient way that takes Bluesky's maximum URI count. Chunks the
    // requests into groups of 25.
    final posts = await chunkResults<bsky.Post, bsky.AtUri>(
      items: postUris,
      callback: (chunk) async {
        final response = await bluesky.feeds.findPosts(uris: chunk);
        return response.data.posts;
      },
    );

    // Construct each individual notification with the appropriate post data.
    final notifications = <MastodonNotification>[];
    Future<void> constructNotification(
      bsky.Notification notification,
      bsky.AtUri? uri,
    ) async {
      final record = await notificationToDatabase(notification);

      // Find the post that matches the URI in posts
      final post = posts.firstWhereOrNull(
        (post) => post.uri.toString() == uri.toString(),
      );
      final type = NotificationType.fromBluesky(notification.reason.name);
      final mastodonNotification = MastodonNotification(
        id: record.id.toString(),
        type: type,
        createdAt: notification.indexedAt,
        account: await MastodonAccount.fromActor(notification.author),
        status: post != null ? await MastodonPost.fromBlueSkyPost(post) : null,
      );
      notifications.add(mastodonNotification);
    }

    // All notifications are constructed asynchronously and need to be done in
    // a database transaction context.
    await db.writeTxn(() async {
      final futures = <Future<void>>[];
      pairs.forEach((notification, uri) async {
        futures.add(constructNotification(notification, uri));
      });
      await Future.wait(futures);
    });

    // Sort notifications by [createdAt] so newest are first.
    notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return notifications;
  }

  /// The id of the notification in the database.
  final String id;

  /// The type of event that resulted in a notification.
  final NotificationType type;

  /// The timestamp of the notification.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime createdAt;

  /// The account that performed the action that generated the notification.
  final MastodonAccount account;

  /// [MastodonPost] that was the object of the notification.
  /// Attached when [type] is [NotificationType.favourite],
  /// [NotificationType.reblog], [NotificationType.mention],
  /// [NotificationType.poll], or [NotificationType.update].
  final MastodonPost? status;
}

/// The type of event that resulted in a notification.
enum NotificationType {
  /// Someone mentioned you in their status.
  @JsonValue('mention')
  mention,

  /// Someone you enable notifications for has created a post.
  @JsonValue('status')
  status,

  /// Someone reposted one of your statuses.
  @JsonValue('reblog')
  reblog,

  /// Someone followed you.
  @JsonValue('follow')
  follow,

  /// Someone requested to follow you.
  @JsonValue('follow_request')
  followRequest,

  /// Someone liked one of your posts.
  @JsonValue('favourite')
  favourite,

  /// A poll you have voted in or created has ended.
  @JsonValue('poll')
  poll,

  /// A post you interacted with has been edited.
  @JsonValue('update')
  update,

  /// Someone signed up (optionally sent to admins).
  @JsonValue('admin.sign_up')
  adminSignUp,

  /// A new report has been filed.
  @JsonValue('admin.report')
  adminReport;

  /// Types of notifications that can be received from Bluesky assigned to
  /// a [NotificationType].
  static final type = {
    'like': NotificationType.favourite,
    'repost': NotificationType.reblog,
    'follow': NotificationType.follow,
    'reply': NotificationType.mention,
    'quote': NotificationType.mention,
  };

  /// Types of notifications that have posts attached.
  static final typesThatHavePosts = [
    NotificationType.favourite,
    NotificationType.reblog,
    NotificationType.mention,
    NotificationType.poll,
    NotificationType.update,
  ];

  /// Whether or not the notification has a post attached.
  bool get hasPost => typesThatHavePosts.contains(this);

  /// Converts a Bluesky notification type to a [NotificationType].
  static NotificationType fromBluesky(String name) =>
      type[name] ?? NotificationType.follow;
}
