// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonPost _$MastodonPostFromJson(Map<String, dynamic> json) => MastodonPost(
      id: json['id'] as String,
      createdAt: dateTimeFromISO8601(json['created_at'] as String),
      sensitive: json['sensitive'] as bool,
      spoilerText: json['spoiler_text'] as String,
      visibility: $enumDecode(_$PostVisibilityEnumMap, json['visibility']),
      uri: json['uri'] as String,
      repliesCount: json['replies_count'] as int,
      reblogsCount: json['reblogs_count'] as int,
      favouritesCount: json['favourites_count'] as int,
      content: json['content'] as String,
      account:
          MastodonAccount.fromJson(json['account'] as Map<String, dynamic>),
      mediaAttachments: (json['media_attachments'] as List<dynamic>)
          .map((e) =>
              MastodonMediaAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      mentions: (json['mentions'] as List<dynamic>)
          .map((e) => MastodonMention.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      application: Map<String, String?>.from(json['application'] as Map),
      filtered:
          (json['filtered'] as List<dynamic>).map((e) => e as String).toList(),
      inReplyToId: json['in_reply_to_id'] as String?,
      inReplyToAccountId: json['in_reply_to_account_id'] as String?,
      language: json['language'] as String?,
      url: json['url'] as String?,
      favourited: json['favourited'] as bool?,
      reblogged: json['reblogged'] as bool?,
      muted: json['muted'] as bool?,
      bookmarked: json['bookmarked'] as bool?,
      reblog: json['reblog'] == null
          ? null
          : MastodonPost.fromJson(json['reblog'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : MastodonCard.fromJson(json['card'] as Map<String, dynamic>),
      poll: json['poll'] as Map<String, dynamic>?,
      text: json['text'] as String?,
      editedAt: dateTimeFromISO8601(json['edited_at'] as String),
      pinned: json['pinned'] as bool?,
    );

Map<String, dynamic> _$MastodonPostToJson(MastodonPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uri': instance.uri,
      'created_at': dateTimeToISO8601(instance.createdAt),
      'account': instance.account,
      'content': instance.content,
      'visibility': _$PostVisibilityEnumMap[instance.visibility]!,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'media_attachments': instance.mediaAttachments,
      'application': instance.application,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis,
      'reblogs_count': instance.reblogsCount,
      'favourites_count': instance.favouritesCount,
      'replies_count': instance.repliesCount,
      'url': instance.url,
      'in_reply_to_id': instance.inReplyToId,
      'in_reply_to_account_id': instance.inReplyToAccountId,
      'reblog': instance.reblog,
      'poll': instance.poll,
      'card': instance.card,
      'language': instance.language,
      'text': instance.text,
      'edited_at': dateTimeToISO8601(instance.editedAt),
      'favourited': instance.favourited,
      'reblogged': instance.reblogged,
      'muted': instance.muted,
      'bookmarked': instance.bookmarked,
      'pinned': instance.pinned,
      'filtered': instance.filtered,
    };

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.unlisted: 'unlisted',
  PostVisibility.private: 'private',
  PostVisibility.direct: 'direct',
};
