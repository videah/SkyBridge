import 'package:json_annotation/json_annotation.dart';

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
  @JsonKey(name: 'exclude_reblogs', toJson: _boolToInt, fromJson: _intToBool)
  final bool excludeReblogs;

  /// Maximum number of statuses to get (default: 20).
  @JsonKey(toJson: _intToString, fromJson: _stringToInt)
  final int limit;

  /// Should we filter for pinned posts only?
  @JsonKey(toJson: _boolToInt, fromJson: _intToBool)
  final bool pinned;
}

String _boolToInt(bool? value) => value ?? true ? '1' : '0';
bool _intToBool(String? value) => int.parse(value ?? '0') == 1;

int _stringToInt(String? value) => int.parse(value ?? '0');
String _intToString(int? value) => value?.toString() ?? '0';
