// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_post.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MastodonPostCWProxy {
  MastodonPost id(String id);

  MastodonPost createdAt(DateTime createdAt);

  MastodonPost sensitive(bool sensitive);

  MastodonPost spoilerText(String spoilerText);

  MastodonPost visibility(PostVisibility visibility);

  MastodonPost uri(String uri);

  MastodonPost repliesCount(int repliesCount);

  MastodonPost reblogsCount(int reblogsCount);

  MastodonPost favouritesCount(int favouritesCount);

  MastodonPost content(String content);

  MastodonPost account(MastodonAccount account);

  MastodonPost mediaAttachments(List<MastodonMediaAttachment> mediaAttachments);

  MastodonPost mentions(List<MastodonMention> mentions);

  MastodonPost tags(List<Map<String, dynamic>> tags);

  MastodonPost emojis(List<Map<String, dynamic>> emojis);

  MastodonPost application(Map<String, String?> application);

  MastodonPost filtered(List<String> filtered);

  MastodonPost inReplyToId(String? inReplyToId);

  MastodonPost inReplyToAccountId(String? inReplyToAccountId);

  MastodonPost language(String? language);

  MastodonPost url(String? url);

  MastodonPost favourited(bool? favourited);

  MastodonPost reblogged(bool? reblogged);

  MastodonPost muted(bool? muted);

  MastodonPost bookmarked(bool? bookmarked);

  MastodonPost reblog(MastodonPost? reblog);

  MastodonPost card(MastodonCard? card);

  MastodonPost poll(Map<String, dynamic>? poll);

  MastodonPost text(String? text);

  MastodonPost editedAt(DateTime? editedAt);

  MastodonPost pinned(bool? pinned);

  MastodonPost replyPostUri(AtUri? replyPostUri);

  MastodonPost bskyUri(AtUri? bskyUri);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MastodonPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MastodonPost(...).copyWith(id: 12, name: "My name")
  /// ````
  MastodonPost call({
    String? id,
    DateTime? createdAt,
    bool? sensitive,
    String? spoilerText,
    PostVisibility? visibility,
    String? uri,
    int? repliesCount,
    int? reblogsCount,
    int? favouritesCount,
    String? content,
    MastodonAccount? account,
    List<MastodonMediaAttachment>? mediaAttachments,
    List<MastodonMention>? mentions,
    List<Map<String, dynamic>>? tags,
    List<Map<String, dynamic>>? emojis,
    Map<String, String?>? application,
    List<String>? filtered,
    String? inReplyToId,
    String? inReplyToAccountId,
    String? language,
    String? url,
    bool? favourited,
    bool? reblogged,
    bool? muted,
    bool? bookmarked,
    MastodonPost? reblog,
    MastodonCard? card,
    Map<String, dynamic>? poll,
    String? text,
    DateTime? editedAt,
    bool? pinned,
    AtUri? replyPostUri,
    AtUri? bskyUri,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMastodonPost.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMastodonPost.copyWith.fieldName(...)`
class _$MastodonPostCWProxyImpl implements _$MastodonPostCWProxy {
  const _$MastodonPostCWProxyImpl(this._value);

  final MastodonPost _value;

  @override
  MastodonPost id(String id) => this(id: id);

  @override
  MastodonPost createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  MastodonPost sensitive(bool sensitive) => this(sensitive: sensitive);

  @override
  MastodonPost spoilerText(String spoilerText) =>
      this(spoilerText: spoilerText);

  @override
  MastodonPost visibility(PostVisibility visibility) =>
      this(visibility: visibility);

  @override
  MastodonPost uri(String uri) => this(uri: uri);

  @override
  MastodonPost repliesCount(int repliesCount) =>
      this(repliesCount: repliesCount);

  @override
  MastodonPost reblogsCount(int reblogsCount) =>
      this(reblogsCount: reblogsCount);

  @override
  MastodonPost favouritesCount(int favouritesCount) =>
      this(favouritesCount: favouritesCount);

  @override
  MastodonPost content(String content) => this(content: content);

  @override
  MastodonPost account(MastodonAccount account) => this(account: account);

  @override
  MastodonPost mediaAttachments(
          List<MastodonMediaAttachment> mediaAttachments) =>
      this(mediaAttachments: mediaAttachments);

  @override
  MastodonPost mentions(List<MastodonMention> mentions) =>
      this(mentions: mentions);

  @override
  MastodonPost tags(List<Map<String, dynamic>> tags) => this(tags: tags);

  @override
  MastodonPost emojis(List<Map<String, dynamic>> emojis) =>
      this(emojis: emojis);

  @override
  MastodonPost application(Map<String, String?> application) =>
      this(application: application);

  @override
  MastodonPost filtered(List<String> filtered) => this(filtered: filtered);

  @override
  MastodonPost inReplyToId(String? inReplyToId) =>
      this(inReplyToId: inReplyToId);

  @override
  MastodonPost inReplyToAccountId(String? inReplyToAccountId) =>
      this(inReplyToAccountId: inReplyToAccountId);

  @override
  MastodonPost language(String? language) => this(language: language);

  @override
  MastodonPost url(String? url) => this(url: url);

  @override
  MastodonPost favourited(bool? favourited) => this(favourited: favourited);

  @override
  MastodonPost reblogged(bool? reblogged) => this(reblogged: reblogged);

  @override
  MastodonPost muted(bool? muted) => this(muted: muted);

  @override
  MastodonPost bookmarked(bool? bookmarked) => this(bookmarked: bookmarked);

  @override
  MastodonPost reblog(MastodonPost? reblog) => this(reblog: reblog);

  @override
  MastodonPost card(MastodonCard? card) => this(card: card);

  @override
  MastodonPost poll(Map<String, dynamic>? poll) => this(poll: poll);

  @override
  MastodonPost text(String? text) => this(text: text);

  @override
  MastodonPost editedAt(DateTime? editedAt) => this(editedAt: editedAt);

  @override
  MastodonPost pinned(bool? pinned) => this(pinned: pinned);

  @override
  MastodonPost replyPostUri(AtUri? replyPostUri) =>
      this(replyPostUri: replyPostUri);

  @override
  MastodonPost bskyUri(AtUri? bskyUri) => this(bskyUri: bskyUri);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MastodonPost(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MastodonPost(...).copyWith(id: 12, name: "My name")
  /// ````
  MastodonPost call({
    Object? id = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? sensitive = const $CopyWithPlaceholder(),
    Object? spoilerText = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? uri = const $CopyWithPlaceholder(),
    Object? repliesCount = const $CopyWithPlaceholder(),
    Object? reblogsCount = const $CopyWithPlaceholder(),
    Object? favouritesCount = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? account = const $CopyWithPlaceholder(),
    Object? mediaAttachments = const $CopyWithPlaceholder(),
    Object? mentions = const $CopyWithPlaceholder(),
    Object? tags = const $CopyWithPlaceholder(),
    Object? emojis = const $CopyWithPlaceholder(),
    Object? application = const $CopyWithPlaceholder(),
    Object? filtered = const $CopyWithPlaceholder(),
    Object? inReplyToId = const $CopyWithPlaceholder(),
    Object? inReplyToAccountId = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
    Object? url = const $CopyWithPlaceholder(),
    Object? favourited = const $CopyWithPlaceholder(),
    Object? reblogged = const $CopyWithPlaceholder(),
    Object? muted = const $CopyWithPlaceholder(),
    Object? bookmarked = const $CopyWithPlaceholder(),
    Object? reblog = const $CopyWithPlaceholder(),
    Object? card = const $CopyWithPlaceholder(),
    Object? poll = const $CopyWithPlaceholder(),
    Object? text = const $CopyWithPlaceholder(),
    Object? editedAt = const $CopyWithPlaceholder(),
    Object? pinned = const $CopyWithPlaceholder(),
    Object? replyPostUri = const $CopyWithPlaceholder(),
    Object? bskyUri = const $CopyWithPlaceholder(),
  }) {
    return MastodonPost(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      sensitive: sensitive == const $CopyWithPlaceholder() || sensitive == null
          ? _value.sensitive
          // ignore: cast_nullable_to_non_nullable
          : sensitive as bool,
      spoilerText:
          spoilerText == const $CopyWithPlaceholder() || spoilerText == null
              ? _value.spoilerText
              // ignore: cast_nullable_to_non_nullable
              : spoilerText as String,
      visibility:
          visibility == const $CopyWithPlaceholder() || visibility == null
              ? _value.visibility
              // ignore: cast_nullable_to_non_nullable
              : visibility as PostVisibility,
      uri: uri == const $CopyWithPlaceholder() || uri == null
          ? _value.uri
          // ignore: cast_nullable_to_non_nullable
          : uri as String,
      repliesCount:
          repliesCount == const $CopyWithPlaceholder() || repliesCount == null
              ? _value.repliesCount
              // ignore: cast_nullable_to_non_nullable
              : repliesCount as int,
      reblogsCount:
          reblogsCount == const $CopyWithPlaceholder() || reblogsCount == null
              ? _value.reblogsCount
              // ignore: cast_nullable_to_non_nullable
              : reblogsCount as int,
      favouritesCount: favouritesCount == const $CopyWithPlaceholder() ||
              favouritesCount == null
          ? _value.favouritesCount
          // ignore: cast_nullable_to_non_nullable
          : favouritesCount as int,
      content: content == const $CopyWithPlaceholder() || content == null
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String,
      account: account == const $CopyWithPlaceholder() || account == null
          ? _value.account
          // ignore: cast_nullable_to_non_nullable
          : account as MastodonAccount,
      mediaAttachments: mediaAttachments == const $CopyWithPlaceholder() ||
              mediaAttachments == null
          ? _value.mediaAttachments
          // ignore: cast_nullable_to_non_nullable
          : mediaAttachments as List<MastodonMediaAttachment>,
      mentions: mentions == const $CopyWithPlaceholder() || mentions == null
          ? _value.mentions
          // ignore: cast_nullable_to_non_nullable
          : mentions as List<MastodonMention>,
      tags: tags == const $CopyWithPlaceholder() || tags == null
          ? _value.tags
          // ignore: cast_nullable_to_non_nullable
          : tags as List<Map<String, dynamic>>,
      emojis: emojis == const $CopyWithPlaceholder() || emojis == null
          ? _value.emojis
          // ignore: cast_nullable_to_non_nullable
          : emojis as List<Map<String, dynamic>>,
      application:
          application == const $CopyWithPlaceholder() || application == null
              ? _value.application
              // ignore: cast_nullable_to_non_nullable
              : application as Map<String, String?>,
      filtered: filtered == const $CopyWithPlaceholder() || filtered == null
          ? _value.filtered
          // ignore: cast_nullable_to_non_nullable
          : filtered as List<String>,
      inReplyToId: inReplyToId == const $CopyWithPlaceholder()
          ? _value.inReplyToId
          // ignore: cast_nullable_to_non_nullable
          : inReplyToId as String?,
      inReplyToAccountId: inReplyToAccountId == const $CopyWithPlaceholder()
          ? _value.inReplyToAccountId
          // ignore: cast_nullable_to_non_nullable
          : inReplyToAccountId as String?,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String?,
      url: url == const $CopyWithPlaceholder()
          ? _value.url
          // ignore: cast_nullable_to_non_nullable
          : url as String?,
      favourited: favourited == const $CopyWithPlaceholder()
          ? _value.favourited
          // ignore: cast_nullable_to_non_nullable
          : favourited as bool?,
      reblogged: reblogged == const $CopyWithPlaceholder()
          ? _value.reblogged
          // ignore: cast_nullable_to_non_nullable
          : reblogged as bool?,
      muted: muted == const $CopyWithPlaceholder()
          ? _value.muted
          // ignore: cast_nullable_to_non_nullable
          : muted as bool?,
      bookmarked: bookmarked == const $CopyWithPlaceholder()
          ? _value.bookmarked
          // ignore: cast_nullable_to_non_nullable
          : bookmarked as bool?,
      reblog: reblog == const $CopyWithPlaceholder()
          ? _value.reblog
          // ignore: cast_nullable_to_non_nullable
          : reblog as MastodonPost?,
      card: card == const $CopyWithPlaceholder()
          ? _value.card
          // ignore: cast_nullable_to_non_nullable
          : card as MastodonCard?,
      poll: poll == const $CopyWithPlaceholder()
          ? _value.poll
          // ignore: cast_nullable_to_non_nullable
          : poll as Map<String, dynamic>?,
      text: text == const $CopyWithPlaceholder()
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String?,
      editedAt: editedAt == const $CopyWithPlaceholder()
          ? _value.editedAt
          // ignore: cast_nullable_to_non_nullable
          : editedAt as DateTime?,
      pinned: pinned == const $CopyWithPlaceholder()
          ? _value.pinned
          // ignore: cast_nullable_to_non_nullable
          : pinned as bool?,
      replyPostUri: replyPostUri == const $CopyWithPlaceholder()
          ? _value.replyPostUri
          // ignore: cast_nullable_to_non_nullable
          : replyPostUri as AtUri?,
      bskyUri: bskyUri == const $CopyWithPlaceholder()
          ? _value.bskyUri
          // ignore: cast_nullable_to_non_nullable
          : bskyUri as AtUri?,
    );
  }
}

extension $MastodonPostCopyWith on MastodonPost {
  /// Returns a callable class that can be used as follows: `instanceOfMastodonPost.copyWith(...)` or like so:`instanceOfMastodonPost.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MastodonPostCWProxy get copyWith => _$MastodonPostCWProxyImpl(this);
}

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
      editedAt: dateTimeFromNullableISO8601(json['edited_at'] as String?),
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
