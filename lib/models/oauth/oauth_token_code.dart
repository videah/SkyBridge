import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_token_request.dart';

part 'oauth_token_code.g.dart';

/// Data passed in the [OAuthTokenRequest.code] field when the token is fetched
/// by the client
@JsonSerializable()
class OAuthTokenCode {
  /// Creates an instance of [OAuthTokenCode].
  OAuthTokenCode({
    required this.token,
    required this.tokenSecret,
    required this.clientId,
    required this.scope,
    required this.identifier,
    required this.appPassword,
    this.purpose = 'token',
    this.showRepliesInHome = false,
  });

  /// Converts JSON into an [OAuthTokenCode] instance.
  factory OAuthTokenCode.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenCodeFromJson(json);

  /// Converts the [OAuthTokenCode] to JSON.
  Map<String, dynamic> toJson() => _$OAuthTokenCodeToJson(this);

  /// Converts a signed string into an [OAuthTokenCode] instance.
  static OAuthTokenCode? fromSignedString(String? signedString) {
    final code = unpackObject(signedString ?? '');
    return code != null ? OAuthTokenCode.fromJson(code) : null;
  }

  /// Converts an [OAuthTokenCode] instance into a signed string.
  final String purpose;

  /// The access token.
  final String token;

  /// The access token secret.
  @JsonKey(name: 'token_secret')
  final String tokenSecret;

  /// The client ID of the application, obtained during app registration.
  @JsonKey(name: 'client_id')
  final String clientId;

  /// List of requested OAuth scopes, separated by spaces.
  final String scope;

  /// The identifier entered by the user, either an email or handle.
  final String identifier;

  /// The app password entered by the user, used to authenticate with Bluesky.
  @JsonKey(name: 'app_password')
  final String appPassword;

  @JsonKey(name: 'show_replies')
  final bool showRepliesInHome;
}
