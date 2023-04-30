import 'dart:math';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_media_attachment.dart';
import 'package:sky_bridge/models/mastodon/mastodon_mention.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_post.g.dart';

/// Representation for a Mastodon status.
@JsonSerializable()
class MastodonPost {
  /// Constructs an instance of [MastodonPost].
  MastodonPost({
    required this.id,
    required this.createdAt,
    required this.sensitive,
    required this.spoilerText,
    required this.visibility,
    required this.uri,
    required this.repliesCount,
    required this.reblogsCount,
    required this.favouritesCount,
    required this.content,
    required this.account,
    required this.mediaAttachments,
    required this.mentions,
    required this.tags,
    required this.emojis,
    required this.application,
    this.inReplyToId,
    this.inReplyToAccountId,
    this.language,
    this.url,
    this.favourited,
    this.reblogged,
    this.muted,
    this.bookmarked,
    this.reblog,
    this.card,
    this.poll,
    this.text,
    this.editedAt,
    this.pinned,
    this.filtered,
  });

  /// Converts a [bsky.FeedView] to a [MastodonPost].
  factory MastodonPost.fromFeedView(
    bsky.FeedView view,
    Map<String, int> pairs, {
    ProfileInfo? profile,
  }) {
    final post = view.post;
    final isRepost = view.reason?.type.endsWith('reasonRepost') ?? false;

    // Bit of a mess right now, could use some cleaning up...
    MastodonAccount account;
    var content = post.record.text;
    var text = content;
    var likeCount = post.likeCount;
    var repostCount = post.repostCount;
    var replyCount = post.replyCount;
    final mediaAttachments = <MastodonMediaAttachment>[];
    String? language = 'en';

    if (isRepost) {
      content = '';
      text = '';
      likeCount = 0;
      repostCount = 0;
      replyCount = 0;
      language = null;

      // Since this is a repost, we need to get person who reposted it.
      account = MastodonAccount.fromActor(view.reason!.by, pairs);
    } else {
      account = MastodonAccount.fromActor(
        post.author,
        pairs,
        profileInfo: profile,
      );
    }

    // Handle embedded content.
    if (post.embed != null) {
      if (post.embed!.data is bsky.EmbedViewImages) {
        final embed = post.embed!.data as bsky.EmbedViewImages;
        // Convert the embed to a media attachment.
        for (final image in embed.images) {
          final attachment = MastodonMediaAttachment.fromEmbed(image);
          mediaAttachments.add(attachment);
        }
      }
    }

    return MastodonPost(
      id: (pairs[post.cid] ?? -1).toString(),
      createdAt: post.indexedAt,
      sensitive: false,
      spoilerText: '',
      visibility: PostVisibility.public,
      language: language,
      uri: 'https://mastodon.social/users/Gargron/statuses/103270115826048975',
      url: 'https://mastodon.social/@Gargron/103270115826048975',
      repliesCount: replyCount,
      reblogsCount: repostCount,
      favouritesCount: likeCount,
      favourited: post.viewer.like != null,
      reblogged: post.viewer.repost != null,
      muted: false,
      bookmarked: false,
      content: content,
      text: text,
      reblog: isRepost ? MastodonPost.fromBlueSkyPost(view.post, pairs) : null,
      application: {
        'name': 'BlueSky',
        'website': '',
      },
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: [],
      tags: [],
      emojis: [],
      pinned: false,
    );
  }

  /// Converts a [bsky.Post] to a [MastodonPost].
  factory MastodonPost.fromBlueSkyPost(bsky.Post post, Map<String, int> pairs) {
    final mediaAttachments = <MastodonMediaAttachment>[];

    if (post.embed != null) {
      if (post.embed!.data is bsky.EmbedViewImages) {
        final embed = post.embed!.data as bsky.EmbedViewImages;
        // Convert the embed to a media attachment.
        for (final image in embed.images) {
          final attachment = MastodonMediaAttachment.fromEmbed(image);
          mediaAttachments.add(attachment);
        }
      }
    }

    final randomId = Random().nextInt(1000000000);
    return MastodonPost(
      id: randomId.toString(),
      createdAt: post.indexedAt,
      sensitive: false,
      spoilerText: '',
      visibility: PostVisibility.public,
      language: 'en',
      uri: 'https://mastodon.social/users/Gargron/statuses/103270115826048975',
      url: 'https://mastodon.social/@Gargron/103270115826048975',
      repliesCount: post.replyCount,
      reblogsCount: post.repostCount,
      favouritesCount: post.likeCount,
      favourited: post.viewer.like != null,
      reblogged: post.viewer.repost != null,
      muted: false,
      bookmarked: false,
      content: post.record.text,
      text: post.record.text,
      application: {
        'name': 'BlueSky',
        'website': '',
      },
      account: MastodonAccount.fromActor(post.author, pairs),
      mediaAttachments: mediaAttachments,
      mentions: [],
      tags: [],
      emojis: [],
      pinned: false,
    );
  }

