import 'package:json_annotation/json_annotation.dart';

part 'oauth_token_code.g.dart';

@JsonSerializable()
class OAuthTokenCode {
  factory OAuthTokenCode.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenCodeFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthTokenCodeToJson(this);

  OAuthTokenCode({
    required this.purpose,
    required this.token,
    required this.tokenSecret,
    required this.clientId,
    required this.scope,
  });

  final String purpose;
  final String token;

  @JsonKey(name: 'token_secret')
  final String tokenSecret;

  @JsonKey(name: 'client_id')
  final String clientId;

  final String scope;
}