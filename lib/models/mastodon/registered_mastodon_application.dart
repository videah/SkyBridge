import 'package:json_annotation/json_annotation.dart';

part 'registered_mastodon_application.g.dart';

/// Represents the result of registering a Mastodon application.
/// This is mostly an illusion, as the server does not actually keep track of
/// registered applications.
@JsonSerializable()
class RegisteredMastodonApplication {
  /// Constructs an instance of [RegisteredMastodonApplication].
  RegisteredMastodonApplication({
    required this.id,
    required this.name,
    required this.redirectUri,
    required this.clientId,
    required this.clientSecret,
    required this.vapidKey,
    this.website,
  });

  /// Converts JSON into a MastodonApplication instance.
  factory RegisteredMastodonApplication.fromJson(Map<String, dynamic> json) =>
      _$RegisteredMastodonApplicationFromJson(json);

  /// Converts the MastodonApplication to JSON.
  Map<String, dynamic> toJson() => _$RegisteredMastodonApplicationToJson(this);

  /// The id of the application.
  final String id;

  /// The name of the application.
  final String name;

  /// A URL to the homepage of the application.
  final String? website;

  /// Redirect URI of the application.
  @JsonKey(name: 'redirect_uri')
  final String redirectUri;

  /// Client ID of the application.
  @JsonKey(name: 'client_id')
  final String clientId;

  /// Client secret of the application.
  @JsonKey(name: 'client_secret')
  final String clientSecret;

  /// Vapid key of the application.
  @JsonKey(name: 'vapid_key')
  final String vapidKey;
}
