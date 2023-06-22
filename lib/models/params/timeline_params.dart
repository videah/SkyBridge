import 'package:json_annotation/json_annotation.dart';

part 'timeline_params.g.dart';

/// Parameters for retrieving posts on a timeline.
@JsonSerializable()
class TimelineParams {
  /// Constructs an instance of [TimelineParams].
  TimelineParams({
    this.maxId,
    this.sinceId,
    this.minId,
    this.limit = 20,
  });

  /// Converts JSON into a [TimelineParams] instance.
  factory TimelineParams.fromJson(Map<String, dynamic> json) =>
      _$TimelineParamsFromJson(json);

  /// Converts the [TimelineParams] to JSON.
  Map<String, dynamic> toJson() => _$TimelineParamsToJson(this);

  /// Return results older than this ID.
  @JsonKey(name: 'max_id')
  final String? maxId;

  /// Return results newer than this ID.
  @JsonKey(name: 'since_id')
  final String? sinceId;

  /// Return results immediately newer than this ID.
  @JsonKey(name: 'min_id')
  final String? minId;

  /// The maximum number of results to return.
  @JsonKey(fromJson: int.parse)
  final int limit;
}
