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
    required this.url,
    required this.previewUrl,
    required this.description,
    required this.blurhash,
    this.remoteUrl,
  });

  /// Converts a [bsky.EmbedViewImagesView] to a [MastodonMediaAttachment].
  factory MastodonMediaAttachment.fromEmbed(bsky.EmbedViewImagesView embed) {
    return MastodonMediaAttachment(
      id: '0',
      type: MediaType.image,
      url: embed.fullsize,
      previewUrl: embed.thumbnail,
      remoteUrl: embed.fullsize,
      description: embed.alt,
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
  final String url;

  /// The location of a scaled-down preview of the attachment.
  @JsonKey(name: 'preview_url')
  final String previewUrl;

  /// The location of the full-size original attachment on the remote website.
  @JsonKey(name: 'remote_url')
  final String? remoteUrl;

  /// Alternate text that describes what is in the media attachment, to
  /// be used for the visually impaired or when media attachments do not load.
  final String description;

  /// A hash computed by the BlurHash algorithm, for generating colorful
  /// preview thumbnails when media has not been downloaded yet.
  final String blurhash;
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
