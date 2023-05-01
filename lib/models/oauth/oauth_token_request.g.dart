// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthTokenRequest _$OAuthTokenRequestFromJson(Map<String, dynamic> json) =>
    OAuthTokenRequest(
      grantType: $enumDecodeNullable(_$GrantTypeEnumMap, json['grant_type']),
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      redirectUri: json['redirect_uri'] as String,
      code: OAuthTokenCode.fromSignedString(json['code'] as String?),
      scope: json['scope'] as String? ?? 'read',
    );

Map<String, dynamic> _$OAuthTokenRequestToJson(OAuthTokenRequest instance) =>
    <String, dynamic>{
      'grant_type': _$GrantTypeEnumMap[instance.grantType],
      'code': instance.code,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
    };

const _$GrantTypeEnumMap = {
  GrantType.authorizationCode: 'authorization_code',
  GrantType.clientCredentials: 'client_credentials',
  GrantType.refreshToken: 'refresh_token',
  GrantType.password: 'password',
};
