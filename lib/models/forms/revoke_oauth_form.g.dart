// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_oauth_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeOAuthForm _$RevokeOAuthFormFromJson(Map<String, dynamic> json) =>
    RevokeOAuthForm(
      clientId: json['client_id'] as String,
      clientSecret: json['client_secret'] as String,
      token: unpackToken(json['token'] as String),
    );

Map<String, dynamic> _$RevokeOAuthFormToJson(RevokeOAuthForm instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'token': instance.token,
    };
