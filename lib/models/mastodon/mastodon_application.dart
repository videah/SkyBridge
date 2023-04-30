import 'package:json_annotation/json_annotation.dart';

part 'mastodon_application.g.dart';

/// Represents a Mastodon Application.
@JsonSerializable()
class MastodonApplication {
  /// Constructs an instance of [MastodonApplication].
  MastodonApplication({
    required this.clientName,
    required this.redirectUris,
    this.scopes,
    this.website,
  });

  /// Converts JSON into a MastodonApplication instance.
  factory MastodonApplication.fromJson(Map<String, dynamic> json) =>
      _$MastodonApplicationFromJson(json);

  /// Converts the MastodonApplication to JSON.
  Map<String, dynamic> toJson() => _$MastodonApplicationToJson(this);

  /// A name for the application.
  @JsonKey(name: 'client_name')
  final String clientName;

  /// Where the user should be redirected after authorization.
  @JsonKey(name: 'redirect_uris')
  final String redirectUris;

  /// Space seperated list of scopes. If none is provided, defaults to read.
  final String? scopes;

  /// A URL to the homepage of the application.
  final String? website;
}
