import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';

part 'mastodon_list.g.dart';

/// Represents a list of some users that the authenticated user follows.
@JsonSerializable()
class MastodonList {
  /// Constructs an instance of [MastodonList].
  MastodonList({
    required this.title,
    required this.repliesPolicy,
    this.id,
  });

  /// Converts JSON into a [MastodonList] instance.
  factory MastodonList.fromJson(Map<String, dynamic> json) =>
      _$MastodonListFromJson(json);

  /// Converts a [MastodonList] instance into JSON.
  Map<String, dynamic> toJson() => _$MastodonListToJson(this);

  /// Converts a [bsky.FeedGenerator] to a [MastodonList].
  static Future<MastodonList> fromFeedGenerator(
    bsky.FeedGeneratorView gen,
  ) async {
    return MastodonList(
      id: (await feedToDatabase(gen)).id.toString(),
      title: gen.displayName,
      repliesPolicy: RepliesPolicy.list,
    );
  }

  /// The internal ID of the list in the database.
  final String? id;

  /// The user-defined title of the list.
  final String title;

  /// Which replies should be shown in the list.
  @JsonKey(name: 'replies_policy')
  final RepliesPolicy repliesPolicy;
}

/// Which replies should be shown in a list.
enum RepliesPolicy {
  /// Show replies to any followed user.
  followed,

  /// Show replies to member of the list.
  list,

  /// Show replies to no one.
  none,
}
