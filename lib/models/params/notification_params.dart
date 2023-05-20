import 'package:json_annotation/json_annotation.dart';

part 'notification_params.g.dart';

/// Parameters for acquiring a list of user notifications.
@JsonSerializable()
class NotificationParams {
  /// Constructs an instance of [NotificationParams].
  NotificationParams({
    this.maxId,
    this.sinceId,
    this.minId,
    this.limit = 15,
    this.types,
    this.excludeTypes,
    this.accountId,
  });

  /// Converts JSON into a [NotificationParams] instance.
  factory NotificationParams.fromJson(Map<String, dynamic> json) =>
      _$NotificationParamsFromJson(json);

  /// Converts the [NotificationParams] to JSON.
  Map<String, dynamic> toJson() => _$NotificationParamsToJson(this);

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

  /// The types of notifications to return.
  final List<String>? types;

  /// The types of notifications to exclude.
  @JsonKey(name: 'exclude_types')
  final List<String>? excludeTypes;

  /// Return only notifications related from this account.
  @JsonKey(name: 'account_id')
  final String? accountId;
}
