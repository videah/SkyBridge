import 'package:json_annotation/json_annotation.dart';

part 'authorization_form_data.g.dart';

@JsonSerializable()
class AuthorizationFormData {

  /// Constructs an instance of [AuthorizationFormData].
  AuthorizationFormData({
    required this.responseType,
    required this.clientId,
    required this.redirectUri,
    this.scope,
    this.forceLogin,
    this.lang,
  });

  /// Converts JSON into a [AuthorizationFormData] instance.
  factory AuthorizationFormData.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFormDataFromJson(json);

  /// Converts the [AuthorizationFormData] to JSON.
  Map<String, dynamic> toJson() => _$AuthorizationFormDataToJson(this);

  @JsonKey(name: 'response_type')
  final String responseType;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  final String? scope;

  @JsonKey(name: 'force_login')
  final bool? forceLogin;

  final String? lang;
}
