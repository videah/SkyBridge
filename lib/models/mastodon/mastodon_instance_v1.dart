import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_instance.dart';

part 'mastodon_instance_v1.g.dart';

/// Represents the software instance of Mastodon running on this domain.
/// This is used in the now deprecated GET /api/v1/instance endpoint.
/// See: https://docs.joinmastodon.org/entities/V1_Instance
@JsonSerializable()
class MastodonInstanceV1 {
  /// Constructs an instance of [MastodonInstanceV1].
  MastodonInstanceV1({
    required this.uri,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.email,
    required this.version,
    required this.urls,
    required this.stats,
    required this.languages,
    required this.registrations,
    required this.approvalRequired,
    required this.invitesEnabled,
    required this.configuration,
    required this.rules,
    this.thumbnail,
    this.contactAccount,
  });

  /// Converts JSON into a [MastodonInstanceV1] instance.
  factory MastodonInstanceV1.fromJson(Map<String, dynamic> json) =>
      _$MastodonInstanceV1FromJson(json);

  /// Converts a [MastodonInstanceV1] instance into JSON.
  Map<String, dynamic> toJson() => _$MastodonInstanceV1ToJson(this);

  /// The domain name of the instance.
  final String uri;

  /// The title of the website.
  final String title;

  /// A short, plain-text description defined by the admin.
  @JsonKey(name: 'short_description')
  final String shortDescription;

  /// An HTML-permitted description of the Mastodon site.
  final String description;

  /// An email that may be contacted for any inquiries.
  final String email;

  /// The version of Mastodon the instance is running.
  final String version;

  /// URLs of interest for clients apps.
  final Map<String, dynamic> urls;

  /// Statistics about how much information the instance contains.
  final StatInfo stats;

  /// Banner image for the website.
  final String? thumbnail;

  /// Primary languages of the website and its staff.
  final List<String> languages;

  /// Whether registrations are enabled.
  final bool registrations;

  /// Whether registrations require moderator approval.
  @JsonKey(name: 'approval_required')
  final bool approvalRequired;

  /// Whether invites are enabled.
  @JsonKey(name: 'invites_enabled')
  final bool invitesEnabled;

  /// Configured values and limits for this website.
  final InstanceConfiguration configuration;

  /// A user that can be contacted, as an alternative to [email].
  @JsonKey(name: 'contact_account')
  final MastodonAccount? contactAccount;

  /// An itemises list of [Rule]s for this website.
  final List<Rule> rules;
}

/// Statistics about how much information the instance contains.
@JsonSerializable()
class StatInfo {
  /// Constructs an instance of [StatInfo].
  StatInfo({
    required this.userCount,
    required this.statusCount,
    required this.domainCount,
  });

  /// Converts JSON into a [StatInfo] instance.
  factory StatInfo.fromJson(Map<String, dynamic> json) =>
      _$StatInfoFromJson(json);

  /// Converts a [StatInfo] instance into JSON.
  Map<String, dynamic> toJson() => _$StatInfoToJson(this);

  /// Total users on this instance.
  @JsonKey(name: 'user_count')
  final int userCount;

  /// Total statuses on this instance.
  @JsonKey(name: 'status_count')
  final int statusCount;

  /// Total domains discovered by this instance.
  @JsonKey(name: 'domain_count')
  final int domainCount;
}
