import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'oauth_token.g.dart';

/// An OAuth token that can be used to authenticate requests.
@JsonSerializable()
class OAuthToken {
  /// Constructs an instance of [OAuthToken].
  OAuthToken({
    required this.accessToken,
    required this.tokenType,
    required this.scope,
    required this.createdAt,
  });

  /// Converts JSON into a [OAuthToken] instance.
  factory OAuthToken.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenFromJson(json);

  /// Converts the [OAuthToken] to JSON.
  Map<String, dynamic> toJson() => _$OAuthTokenToJson(this);

  /// The access token that can be used to authenticate requests.
  @JsonKey(name: 'access_token')
  final String accessToken;

  /// The type of token.
  @JsonKey(name: 'token_type')
  final String tokenType;

  /// The space seperated scopes that the token has access to.
  final String scope;

  /// The time the token was created.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromEpoch,
    toJson: dateTimeToEpoch,
  )
  final DateTime createdAt;
}
