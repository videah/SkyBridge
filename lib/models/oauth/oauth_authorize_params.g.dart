// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_authorize_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthAuthorizeParams _$OAuthAuthorizeParamsFromJson(
        Map<String, dynamic> json) =>
    OAuthAuthorizeParams(
      responseType: json['response_type'] as String,
      clientId: json['client_id'] as String,
      redirectUri: json['redirect_uri'] as String,
      scope: json['scope'] as String? ?? 'read',
      forceLogin: stringToBool(json['force_login'] as String?),
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$OAuthAuthorizeParamsToJson(
        OAuthAuthorizeParams instance) =>
    <String, dynamic>{
      'response_type': instance.responseType,
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
      'force_login': boolToString(instance.forceLogin),
      'lang': instance.lang,
    };
