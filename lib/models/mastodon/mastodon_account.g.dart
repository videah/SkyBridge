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
      createdAt: dateTimeFromISO8601(json['created_at'] as String),
      note: json['note'] as String,
      url: json['url'] as String,
      avatar: json['avatar'] as String,
      avatarStatic: json['avatar_static'] as String,
      lastStatusAt: dateTimeFromISO8601(json['last_status_at'] as String),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      header: json['header'] as String?,
      headerStatic: json['header_static'] as String?,
      followersCount: json['followers_count'] as int? ?? 0,
      followingCount: json['following_count'] as int? ?? 0,
      statusesCount: json['statuses_count'] as int? ?? 0,
      source: json['source'] == null
          ? null
          : AccountSource.fromJson(json['source'] as Map<String, dynamic>),
      role: json['role'] == null
          ? null
          : AccountRole.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MastodonAccountToJson(MastodonAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'acct': instance.acct,
      'display_name': instance.displayName,
      'locked': instance.locked,
      'bot': instance.bot,
      'created_at': dateTimeToISO8601(instance.createdAt),
      'note': instance.note,
      'url': instance.url,
      'avatar': instance.avatar,
      'avatar_static': instance.avatarStatic,
      'header': instance.header,
      'header_static': instance.headerStatic,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'statuses_count': instance.statusesCount,
      'last_status_at': dateTimeToISO8601(instance.lastStatusAt),
      'emojis': instance.emojis,
      'fields': instance.fields,
      'source': instance.source,
      'role': instance.role,
    };

AccountSource _$AccountSourceFromJson(Map<String, dynamic> json) =>
    AccountSource(
      note: json['note'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => AccountField.fromJson(e as Map<String, dynamic>))
          .toList(),
      privacy: $enumDecode(_$PostVisibilityEnumMap, json['privacy']),
      sensitive: json['sensitive'] as bool,
      language: json['language'] as String,
      followRequestsCount: json['follow_requests_count'] as int,
    );

Map<String, dynamic> _$AccountSourceToJson(AccountSource instance) =>
    <String, dynamic>{
      'note': instance.note,
      'fields': instance.fields,
      'privacy': _$PostVisibilityEnumMap[instance.privacy]!,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'follow_requests_count': instance.followRequestsCount,
    };

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.unlisted: 'unlisted',
  PostVisibility.private: 'private',
  PostVisibility.direct: 'direct',
};

AccountField _$AccountFieldFromJson(Map<String, dynamic> json) => AccountField(
      name: json['name'] as String,
      value: json['value'] as String,
      verifiedAt: dateTimeFromISO8601(json['verified_at'] as String),
    );

Map<String, dynamic> _$AccountFieldToJson(AccountField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'verified_at': dateTimeToISO8601(instance.verifiedAt),
    };

AccountRole _$AccountRoleFromJson(Map<String, dynamic> json) => AccountRole(
      id: json['id'] as int,
      name: json['name'] as String,
      permissions: json['permissions'] as int,
      highlighted: json['highlighted'] as bool,
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$AccountRoleToJson(AccountRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'permissions': instance.permissions,
      'highlighted': instance.highlighted,
    };
