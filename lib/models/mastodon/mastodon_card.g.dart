// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonCard _$MastodonCardFromJson(Map<String, dynamic> json) => MastodonCard(
      url: json['url'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$CardTypeEnumMap, json['type']),
      authorName: json['author_name'] as String,
      authorUrl: json['author_url'] as String,
      providerName: json['provider_name'] as String,
      providerUrl: json['provider_url'] as String,
      html: json['html'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      embedUrl: json['embed_url'] as String,
      image: json['image'] as String?,
      blurhash: json['blurhash'] as String?,
    );

Map<String, dynamic> _$MastodonCardToJson(MastodonCard instance) =>
    <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'type': _$CardTypeEnumMap[instance.type]!,
      'author_name': instance.authorName,
      'author_url': instance.authorUrl,
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl,
      'html': instance.html,
      'width': instance.width,
      'height': instance.height,
      'image': instance.image,
      'embed_url': instance.embedUrl,
      'blurhash': instance.blurhash,
    };

const _$CardTypeEnumMap = {
  CardType.link: 'link',
  CardType.photo: 'photo',
  CardType.video: 'video',
  CardType.rich: 'rich',
};
