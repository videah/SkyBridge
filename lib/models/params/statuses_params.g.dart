// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statuses_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusesParams _$StatusesParamsFromJson(Map<String, dynamic> json) =>
    StatusesParams(
      excludeReblogs: json['exclude_reblogs'] == null
          ? false
          : _intToBool(json['exclude_reblogs'] as String?),
      limit:
          json['limit'] == null ? 20 : _stringToInt(json['limit'] as String?),
    );

Map<String, dynamic> _$StatusesParamsToJson(StatusesParams instance) =>
    <String, dynamic>{
      'exclude_reblogs': _boolToInt(instance.excludeReblogs),
      'limit': _intToString(instance.limit),
    };
