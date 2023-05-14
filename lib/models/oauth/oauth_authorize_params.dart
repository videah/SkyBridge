import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'oauth_authorize_params.g.dart';

/// Parameters passed to an OAuth authorization form.
/// https://docs.joinmastodon.org/methods/oauth/#authorize
@JsonSerializable()
class OAuthAuthorizeParams {
  /// Constructs an instance of [OAuthAuthorizeParams].
  OAuthAuthorizeParams({
    required this.responseType,
    required this.clientId,
    required this.redirectUri,
    this.scope = 'read',
    this.forceLogin,
    this.lang,
  });

  /// Converts JSON into an [OAuthAuthorizeParams] instance.
  factory OAuthAuthorizeParams.fromJson(Map<String, dynamic> json) =>
      _$OAuthAuthorizeParamsFromJson(json);

  /// Converts the [OAuthAuthorizeParams] instance into JSON.
  Map<String, dynamic> toJson() => _$OAuthAuthorizeParamsToJson(this);

  /// Should be set to code.
  @JsonKey(name: 'response_type')
  final String responseType;

  /// The client ID of the application, obtained during app registration.
  @JsonKey(name: 'client_id')
  final String clientId;

  /// Set a URI to redirect the user to.
  /// If this parameter is set to urn:ietf:wg:oauth:2.0:oob then the
  /// authorization code will be shown instead. Must match one of the redirect_
  /// uris declared during app registration.
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  /// List of requested OAuth scopes, separated by spaces.
  /// Must be a subset of scopes declared during app registration.
  /// If not provided, defaults to read.
  final String scope;

  /// Forces the user to re-login, which is necessary for authorizing with
  /// multiple accounts from the same instance.
  @JsonKey(name: 'force_login', toJson: boolToString, fromJson: stringToBool)
  final bool? forceLogin;

  /// The ISO 639-1 two-letter language code to use while rendering the
  /// authorization form.
  final String? lang;
}

