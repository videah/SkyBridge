import 'package:bluesky/bluesky.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
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
    required this.emojis,
    required this.fields,
    this.header,
    this.headerStatic,
    this.followersCount = 0,
    this.followingCount = 0,
    this.statusesCount = 0,
    this.source,
    this.role,
  });

  /// Converts JSON into a [MastodonAccount] instance.
  factory MastodonAccount.fromJson(Map<String, dynamic> json) =>
      _$MastodonAccountFromJson(json);

  /// Converts the [MastodonAccount] to JSON.
  Map<String, dynamic> toJson() => _$MastodonAccountToJson(this);

  /// Creates a [MastodonAccount] from an [ActorProfile].
  static Future<MastodonAccount> fromActorProfile(
    ActorProfile profile,
  ) async {
    // Assign/get a user ID from the database.
    final user = await actorProfileToDatabase(profile);

    // Get the fallback URL for the avatar.
    final base = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    final avatarFallback = 'https://$base/pfp_fallback.png';
    final bannerFallback = 'https://$base/bnr_fallback.png';

    /* Get the user banner, if it exists.
    If not, ensure an empty string never gets passed through, so that clients
    such as Ice Cubes (that always expect a valid URL) don't break. */
    final userBanner = user.banner.isNotEmpty ? user.banner : null;

    return MastodonAccount(
      id: user.id.toString(),
      username: profile.handle,
      acct: profile.handle,
      displayName: profile.displayName ?? profile.handle,
      locked: false,
      bot: false,
      createdAt: DateTime.now().toUtc(),
      note: convertTextToLinks(profile.description),
      url: 'https://bsky.social/${profile.handle}',
      avatar: profile.avatar ?? avatarFallback,
      avatarStatic: profile.avatar ?? avatarFallback,
      header: userBanner ?? bannerFallback,
      headerStatic: userBanner ?? bannerFallback,
      followersCount: user.followersCount,
      followingCount: user.followsCount,
      statusesCount: user.postsCount,
      lastStatusAt: DateTime.now().toUtc(),
      emojis: [],
      fields: [],
    );
  }

  /// Creates a [MastodonAccount] from an [Actor].
  static Future<MastodonAccount> fromActor(Actor profile) async {
    // Assign/get a user ID from the database.
    final user = await actorToDatabase(profile);

    // Get the fallback URL for the avatar.
    final base = env.getOrElse(
      'SKYBRIDGE_BASEURL',
      () => throw Exception('SKYBRIDGE_BASEURL not set!'),
    );

    final avatarFallback = 'https://$base/pfp_fallback.png';
    final bannerFallback = 'https://$base/bnr_fallback.png';

    /* Get the user banner, if it exists.
    If not, ensure an empty string never gets passed through, so that clients
    such as Ice Cubes (that always expect a valid URL) don't break. */
    final userBanner = user.banner.isNotEmpty ? user.banner : null;

    return MastodonAccount(
      id: user.id.toString(),
      username: profile.handle,
      acct: profile.handle,
      displayName: profile.displayName ?? profile.handle,
      locked: false,
      bot: false,
      createdAt: DateTime.now(),
      note: convertTextToLinks(user.description),
      url: 'https://bsky.social/${profile.handle}',
      avatar: profile.avatar ?? avatarFallback,
      avatarStatic: profile.avatar ?? avatarFallback,
      header: userBanner ?? bannerFallback,
      headerStatic: userBanner ?? bannerFallback,
      followersCount: user.followersCount,
      followingCount: user.followsCount,
      statusesCount: user.postsCount,
      lastStatusAt: DateTime.now(),
      emojis: [],
      fields: [],
    );
  }

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
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
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
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime lastStatusAt;

  /// Custom emoji entities to be used when rendering the profile.
  final List<Map<String, dynamic>> emojis;

  /// Additional metadata attached to a profile as name-value pairs.
  final List<Map<String, dynamic>> fields;

  /// An extra attribute that contains source values to be used with API
  /// methods that verify credentials and update credentials.
  AccountSource? source;

  /// The role assigned to the currently authorized user.
  AccountRole? role;
}

