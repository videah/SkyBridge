// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInFormData _$SignInFormDataFromJson(Map<String, dynamic> json) =>
    SignInFormData(
      purpose: json['purpose'] as String,
      clientId: json['client_id'] as String,
      redirectUri: json['redirect_uri'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$SignInFormDataToJson(SignInFormData instance) =>
    <String, dynamic>{
      'purpose': instance.purpose,
      'client_id': instance.clientId,
      'redirect_uri': instance.redirectUri,
      'scope': instance.scope,
    };
