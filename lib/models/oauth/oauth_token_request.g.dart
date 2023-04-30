// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthTokenRequest _$OAuthTokenRequestFromJson(Map<String, dynamic> json) =>
    OAuthTokenRequest(
      grantType: json['grant_type'] as String,
      code: json['code'] as String?,
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      redirectUri: json['redirect_uri'] as String,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$OAuthTokenRequestToJson(OAuthTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'code': instance.code,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
    };
