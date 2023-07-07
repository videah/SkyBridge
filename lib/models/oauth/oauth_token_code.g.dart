// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthTokenCode _$OAuthTokenCodeFromJson(Map<String, dynamic> json) =>
    OAuthTokenCode(
      token: json['token'] as String,
      tokenSecret: json['token_secret'] as String,
      clientId: json['client_id'] as String,
      scope: json['scope'] as String,
      identifier: json['identifier'] as String,
      appPassword: json['app_password'] as String,
      purpose: json['purpose'] as String? ?? 'token',
      showRepliesInHome: json['show_replies'] as bool? ?? false,
    );

Map<String, dynamic> _$OAuthTokenCodeToJson(OAuthTokenCode instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'token': instance.token,
      'token_secret': instance.tokenSecret,
      'client_id': instance.clientId,
      'scope': instance.scope,
      'identifier': instance.identifier,
      'app_password': instance.appPassword,
      'show_replies': instance.showRepliesInHome,
    };
