import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/preferences.dart';

part 'oauth_access_token.g.dart';

/// Access token stored on the client used to authenticate.
@JsonSerializable()
class OAuthAccessToken {
  /// Constructs an instance of [OAuthAccessToken].
  OAuthAccessToken({
    required this.identifier,
    required this.did,
    required this.appPassword,
    this.preferences = const SkybridgePreferences(),
  });

  /// Converts JSON into a [OAuthAccessToken] instance.
  factory OAuthAccessToken.fromJson(Map<String, dynamic> json) =>
      _$OAuthAccessTokenFromJson(json);

  /// Converts the [OAuthAccessToken] to JSON.
  Map<String, dynamic> toJson() => _$OAuthAccessTokenToJson(this);

  /// The identifier entered by the user, either an email or handle.
  final String identifier;

  /// The DID of the user.
  final String did;

  /// The app password entered by the user, used to authenticate with Bluesky.
  @JsonKey(name: 'app_password')
  final String appPassword;

  /// Per-user preferences set by the user when signing in.
  final SkybridgePreferences preferences;
}
