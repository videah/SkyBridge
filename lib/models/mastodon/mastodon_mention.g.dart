// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonMention _$MastodonMentionFromJson(Map<String, dynamic> json) =>
    MastodonMention(
      id: json['id'] as String,
      username: json['username'] as String,
      url: json['url'] as String,
      acct: json['acct'] as String,
    );

Map<String, dynamic> _$MastodonMentionToJson(MastodonMention instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'url': instance.url,
      'acct': instance.acct,
    };
