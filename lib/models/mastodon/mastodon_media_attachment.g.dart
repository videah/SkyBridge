// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_media_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonMediaAttachment _$MastodonMediaAttachmentFromJson(
        Map<String, dynamic> json) =>
    MastodonMediaAttachment(
      id: json['id'] as String,
      type: $enumDecode(_$MediaTypeEnumMap, json['type']),
      previewUrl: json['preview_url'] as String,
      description: json['description'] as String?,
      blurhash: json['blurhash'] as String,
      url: json['url'] as String?,
      remoteUrl: json['remote_url'] as String?,
      meta: json['meta'] == null
          ? null
          : MediaAttachmentMetadata.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MastodonMediaAttachmentToJson(
        MastodonMediaAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'url': instance.url,
      'preview_url': instance.previewUrl,
      'remote_url': instance.remoteUrl,
      'description': instance.description,
      'blurhash': instance.blurhash,
      'meta': instance.meta,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.gifv: 'gifv',
  MediaType.video: 'video',
  MediaType.audio: 'audio',
  MediaType.unknown: 'unknown',
};

MediaAttachmentMetadata _$MediaAttachmentMetadataFromJson(
        Map<String, dynamic> json) =>
    MediaAttachmentMetadata(
      original: Metadata.fromJson(json['original'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaAttachmentMetadataToJson(
        MediaAttachmentMetadata instance) =>
    <String, dynamic>{
      'original': instance.original,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
