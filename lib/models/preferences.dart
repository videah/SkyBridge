import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

/// Per-user preferences stored in auth tokens.
/// These settings are set by the user when signing in.
@JsonSerializable()
class SkybridgePreferences {
  /// Constructs an instance of [SkybridgePreferences].
  const SkybridgePreferences({
    this.showRepliesInHome = false,
  });

  /// Converts JSON into a [SkybridgePreferences] instance.
  factory SkybridgePreferences.fromJson(Map<String, dynamic> json) =>
      _$SkybridgePreferencesFromJson(json);

  /// Converts the [SkybridgePreferences] to JSON.
  Map<String, dynamic> toJson() => _$SkybridgePreferencesToJson(this);

  /// Should the user's home timeline show replies?
  /// The default bsky behaviour is to show replies with 2 likes or more,
  /// but this seems confusing for most users. We default to false.
  final bool showRepliesInHome;
}
