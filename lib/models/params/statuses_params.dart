import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'statuses_params.g.dart';

/// Parameter options for the statuses endpoint.
@JsonSerializable()
class StatusesParams {
  /// Constructs an instance of [StatusesParams].
  StatusesParams({
    this.excludeReblogs = false,
    this.limit = 20,
    this.pinned = false,
  });

  /// Converts JSON into a [StatusesParams].
  factory StatusesParams.fromJson(Map<String, dynamic> json) =>
      _$StatusesParamsFromJson(json);

  /// Converts the [StatusesParams] to JSON.
  Map<String, dynamic> toJson() => _$StatusesParamsToJson(this);

  /// Filters out statuses that are reblogs if set to true (default: false).
  @JsonKey(name: 'exclude_reblogs', toJson: boolToInt, fromJson: handleBoolParameter)
  final bool excludeReblogs;

  /// Maximum number of statuses to get (default: 20).
  @JsonKey(toJson: intToString, fromJson: stringToInt)
  final int limit;

  /// Should we filter for pinned posts only?
  @JsonKey(toJson: boolToInt, fromJson: handleBoolParameter)
  final bool pinned;
}