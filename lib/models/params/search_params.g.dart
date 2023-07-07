// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchParams _$SearchParamsFromJson(Map<String, dynamic> json) => SearchParams(
      query: json['q'] as String,
      type: $enumDecodeNullable(_$SearchTypeEnumMap, json['type']),
      resolve: json['resolve'] == null
          ? false
          : handleBoolParameter(json['resolve'] as String?),
      following: json['following'] == null
          ? false
          : handleBoolParameter(json['following'] as String?),
      accountId: json['account_id'] as String?,
      excludeUnreviewed: json['exclude_unreviewed'] == null
          ? false
          : handleBoolParameter(json['exclude_unreviewed'] as String?),
      maxId: json['max_id'] as String?,
      minId: json['min_id'] as String?,
      limit: json['limit'] == null ? 20 : stringToInt(json['limit'] as String?),
      offset: stringToInt(json['offset'] as String?),
    );

Map<String, dynamic> _$SearchParamsToJson(SearchParams instance) =>
    <String, dynamic>{
      'q': instance.query,
      'type': _$SearchTypeEnumMap[instance.type],
      'resolve': instance.resolve,
      'following': instance.following,
      'account_id': instance.accountId,
      'exclude_unreviewed': instance.excludeUnreviewed,
      'max_id': instance.maxId,
      'min_id': instance.minId,
      'limit': instance.limit,
      'offset': instance.offset,
    };

const _$SearchTypeEnumMap = {
  SearchType.accounts: 'accounts',
  SearchType.hashtags: 'hashtags',
  SearchType.statuses: 'statuses',
};