  /// Converts JSON into a Mastodon Post instance.
  factory MastodonPost.fromJson(Map<String, dynamic> json) =>
      _$MastodonPostFromJson(json);

  /// Converts the Mastodon Post to JSON.
  Map<String, dynamic> toJson() => _$MastodonPostToJson(this);

  /// The ID of the post. Is a 64-bit integer cast to a string.
  final String id;

  /// URI of the status used for federation.
  final String uri;

  /// The date when this post was created.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime createdAt;

  /// The account that authored this post.
  final MastodonAccount account;

  /// HTML-encoded post content.
  final String content;

  /// Visibility of this post.
  final PostVisibility visibility;

  /// Whether this post is marked as sensitive.
  final bool sensitive;

  /// Sibject or summary line, below which post content is collapsed
  /// until expanded.
  @JsonKey(name: 'spoiler_text')
  final String spoilerText;

  /// Media that is attached to this post.
  @JsonKey(name: 'media_attachments')
  final List<MastodonMediaAttachment> mediaAttachments;

  /// The application used to create this post.
  final Map<String, String> application;

  /// Mentions of users within the post content.
  final List<MastodonMention> mentions;

  /// Hashtags used within the post content.
  /// Bluesky has no concept of hashtags at the moment so this is always empty.
  final List<Map<String, dynamic>> tags;

  /// Custom emoji to be used when rendering the post content.
  final List<Map<String, dynamic>> emojis;

  /// How many reposts this post has received.
  @JsonKey(name: 'reblogs_count')
  final int reblogsCount;

  /// How many likes this post has received.
  @JsonKey(name: 'favourites_count')
  final int favouritesCount;

  /// How many replies this post has received.
  @JsonKey(name: 'replies_count')
  final int repliesCount;

  /// A link to the post's HTML representation.
  final String? url;

  /// The ID of the post this post is a reply to.
  final String? inReplyToId;

  /// The 64-bit ID of the account this post is a reply to.
  final String? inReplyToAccountId;

  /// The post being reblogged.
  final MastodonPost? reblog;

  /// The poll attached to this post.
  final Map<String, dynamic>? poll;

  /// Preview card for links included in the post content.
  final Map<String, dynamic>? card;

  /// Primary language of this post.
  final String? language;

  /// Plain-text source of a status. Returned instead of content when status
  /// is deleted, so the user may redraft from the source text without the
  /// client having to reverse-engineer the original text from the HTML content.
  final String? text;

  /// Timestamp of when the post was last edited.
  @JsonKey(
    name: 'edited_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime? editedAt;

  /// Whether the current user has liked this post.
  final bool? favourited;

  /// Whether the current user has reblogged this post.
  final bool? reblogged;

  /// Whether the current user has muted notifications for this post.
  final bool? muted;

  /// Whether the current user has bookmarked this post.
  final bool? bookmarked;

  /// Whether this post is pinned by the current user.
  final bool? pinned;

  /// The filter and keywords used to match this post by the current user.
  final List<Map<String, dynamic>>? filtered;
}

/// The visibility of a post.
/// This is very Mastodon specific and currently doesn't mean much for Bluesky.
/// It is included for completeness, maybe this'll change in the future.
enum PostVisibility {
  /// Visible to everyone, shown on public timelines.
  @JsonValue('public')
  public,

  /// Visible to public, but not included in public timelines.
  @JsonValue('unlisted')
  unlisted,

  /// Visible to followers only, and to any mentioned users.
  @JsonValue('private')
  private,

  /// Visible only to mentioned users.
  @JsonValue('direct')
  direct,
}
