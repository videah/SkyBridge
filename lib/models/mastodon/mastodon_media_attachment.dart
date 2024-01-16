import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';

part 'mastodon_media_attachment.g.dart';

/// Represents a file or media attachment that can be added to a post.
@JsonSerializable()
class MastodonMediaAttachment {
  /// Constructs an instance of [MastodonMediaAttachment].
  MastodonMediaAttachment({
    required this.id,
    required this.type,
    required this.previewUrl,
    required this.description,
    required this.blurhash,
    this.url,
    this.remoteUrl,
    this.meta,
  });

  /// Converts a [bsky.EmbedViewImagesView] to a [MastodonMediaAttachment].
  factory MastodonMediaAttachment.fromEmbed(
    bsky.EmbedViewImagesView embed,
  ) {
    // If embed.alt is empty, we return null instead.
    final description = embed.alt.isEmpty ? null : embed.alt;

    final meta = MediaAttachmentMetadata(
      original: Metadata(
        width: embed.aspectRatio?.width ?? 1,
        height: embed.aspectRatio?.height ?? 1,
      ),
    );

    return MastodonMediaAttachment(
      id: '0',
      type: MediaType.image,
      url: embed.fullsize,
      previewUrl: embed.thumbnail,
      remoteUrl: embed.fullsize,
      description: description,
      meta: meta,
      blurhash: '0',
    );
  }

  /// Converts JSON into a [MastodonMediaAttachment] instance.
  factory MastodonMediaAttachment.fromJson(Map<String, dynamic> json) =>
      _$MastodonMediaAttachmentFromJson(json);

  /// Converts the [MastodonMediaAttachment] to JSON.
  Map<String, dynamic> toJson() => _$MastodonMediaAttachmentToJson(this);

  /// The ID of the attachment in the database.
  /// Cast from an integer but not guaranteed to be a number
  final String id;

  /// The type of the attachment.
  final MediaType type;

  /// The location of the original full-size attachment.
  final String? url;

  /// The location of a scaled-down preview of the attachment.
  @JsonKey(name: 'preview_url')
  final String previewUrl;

  /// The location of the full-size original attachment on the remote website.
  @JsonKey(name: 'remote_url')
  final String? remoteUrl;

  /// Alternate text that describes what is in the media attachment, to
  /// be used for the visually impaired or when media attachments do not load.
  final String? description;

  /// A hash computed by the BlurHash algorithm, for generating colorful
  /// preview thumbnails when media has not been downloaded yet.
  final String blurhash;

  /// Metadata about the attachment, meant to be retrieved using Paperclip.
  /// We only have access to the aspect ratio of the image, and we're assuming
  /// that the client is not lying about the aspect ratio.
  final MediaAttachmentMetadata? meta;
}

/// The type of a [MastodonMediaAttachment].
enum MediaType {
  /// Static, non-animated image.
  @JsonValue('image')
  image,

  /// Looping, soundless animation.
  @JsonValue('gifv')
  gifv,

  /// Video clip.
  @JsonValue('video')
  video,

  /// Audio track.
  @JsonValue('audio')
  audio,

  /// Unsupported or unrecognized type.
  @JsonValue('unknown')
  unknown,
}

/// Represents metadata about a [MastodonMediaAttachment].
@JsonSerializable()
class MediaAttachmentMetadata {
  /// Constructs an instance of [MediaAttachmentMetadata].
  const MediaAttachmentMetadata({required this.original});

  /// Converts JSON into a [MediaAttachmentMetadata] instance.
  factory MediaAttachmentMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaAttachmentMetadataFromJson(json);

  /// The metadata of the original image.
  final Metadata original;

  /// Converts the [MediaAttachmentMetadata] to JSON.
  Map<String, dynamic> toJson() => _$MediaAttachmentMetadataToJson(this);
}

/// Image metadata taken from Paperclip.
@JsonSerializable()
class Metadata {
  /// Constructs an instance of [Metadata].
  const Metadata({required this.width, required this.height});

  /// Converts JSON into a [Metadata] instance.
  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  /// The width of an image.
  final int width;

  /// The height of an image.
  final int height;

  /// The aspect ratio of an image.
  double get aspect => width / height;

  /// Converts the [Metadata] to JSON.
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
