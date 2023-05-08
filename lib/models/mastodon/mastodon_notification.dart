import 'dart:math';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
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

  static Future<MastodonNotification> fromNotification(
    bsky.Notification notif,
  ) async {
    // Match the notification type to the Mastodon equivalent
    final type = {
          'like': NotificationType.favourite,
          'repost': NotificationType.reblog,
          'follow': NotificationType.follow,
          'reply': NotificationType.mention,
          'quote': NotificationType.mention,
        };

    final hasPost = [
      NotificationType.favourite,
      NotificationType.reblog,
      NotificationType.mention,
      NotificationType.poll,
      NotificationType.update,
    ].contains(type[notif.reason.name]);

    // Random ID
    final random = Random(1000000);
    return MastodonNotification(
      id: random.toString(), // FIXME
      type: type[notif.reason.name] ?? NotificationType.follow,
      createdAt: notif.indexedAt,
      account: await MastodonAccount.fromActor(notif.author),
      // status: MastodonPost.fromBlueSkyPost(),
    );
  }

  /// Converts JSON into a [MastodonNotification] instance.
  factory MastodonNotification.fromJson(Map<String, dynamic> json) =>
      _$MastodonNotificationFromJson(json);

  /// Converts the [MastodonNotification] to JSON.
  Map<String, dynamic> toJson() => _$MastodonNotificationToJson(this);

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
  adminReport,
}
