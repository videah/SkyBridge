// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered_mastodon_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredMastodonApplication _$RegisteredMastodonApplicationFromJson(
        Map<String, dynamic> json) =>
    RegisteredMastodonApplication(
      id: json['id'] as String,
      name: json['name'] as String,
      redirectUri: json['redirect_uri'] as String,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      vapidKey: json['vapid_key'] as String,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$RegisteredMastodonApplicationToJson(
        RegisteredMastodonApplication instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'website': instance.website,
      'redirect_uri': instance.redirectUri,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'vapid_key': instance.vapidKey,
    };
