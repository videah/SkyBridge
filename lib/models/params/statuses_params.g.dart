// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statuses_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesParams _$StatusesParamsFromJson(Map<String, dynamic> json) =>
    StatusesParams(
      excludeReblogs: json['exclude_reblogs'] == null
          ? false
          : handleBoolParameter(json['exclude_reblogs'] as String?),
      limit: json['limit'] == null ? 20 : stringToInt(json['limit'] as String?),
      pinned: json['pinned'] == null
          ? false
          : handleBoolParameter(json['pinned'] as String?),
    );

Map<String, dynamic> _$StatusesParamsToJson(StatusesParams instance) =>
    <String, dynamic>{
      'exclude_reblogs': boolToInt(instance.excludeReblogs),
      'limit': intToString(instance.limit),
      'pinned': boolToInt(instance.pinned),
    };
