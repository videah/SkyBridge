import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'search_params.g.dart';

/// Parameter options for the statuses endpoint.
@JsonSerializable()
class SearchParams {
  /// Constructs an instance of [SearchParams].
  SearchParams({
    required this.query,
    this.type,
    this.resolve = false,
    this.following = false,
    this.accountId,
    this.excludeUnreviewed = false,
    this.maxId,
    this.minId,
    this.limit = 20,
    this.offset,
  });

  /// Converts JSON into a [SearchParams].
  factory SearchParams.fromJson(Map<String, dynamic> json) =>
      _$SearchParamsFromJson(json);

  /// Converts the [SearchParams] to JSON.
  Map<String, dynamic> toJson() => _$SearchParamsToJson(this);

  /// The search query.
  @JsonKey(name: 'q')
  final String query;

  /// Specify what to search for (accounts, hashtags, or statuses).
  final SearchType? type;

  /// Attempt WebFinger lookup on the query.
  @JsonKey(toJson: boolToInt, fromJson: intToBool)
  final bool resolve;

  /// Whether to only include accounts that the user is following.
  @JsonKey(toJson: boolToInt, fromJson: intToBool)
  final bool following;

  /// If provided, will only return posts by this account.
  @JsonKey(name: 'account_id')
  final String? accountId;

  /// Whether to filter out unreviewed tags.
  @JsonKey(name: 'exclude_unreviewed', toJson: boolToInt, fromJson: intToBool)
  final bool excludeUnreviewed;

  /// Return results older than this ID.
  @JsonKey(name: 'max_id')
  final String? maxId;

  /// Return results immediately newer than this ID.
  @JsonKey(name: 'min_id')
  final String? minId;

  /// Maximum number of results to return.
  @JsonKey(fromJson: stringToInt)
  final int limit;

  /// Skip the first n results.
  @JsonKey(fromJson: stringToInt)
  final int? offset;
}

/// The type of search to perform.
enum SearchType {
  /// Search for accounts.
  accounts,

  /// Search for hashtags.
  hashtags,

  /// Search for posts.
  statuses,
}