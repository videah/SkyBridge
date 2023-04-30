import 'package:json_annotation/json_annotation.dart';

part 'sign_in_form_data.g.dart';

@JsonSerializable()
class SignInFormData {
  factory SignInFormData.fromJson(Map<String, dynamic> json) =>
      _$SignInFormDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignInFormDataToJson(this);

  SignInFormData({
    required this.purpose,
    required this.clientId,
    required this.redirectUri,
    required this.scope,
  });

  final String purpose;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  final String scope;
}
