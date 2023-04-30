import 'package:json_annotation/json_annotation.dart';

part 'oauth_token_request.g.dart';

/// Represents a Mastodon Application.
@JsonSerializable()
class OAuthTokenRequest {
  /// Converts JSON into a [OAuthTokenRequest] instance.
  factory OAuthTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenRequestFromJson(json);

  /// Converts the [OAuthTokenRequest to JSON.
  Map<String, dynamic> toJson() => _$OAuthTokenRequestToJson(this);

  OAuthTokenRequest({
    required this.grantType,
    this.code,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
    this.scope,
  });

  @JsonKey(name: 'grant_type')
  final String grantType;

  final String? code;

  @JsonKey(name: 'client_id')
  final String clientId;

  @JsonKey(name: 'client_secret')
  final String clientSecret;

  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  final String? scope;
}
