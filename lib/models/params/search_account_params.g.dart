// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_account_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAccountParams _$SearchAccountParamsFromJson(Map<String, dynamic> json) =>
    SearchAccountParams(
      query: json['q'] as String,
      limit: json['limit'] == null ? 40 : stringToInt(json['limit'] as String?),
      offset:
          json['offset'] == null ? 0 : stringToInt(json['offset'] as String?),
      resolve: json['resolve'] == null
          ? false
          : handleBoolParameter(json['resolve'] as String?),
      following: json['following'] == null
          ? false
          : handleBoolParameter(json['following'] as String?),
    );

Map<String, dynamic> _$SearchAccountParamsToJson(
        SearchAccountParams instance) =>
    <String, dynamic>{
      'q': instance.query,
      'limit': intToString(instance.limit),
      'offset': intToString(instance.offset),
      'resolve': boolToInt(instance.resolve),
      'following': boolToInt(instance.following),
    };
