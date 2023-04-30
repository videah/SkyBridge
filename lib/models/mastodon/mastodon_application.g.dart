// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApplication _$MastodonApplicationFromJson(Map<String, dynamic> json) =>
    MastodonApplication(
      clientName: json['client_name'] as String,
      redirectUris: json['redirect_uris'] as String,
      scopes: json['scopes'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$MastodonApplicationToJson(
        MastodonApplication instance) =>
    <String, dynamic>{
      'client_name': instance.clientName,
      'redirect_uris': instance.redirectUris,
      'scopes': instance.scopes,
      'website': instance.website,
    };
