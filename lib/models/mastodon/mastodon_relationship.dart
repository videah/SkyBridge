import 'package:bluesky/bluesky.dart' as bsky;
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

part 'mastodon_relationship.g.dart';

/// Represents the relationship between accounts, such as
/// following / blocking / muting / etc.
@JsonSerializable()
class MastodonRelationship {
  /// Constructs an instance of [MastodonRelationship].
  MastodonRelationship({
    required this.id,
    required this.following,
    required this.showingReblogs,
    required this.notifying,
    required this.languages,
    required this.followedBy,
    required this.blocking,
    required this.blockedBy,
    required this.muting,
    required this.mutingNotifications,
    required this.requested,
    required this.domainBlocking,
    required this.endorsed,
    required this.note,
  });

  /// Converts JSON into a [MastodonRelationship] instance.
  factory MastodonRelationship.fromJson(Map<String, dynamic> json) =>
      _$MastodonRelationshipFromJson(json);

  /// Converts the [MastodonRelationship] to JSON.
  Map<String, dynamic> toJson() => _$MastodonRelationshipToJson(this);

  /// Gets the [MastodonRelationship] values for a given [account].
  static Future<MastodonRelationship> getActorRelationship(
    bsky.Bluesky bluesky,
    UserRecord account,
  ) async {
    // Get the profile for the account and check the relationship with the
    // current user.
    final profile = await bluesky.actor.getProfile(actor: account.did);
    final blocking = profile.data.viewer.blocking != null;
    final blockedBy = profile.data.viewer.isBlockedBy;
    final muting = profile.data.viewer.isMuted;
    final following = profile.data.viewer.following != null;
    final followedBy = profile.data.viewer.followedBy != null;

    return MastodonRelationship(
      id: account.did,
      following: following,
      showingReblogs: false,
      notifying: false,
      languages: [],
      followedBy: followedBy,
      blocking: blocking,
      blockedBy: blockedBy,
      muting: muting,
      mutingNotifications: muting,
      requested: false,
      domainBlocking: false,
      endorsed: false,
      note: '',
    );
  }

  /// The account ID.
  final String id;

  /// Whether the current user is following the account.
  final bool following;

  /// Whether the current user is receiving this account's boosts on their home
  /// timeline.
  @JsonKey(name: 'showing_reblogs')
  final bool showingReblogs;

  /// Whether the current user has enabled notifications for this account.
  final bool notifying;

  /// Which languages the current user is following from this account.
  final List<String> languages;

  /// Whether the current user is followed by this account.
  @JsonKey(name: 'followed_by')
  final bool followedBy;

  /// Whether the current user is blocking this account.
  final bool blocking;

  /// Whether the current user is blocked by this account.
  @JsonKey(name: 'blocked_by')
  final bool blockedBy;

  /// Whether the current user is muting this account's posts.
  final bool muting;

  /// Whether the current user is muting notifications from this account.
  @JsonKey(name: 'muting_notifications')
  final bool mutingNotifications;

  /// Whether the current user has a pending follow request for this account.
  @JsonKey(name: 'requested')
  final bool requested;

  /// Whether the current user is blocking this account's domain.
  @JsonKey(name: 'domain_blocking')
  final bool domainBlocking;

  /// Whether the current user is featuring this user on their profile.
  @JsonKey(name: 'endorsed')
  final bool endorsed;

  /// The account's bio.
  final String note;
}
