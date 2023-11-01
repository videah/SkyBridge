import 'package:json_annotation/json_annotation.dart';

part 'mastodon_tag.g.dart';

/// Represents a hashtag on Mastodon.
@JsonSerializable()
class MastodonTag {
  /// Constructs an instance of [MastodonTag].
  MastodonTag({
    required this.name,
    required this.url,
  });

  /// Converts JSON into a MastodonApplication instance.
  factory MastodonTag.fromJson(Map<String, dynamic> json) =>
      _$MastodonTagFromJson(json);

  /// Converts the MastodonApplication to JSON.
  Map<String, dynamic> toJson() => _$MastodonTagToJson(this);

  /// The value of the hashtag after the # sign.
  final String name;

  /// A link to the hashtag on the instance.
  final String url;
}