/// A utility class for passing around profile information.
/// Bluesky posts don't contain profile information, so we have to
/// fetch it separately. This class is used to pass around that information
/// with type safety.
@embedded
class ProfileInfo {
  /// Creates a new [ProfileInfo] instance.
  ProfileInfo({
    this.banner = '',
    this.followersCount = 0,
    this.followsCount = 0,
    this.postsCount = 0,
    this.description = '',
  });

  /// Creates a new [ProfileInfo] instance from an [ActorProfile].
  factory ProfileInfo.fromActorProfile(ActorProfile profile) {
    return ProfileInfo(
      banner: profile.banner ?? '',
      followersCount: profile.followersCount,
      followsCount: profile.followsCount,
      postsCount: profile.postsCount,
      description: convertTextToLinks(profile.description ?? ''),
    );
  }

  /// The banner image of the user's profile.
  final String banner;

  /// The number of followers for the user.
  final int followersCount;

  /// The number of users the user is following.
  final int followsCount;

  /// The number of posts the user has made.
  final int postsCount;

  /// The user's profile description.
  final String description;
}

/// Extra attributes that contains source values to be used with API methods
/// that verify credentials and update credentials.
@JsonSerializable()
class AccountSource {
  /// Creates a new [AccountSource] instance.
  AccountSource({
    required this.note,
    required this.fields,
    required this.privacy,
    required this.sensitive,
    required this.language,
    required this.followRequestsCount,
  });

  /// Converts JSON into a [AccountSource] instance.
  factory AccountSource.fromJson(Map<String, dynamic> json) =>
      _$AccountSourceFromJson(json);

  /// Converts the [AccountSource] to JSON.
  Map<String, dynamic> toJson() => _$AccountSourceToJson(this);

  /// Profile bio, in plain-text instead of HTML.
  final String note;

  /// Metadata attached to a profile as name-value pairs.
  final List<AccountField> fields;

  /// The default post visibility for new posts.
  final PostVisibility privacy;

  /// Whether or not new posts should be marked as sensitive by default.
  final bool sensitive;

  /// The default language for new posts.
  final String language;

  /// The number of pending follow requests.
  @JsonKey(name: 'follow_requests_count')
  final int followRequestsCount;
}

/// A name-value pair attached to a profile.
@JsonSerializable()
class AccountField {
  /// Creates a new [AccountField] instance.
  AccountField({
    required this.name,
    required this.value,
    this.verifiedAt,
  });

  /// Converts JSON into a [AccountField] instance.
  factory AccountField.fromJson(Map<String, dynamic> json) =>
      _$AccountFieldFromJson(json);

  /// Converts the [AccountField] to JSON.
  Map<String, dynamic> toJson() => _$AccountFieldToJson(this);

  /// The key of a given field’s key-value pair.
  final String name;

  /// The value of a given field’s key-value pair.
  final String value;

  /// Timestamp of when the server verified a URL value for a rel=“me” link.
  @JsonKey(
    name: 'verified_at',
    fromJson: dateTimeFromISO8601,
    toJson: dateTimeToISO8601,
  )
  final DateTime? verifiedAt;
}

/// Represents a custom user role that grants permissions.
@JsonSerializable()
class AccountRole {
  /// Creates a new [AccountRole] instance.
  AccountRole({
    required this.id,
    required this.name,
    required this.permissions,
    required this.highlighted,
    this.color = '',
  });

  /// Converts JSON into a [AccountRole] instance.
  factory AccountRole.fromJson(Map<String, dynamic> json) =>
      _$AccountRoleFromJson(json);

  /// Converts the [AccountRole] to JSON.
  Map<String, dynamic> toJson() => _$AccountRoleToJson(this);

  /// The ID of the role.
  final int id;

  /// The name of the role.
  final String name;

  /// The hex code assigned to this role. If no hex code is assigned,
  /// the string will be empty.
  final String color;

  /// A bitmask that represents the sum of all permissions granted to the role.
  final int permissions;

  /// Whether the role is publicly visible as a badge on user profiles.
  final bool highlighted;
}
