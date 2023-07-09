// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInForm _$SignInFormFromJson(Map<String, dynamic> json) => SignInForm(
      stuff: json['stuff'] as String,
      bridgePassword: json['bridge_password'] as String,
      identifier: json['identifier'] as String,
      appPassword: json['app_password'] as String,
      showRepliesInHome: json['show_replies'] == null
          ? false
          : handleBoolParameter(json['show_replies'] as String?),
    );

Map<String, dynamic> _$SignInFormToJson(SignInForm instance) =>
    <String, dynamic>{
      'stuff': instance.stuff,
      'bridge_password': instance.bridgePassword,
      'identifier': instance.identifier,
      'app_password': instance.appPassword,
      'show_replies': instance.showRepliesInHome,
    };
