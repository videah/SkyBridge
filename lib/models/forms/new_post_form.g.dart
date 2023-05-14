// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPostForm _$NewPostFormFromJson(Map<String, dynamic> json) => NewPostForm(
      status: stringToBluesky(json['status'] as String?),
      mediaIds: (json['media_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inReplyToId: json['in_reply_to_id'] as int?,
    );

Map<String, dynamic> _$NewPostFormToJson(NewPostForm instance) =>
    <String, dynamic>{
      'status': blueskyToString(instance.status),
      'media_ids': instance.mediaIds,
      'in_reply_to_id': instance.inReplyToId,
    };
