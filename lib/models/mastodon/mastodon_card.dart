import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_card.g.dart';

/// Represents a rich preview card that is generated using OpenGraph tags
/// from a URL.
@JsonSerializable()
class MastodonCard {
  /// Constructs an instance of [MastodonCard].
  MastodonCard({
    required this.url,
    required this.title,
    required this.description,
    required this.type,
    required this.authorName,
    required this.authorUrl,
    required this.providerName,
    required this.providerUrl,
    required this.html,
    required this.width,
    required this.height,
    required this.embedUrl,
    this.image,
    this.blurhash,
  });

  /// Converts JSON into a [MastodonCard] instance.
  factory MastodonCard.fromJson(Map<String, dynamic> json) =>
      _$MastodonCardFromJson(json);

  /// Converts the [MastodonCard] to JSON.
  Map<String, dynamic> toJson() => _$MastodonCardToJson(this);

  /// Constructs a potential [MastodonCard] from a [bsky.EmbedView].
  static Future<MastodonCard?> fromEmbed(bsky.EmbedView? embed) async {
    return embed?.map(
      record: (record) => embedViewRecordToCard(record.data),
      external: (embed) {
        final external = embed.data.external;
        return MastodonCard(
          url: external.uri,
          title: external.title,
          description: external.description,
          type: CardType.link,
          authorName: '',
          authorUrl: '',
          providerName: '',
          providerUrl: '',
          html: '',
          width: external.thumbnail != null ? 864 : 0,
          height: external.thumbnail != null ? 432 : 0,
          embedUrl: external.thumbnail ?? '',
          image: external.thumbnail ?? '',
        );
      },
      images: (_) => null,
      recordWithMedia: (record) => embedViewRecordToCard(record.data.record),
      unknown: (_) => null,
    );
  }

  /// Constructs a potential [MastodonCard] from a [bsky.EmbedViewRecord].
  /// This is used to construct 'fake' quote posts by abusing embed cards.
  static Future<MastodonCard?> embedViewRecordToCard(
    bsky.EmbedViewRecord record,
  ) async {
    // Get the fallback URL for the avatar.
    final base = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    // Get the database record for the post.
    final dbRecord = await embedPostToDatabase(record.record);
    if (dbRecord == null) return null;

    var title = 'Quote Post';
    var handle = '@unknown.bsky.social';
    var description = '';
    var clickableUrl = base;

    // Ivory expects an image to render a card so we pass a 1x1 transparent
    // image to make it happy.
    var quoteImage = 'https://$base/1px.png';
    var useAttachedMedia = false;

    // Get any data we need from the post's record.
    record.record.map(
      record: (post) {
        handle = post.data.author.handle;
        title = 'Quote Post - (@$handle) \n ${post.data.value.text}';
        description = post.data.value.text;
        clickableUrl = 'https://$base/@$handle/${dbRecord.id}';

        // If the record has a media attachment, we can use that instead.
        final embeds = post.data.embeds;
        if (embeds != null) {
          for (final embed in embeds) {
            embed.map(
              record: (_) {},
              images: (images) {
                quoteImage = images.data.images.first.fullsize;
                useAttachedMedia = true;
              },
              external: (_) {},
              recordWithMedia: (_) {},
              unknown: (_) {},
            );
          }
        }
      },
      notFound: (_) {},
      blocked: (_) {},
      generatorView: (_) {},
      unknown: (_) {},
      listView: (_) {},
    );

    return MastodonCard(
      url: clickableUrl,
      title: title,
      description: description,
      type: CardType.link,
      authorName: handle,
      authorUrl: '',
      providerName: '',
      providerUrl: '',
      html: '',
      width: useAttachedMedia ? 864 : 1000,
      height: useAttachedMedia ? 432 : 1,
      embedUrl: quoteImage,
      image: quoteImage,
    );
  }

  /// Location of linked resource.
  final String url;

  /// Title of the linked resource.
  final String title;

  /// Description of preview.
  final String description;

  /// The type of the preview card.
  final CardType type;

  /// The author of the original resource.
  @JsonKey(name: 'author_name')
  final String authorName;

  /// A link to the author of the original resource.
  @JsonKey(name: 'author_url')
  final String authorUrl;

  /// The provider of the original resource.
  @JsonKey(name: 'provider_name')
  final String providerName;

  /// A link to the provider of the original resource.
  @JsonKey(name: 'provider_url')
  final String providerUrl;

  /// HTML to be used for generating the preview card.
  final String html;

  ///The width of the preview card, in pixels.
  final int width;

  /// The height of the preview card, in pixels.
  final int height;

  /// The preview thumbnail for the resource.
  final String? image;

  /// Used for photo embeds, instead of custom [html].
  @JsonKey(name: 'embed_url')
  final String embedUrl;

  /// A hash computed by the BlurHash algorithm, for generating colorful
  /// preview thumbnails when media has not been downloaded yet.
  final String? blurhash;
}

/// The type of the preview card.
enum CardType {
  /// A link preview card.
  @JsonValue('link')
  link,

  /// A photo preview card.
  @JsonValue('photo')
  photo,

  /// A video preview card.
  @JsonValue('video')
  video,

  /// A rich iFrame preview card (never used).
  @JsonValue('rich')
  rich,
}
