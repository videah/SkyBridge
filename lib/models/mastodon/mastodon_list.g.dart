// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonList _$MastodonListFromJson(Map<String, dynamic> json) => MastodonList(
      title: json['title'] as String,
      repliesPolicy:
          $enumDecode(_$RepliesPolicyEnumMap, json['replies_policy']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$MastodonListToJson(MastodonList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'replies_policy': _$RepliesPolicyEnumMap[instance.repliesPolicy]!,
    };

const _$RepliesPolicyEnumMap = {
  RepliesPolicy.followed: 'followed',
  RepliesPolicy.list: 'list',
  RepliesPolicy.none: 'none',
};
