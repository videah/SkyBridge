// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationFormData _$AuthorizationFormDataFromJson(
        Map<String, dynamic> json) =>
    AuthorizationFormData(
      responseType: json['response_type'] as String,
      clientId: json['client_id'] as String,
      redirectUri: json['redirect_uri'] as String,
      scope: json['scope'] as String?,
      forceLogin: json['force_login'] as bool?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$AuthorizationFormDataToJson(
        AuthorizationFormData instance) =>
    <String, dynamic>{
      'response_type': instance.responseType,
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
      'force_login': instance.forceLogin,
      'lang': instance.lang,
    };
