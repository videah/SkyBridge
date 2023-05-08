// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonNotification _$MastodonNotificationFromJson(
        Map<String, dynamic> json) =>
    MastodonNotification(
      id: json['id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      createdAt: dateTimeFromISO8601(json['created_at'] as String),
      account:
          MastodonAccount.fromJson(json['account'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : MastodonPost.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MastodonNotificationToJson(
        MastodonNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'created_at': dateTimeToISO8601(instance.createdAt),
      'account': instance.account,
      'status': instance.status,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.mention: 'mention',
  NotificationType.status: 'status',
  NotificationType.reblog: 'reblog',
  NotificationType.follow: 'follow',
  NotificationType.followRequest: 'follow_request',
  NotificationType.favourite: 'favourite',
  NotificationType.poll: 'poll',
  NotificationType.update: 'update',
  NotificationType.adminSignUp: 'admin.sign_up',
  NotificationType.adminReport: 'admin.report',
};
