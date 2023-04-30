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
      url: json['url'] as String,
      previewUrl: json['preview_url'] as String,
      description: json['description'] as String,
      blurhash: json['blurhash'] as String,
      remoteUrl: json['remote_url'] as String?,
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
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.gifv: 'gifv',
  MediaType.video: 'video',
  MediaType.audio: 'audio',
  MediaType.unknown: 'unknown',
};
