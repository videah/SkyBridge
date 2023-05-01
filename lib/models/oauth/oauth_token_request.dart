import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/oauth/oauth_token_code.dart';

part 'oauth_token_request.g.dart';

/// Parameters used to obtain an access token.
@JsonSerializable()
class OAuthTokenRequest {
  /// Constructs an instance of [OAuthTokenRequest].
  OAuthTokenRequest({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.redirectUri,
    this.code,
    this.scope = 'read',
  });

  /// Converts JSON into a [OAuthTokenRequest] instance.
  factory OAuthTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$OAuthTokenRequestFromJson(json);

  /// Converts the [OAuthTokenRequest to JSON.
  Map<String, dynamic> toJson() => _$OAuthTokenRequestToJson(this);

  /// TThe type of grant being requested.
  /// Set equal to [GrantType.authorizationCode] if [code] is provided in order
  /// to gain user-level access.
  @JsonKey(name: 'grant_type')
  final GrantType? grantType;

  /// A user authorization code, obtained via GET /oauth/authorize.
  @JsonKey(name: 'code', fromJson: OAuthTokenCode.fromSignedString)
  final OAuthTokenCode? code;

  /// The client ID of the application, obtained during app registration.
  @JsonKey(name: 'client_id')
  final String clientId;

  /// The client secret of the application, obtained during app registration.
  @JsonKey(name: 'client_secret')
  final String clientSecret;

  /// String. Set a URI to redirect the user to. If this parameter is set to
  /// urn:ietf:wg:oauth:2.0:oob then the token will be shown instead.
  /// Must match one of the redirect_uris declared during app registration.
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  /// List of requested OAuth scopes, separated by spaces.
  /// If [code] was provided, then this must be equal to the [scope] requested
  /// from the user. Otherwise, it must be a subset of scopes declared during
  /// app registration. If not provided, defaults to read.
  final String? scope;
}

/// The type of grant being requested.
enum GrantType {
  /// Authorization code grant.
  @JsonValue('authorization_code')
  authorizationCode,

  /// Client credentials grant.
  @JsonValue('client_credentials')
  clientCredentials,

  /// Refresh token grant.
  @JsonValue('refresh_token')
  refreshToken,

  /// Password grant.
  @JsonValue('password')
  password,
}
