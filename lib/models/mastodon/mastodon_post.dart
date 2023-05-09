import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/facets.dart';
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
    required this.filtered,
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
  });

  /// Converts JSON into a Mastodon Post instance.
  factory MastodonPost.fromJson(Map<String, dynamic> json) =>
      _$MastodonPostFromJson(json);

  /// Converts the Mastodon Post to JSON.
  Map<String, dynamic> toJson() => _$MastodonPostToJson(this);

  /// Converts a [bsky.FeedView] to a [MastodonPost].
  static Future<MastodonPost> fromFeedView(bsky.FeedView view) async {
    final post = view.post;
    final isRepost = view.reason?.type.endsWith('reasonRepost') ?? false;

    // Process facets such as mentions and links.
    final processed = await processFacets(
      view.post.record.facets ?? [],
      post.record.text,
    );

    // Bit of a mess right now, could use some cleaning up...
    MastodonAccount account;
    var id = (await postToDatabase(post)).id;
    var content = processed.htmlText;
    var text = post.record.text;
    var likeCount = post.likeCount;
    var repostCount = post.repostCount;
    var replyCount = post.replyCount;
    final mediaAttachments = <MastodonMediaAttachment>[];
    String? language = 'en';

    if (isRepost) {
      // Clear out the content, since this is a repost.
      content = '';
      text = '';
      likeCount = 0;
      repostCount = 0;
      replyCount = 0;
      language = null;

      // Since this is a repost, we need to assign a unique ID and get
      // the account that reposted it.
      id = (await repostToDatabase(view)).id;
      account = await MastodonAccount.fromActor(view.reason!.by);
    } else {
      account = await MastodonAccount.fromActor(post.author);
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

    // Construct URL/URI
    // will need to change this when federation is a thing probably?
    final postId = post.uri.toString().split('/').last;
    const base = 'https://staging.bsky.app';
    final url = '$base/profile/${account.username}/post/$postId';

    return MastodonPost(
      id: id.toString(),
      createdAt: post.indexedAt,
      sensitive: false,
      spoilerText: '',
      visibility: PostVisibility.public,
      language: language,
      uri: url,
      url: url,
      repliesCount: replyCount,
      reblogsCount: repostCount,
      favouritesCount: likeCount,
      favourited: post.viewer.like != null,
      reblogged: post.viewer.repost != null,
      muted: false,
      bookmarked: false,
      content: '<p>$content</p>',
      text: text,
      reblog: isRepost ? await MastodonPost.fromBlueSkyPost(view.post) : null,
      application: {
        'name': 'BlueSky',
        'website': '',
      },
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: processed.mentions,
      tags: [],
      emojis: [],
      pinned: false,
      filtered: [],
    );
  }

  /// Converts a [bsky.Post] to a [MastodonPost].
  static Future<MastodonPost> fromBlueSkyPost(bsky.Post post) async {
    final mediaAttachments = <MastodonMediaAttachment>[];
    final account = await MastodonAccount.fromActor(post.author);

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

    // Process facets such as mentions and links.
    final processed = await processFacets(
      post.record.facets ?? [],
      post.record.text,
    );

    // Construct URL/URI
    // will need to change this when federation is a thing probably?
    final postId = post.uri.toString().split('/').last;
    const base = 'https://staging.bsky.app';
    final url = '$base/profile/${account.username}/post/$postId';

    return MastodonPost(
      id: (await postToDatabase(post)).id.toString(),
      createdAt: post.indexedAt,
      sensitive: false,
      spoilerText: '',
      visibility: PostVisibility.public,
      language: 'en',
      uri: url,
      url: url,
      repliesCount: post.replyCount,
      reblogsCount: post.repostCount,
      favouritesCount: post.likeCount,
      favourited: post.viewer.like != null,
      reblogged: post.viewer.repost != null,
      muted: false,
      bookmarked: false,
      content: '<p>${processed.htmlText}</p>',
      text: post.record.text,
      application: {
        'name': 'BlueSky',
        'website': '',
      },
      account: account,
      mediaAttachments: mediaAttachments,
      mentions: processed.mentions,
      tags: [],
      emojis: [],
      pinned: false,
      filtered: [],
    );
  }

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

  /// Subject or summary line, below which post content is collapsed
  /// until expanded.
  @JsonKey(name: 'spoiler_text')
  final String spoilerText;

  /// Media that is attached to this post.
  @JsonKey(name: 'media_attachments')
  final List<MastodonMediaAttachment> mediaAttachments;

  /// The application used to create this post.
  final Map<String, String?> application;

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
  int favouritesCount;

  /// How many replies this post has received.
  @JsonKey(name: 'replies_count')
  final int repliesCount;

  /// A link to the post's HTML representation.
  final String? url;

  /// The ID of the post this post is a reply to.
  @JsonKey(name: 'in_reply_to_id')
  final String? inReplyToId;

  /// The 64-bit ID of the account this post is a reply to.
  @JsonKey(name: 'in_reply_to_account_id')
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
  bool? favourited;

  /// Whether the current user has reblogged this post.
  final bool? reblogged;

  /// Whether the current user has muted notifications for this post.
  final bool? muted;

  /// Whether the current user has bookmarked this post.
  final bool? bookmarked;

  /// Whether this post is pinned by the current user.
  final bool? pinned;

  /// The filter and keywords used to match this post by the current user.
  final List<String> filtered;
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
