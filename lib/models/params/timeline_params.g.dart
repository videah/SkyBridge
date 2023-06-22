// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineParams _$TimelineParamsFromJson(Map<String, dynamic> json) =>
    TimelineParams(
      cursor: json['cursor'] as String?,
      maxId: json['max_id'] as String?,
      sinceId: json['since_id'] as String?,
      minId: json['min_id'] as String?,
      limit: json['limit'] == null ? 20 : int.parse(json['limit'] as String),
    );

Map<String, dynamic> _$TimelineParamsToJson(TimelineParams instance) =>
    <String, dynamic>{
      'max_id': instance.maxId,
      'since_id': instance.sinceId,
      'min_id': instance.minId,
      'limit': instance.limit,
      'cursor': instance.cursor,
    };
