import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';

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
  static MastodonCard? fromEmbed(bsky.EmbedView? embed) {
    return embed?.map(
      record: (_) => null,
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
      recordWithMedia: (_) => null,
      unknown: (_) => null,
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

  /// Used for photo embes, instead of custom [html].
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
