// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationParams _$NotificationParamsFromJson(Map<String, dynamic> json) =>
    NotificationParams(
      maxId: json['max_id'] as String?,
      sinceId: json['since_id'] as String?,
      minId: json['min_id'] as String?,
      limit: json['limit'] == null ? 15 : int.parse(json['limit'] as String),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      excludeTypes: (json['exclude_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accountId: json['account_id'] as String?,
    );

Map<String, dynamic> _$NotificationParamsToJson(NotificationParams instance) =>
    <String, dynamic>{
      'max_id': instance.maxId,
      'since_id': instance.sinceId,
      'min_id': instance.minId,
      'limit': instance.limit,
      'types': instance.types,
      'exclude_types': instance.excludeTypes,
      'account_id': instance.accountId,
    };
