import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/models/oauth/oauth_access_token.dart';

part 'revoke_oauth_form.g.dart';

/// Form used to revoke an access token.
@JsonSerializable()
class RevokeOAuthForm {
  /// Constructs an instance of [RevokeOAuthForm].
  RevokeOAuthForm({
    required this.clientId,
    required this.clientSecret,
    required this.token,
  });

  /// Converts JSON into a [RevokeOAuthForm] instance.
  factory RevokeOAuthForm.fromJson(Map<String, dynamic> json) =>
      _$RevokeOAuthFormFromJson(json);

  /// Converts the [RevokeOAuthForm] to JSON.
  Map<String, dynamic> toJson() => _$RevokeOAuthFormToJson(this);

  /// The client ID, obtained during app registration.
  @JsonKey(name: 'client_id')
  final String clientId;

  /// The client secret, obtained during app registration.
  @JsonKey(name: 'client_secret')
  final String clientSecret;

  /// The previously obtained token, to be invalidated.
  @JsonKey(fromJson: unpackToken)
  final OAuthAccessToken token;
}

/// Unpacks a signed token string into an [OAuthAccessToken] instance.
OAuthAccessToken unpackToken(String token) {
  return OAuthAccessToken.fromJson(
    unpackObject(token) ?? {},
  );
}
