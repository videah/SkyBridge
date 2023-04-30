import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';

part 'mastodon_mention.g.dart';

/// A mention of a user within a [MastodonPost].
@JsonSerializable()
class MastodonMention {

  /// Constructs an instance of [MastodonMention].
  MastodonMention({
    required this.id,
    required this.username,
    required this.url,
    required this.acct,
  });

  /// Converts JSON into a [MastodonMention] instance.
  factory MastodonMention.fromJson(Map<String, dynamic> json) =>
      _$MastodonMentionFromJson(json);

  /// Converts the [MastodonMention] to JSON.
  Map<String, dynamic> toJson() => _$MastodonMentionToJson(this);

  /// The account id of the mentioned user.
  final String id;

  /// The username of the mentioned user.
  final String username;

  /// The location of the mentioned user's profile.
  final String url;

  /// The webfinger acct: URI of the mentioned user.
  ///
  /// Equivalent to username for local users, or username@domain for
  /// remote users.
  final String acct;
}
