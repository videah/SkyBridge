// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonAccount _$MastodonAccountFromJson(Map<String, dynamic> json) =>
    MastodonAccount(
      id: json['id'] as String,
      username: json['username'] as String,
      acct: json['acct'] as String,
      displayName: json['display_name'] as String,
      locked: json['locked'] as bool,
      bot: json['bot'] as bool,
      createdAt: dateTimeFromEpoch(json['created_at'] as int),
      note: json['note'] as String,
      url: json['url'] as String,
      avatar: json['avatar'] as String,
      avatarStatic: json['avatar_static'] as String,
      header: json['header'] as String?,
      headerStatic: json['header_static'] as String?,
      followersCount: json['followers_count'] as int?,
      followingCount: json['following_count'] as int?,
      statusesCount: json['statuses_count'] as int?,
      lastStatusAt: dateTimeFromEpoch(json['last_status_at'] as int),
      source: json['source'] as Map<String, dynamic>,
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$MastodonAccountToJson(MastodonAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'acct': instance.acct,
      'display_name': instance.displayName,
      'locked': instance.locked,
      'bot': instance.bot,
      'created_at': dateTimeToEpoch(instance.createdAt),
      'note': instance.note,
      'url': instance.url,
      'avatar': instance.avatar,
      'avatar_static': instance.avatarStatic,
      'header': instance.header,
      'header_static': instance.headerStatic,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'statuses_count': instance.statusesCount,
      'last_status_at': dateTimeToEpoch(instance.lastStatusAt),
      'source': instance.source,
      'emojis': instance.emojis,
      'fields': instance.fields,
    };
