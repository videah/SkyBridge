import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'search_account_params.g.dart';

/// Parameters for searching for accounts.
@JsonSerializable()
class SearchAccountParams {
  /// Constructs an instance of [SearchAccountParams].
  SearchAccountParams({
    required this.query,
    this.limit = 40,
    this.offset = 0,
    this.resolve = false,
    this.following = false,
  });

  /// Converts JSON into a [SearchAccountParams] instance.
  factory SearchAccountParams.fromJson(Map<String, dynamic> json) =>
      _$SearchAccountParamsFromJson(json);

  /// Converts the [SearchAccountParams] to JSON.
  Map<String, dynamic> toJson() => _$SearchAccountParamsToJson(this);

  /// Search query for accounts.
  @JsonKey(name: 'q')
  final String query;

  /// Maximum number of results. Defaults to 40 accounts. Max 80 accounts.
  @JsonKey(toJson: intToString, fromJson: stringToInt)
  final int limit;

  /// Skip the first n results.
  @JsonKey(toJson: intToString, fromJson: stringToInt)
  final int offset;

  /// Attempt WebFinger lookup. Defaults to false. Use this when q is an
  /// exact address.
  ///
  /// Bluesky does not use WebFinger so we just trim the base url from the
  /// query and search for the handle.
  @JsonKey(toJson: boolToInt, fromJson: handleBoolParameter)
  final bool resolve;

  /// Only return accounts the current user is following.
  @JsonKey(toJson: boolToInt, fromJson: handleBoolParameter)
  final bool following;
}
