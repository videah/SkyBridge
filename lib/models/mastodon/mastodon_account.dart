import 'package:bluesky/bluesky.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/util.dart';

part 'mastodon_account.g.dart';

/// Representation for a Mastodon account.
@JsonSerializable()
class MastodonAccount {

  /// Constructs an instance of [MastodonAccount].
  MastodonAccount({
    required this.id,
    required this.username,
    required this.acct,
    required this.displayName,
    required this.locked,
    required this.bot,
    required this.createdAt,
    required this.note,
    required this.url,
    required this.avatar,
    required this.avatarStatic,
    required this.lastStatusAt,
    required this.source,
    required this.emojis,
    required this.fields,
    this.header,
    this.headerStatic,
    this.followersCount,
    this.followingCount,
    this.statusesCount,
  });

  /// Creates a [MastodonAccount] from an [ActorProfile].
  factory MastodonAccount.fromActorProfile(
    ActorProfile profile,
    Map<String, int> pairs,
  ) {
    return MastodonAccount(
      id: (pairs[profile.did] ?? -1).toString(),
      username: profile.handle,
      acct: profile.handle,
      displayName: profile.displayName ?? profile.handle,
      locked: false,
      bot: false,
      createdAt: DateTime.now(),
      note: profile.description ?? '',
      url: 'https://bsky.social/${profile.handle}',
      avatar: profile.avatar ?? '',
      avatarStatic: profile.avatar ?? '',
      header: profile.banner ?? '',
      headerStatic: profile.banner ?? '',
      followersCount: profile.followersCount,
      followingCount: profile.followsCount,
      statusesCount: profile.postsCount,
      lastStatusAt: DateTime.now(),
      source: {},
      emojis: [],
      fields: [],
    );
  }

  /// Creates a [MastodonAccount] from an [Actor].
  factory MastodonAccount.fromActor(
    Actor profile,
    Map<String, int> pairs, {
    ProfileInfo? profileInfo,
  }) {
    return MastodonAccount(
      id: (pairs[profile.did] ?? -1).toString(),
      username: profile.handle,
      acct: profile.handle,
      displayName: profile.displayName ?? profile.handle,
      locked: false,
      bot: false,
      createdAt: DateTime.now(),
      note: profileInfo?.description ?? '',
      url: 'https://bsky.social/${profile.handle}',
      avatar: profile.avatar ?? '',
      avatarStatic: profile.avatar ?? '',
      header: profileInfo?.banner,
      headerStatic: profileInfo?.banner,
      followersCount: profileInfo?.followersCount,
      followingCount: profileInfo?.followsCount,
      statusesCount: profileInfo?.postsCount,
      lastStatusAt: DateTime.now(),
      source: {},
      emojis: [],
      fields: [],
    );
  }

  /// Converts JSON into a [MastodonAccount] instance.
  factory MastodonAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonAccountFromJson(json);

  /// Converts the [MastodonAccount] to JSON.
  Map<String, dynamic> toJson() => _$MastodonAccountToJson(this);

  /// The 64-bit account id of the user.
  final String id;

  /// The username/handle of the user. (e.g. "dril.bsky.social")
  final String username;

  /// The webfinger acct: URI of the user.
  final String acct;

  /// The display name of the user. (e.g "wint")
  @JsonKey(name: 'display_name')
  final String displayName;

  /// Whether or not the user's account is locked.
  final bool locked;

  /// Whether or not the user's account is a bot.
  final bool bot;

  /// The date and time the user's account was created.
  @JsonKey(
    name: 'created_at',
    fromJson: dateTimeFromEpoch,
    toJson: dateTimeToEpoch,
  )
  final DateTime createdAt;

  /// The user's profile description.
  final String note;

  /// The URL of the user's profile.
  final String url;

  /// The URL of the user's avatar.
  final String avatar;

  /// The URL of the user's avatar.
  @JsonKey(name: 'avatar_static')
  final String avatarStatic;

  /// The URL of the user's banner image.
  final String? header;

  /// The URL of the user's banner image.
  @JsonKey(name: 'header_static')
  final String? headerStatic;

  /// The number of followers the user has.
  @JsonKey(name: 'followers_count')
  final int? followersCount;

  /// The number of users the user is following.
  @JsonKey(name: 'following_count')
  final int? followingCount;

  /// The number of posts the user has made.
  @JsonKey(name: 'statuses_count')
  final int? statusesCount;

  /// The date and time the user's last status was posted.
  @JsonKey(
    name: 'last_status_at',
    fromJson: dateTimeFromEpoch,
    toJson: dateTimeToEpoch,
  )
  final DateTime lastStatusAt;

  /// An extra attribute that contains source values to be used with API methods
  /// that verify credentials and update credentials.
  final Map<String, dynamic> source;

  /// Custom emoji entities to be used when rendering the profile.
  final List<Map<String, dynamic>> emojis;

  /// Additional metadata attached to a profile as name-value pairs.
  final List<Map<String, dynamic>> fields;
}

/// A utility class for passing around profile information.
/// Bluesky posts don't contain profile information, so we have to
/// fetch it separately. This class is used to pass around that information
/// with type safety.
class ProfileInfo {

  /// Creates a new [ProfileInfo] instance.
  ProfileInfo({
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  /// Creates a new [ProfileInfo] instance from an [ActorProfile].
  factory ProfileInfo.fromActorProfile(ActorProfile profile) {
    return ProfileInfo(
      banner: profile.banner,
      followersCount: profile.followersCount,
      followsCount: profile.followsCount,
      postsCount: profile.postsCount,
      description: profile.description,
    );
  }

  /// The banner image of the user's profile.
  final String? banner;

  /// The number of followers for the user.
  final int? followersCount;

  /// The number of users the user is following.
  final int? followsCount;

  /// The number of posts the user has made.
  final int? postsCount;

  /// The user's profile description.
  final String? description;
}
