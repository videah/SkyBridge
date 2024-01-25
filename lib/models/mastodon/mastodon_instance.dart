import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';

part 'mastodon_instance.g.dart';

/// Represents the software instance of Mastodon running on this domain.
@JsonSerializable()
class MastodonInstance {
  /// Constructs an instance of [MastodonInstance].
  MastodonInstance({
    required this.domain,
    required this.title,
    required this.version,
    required this.sourceUrl,
    required this.description,
    required this.usage,
    required this.thumbnail,
    required this.languages,
    required this.configuration,
    required this.registrations,
    required this.contact,
    required this.rules,
  });

  /// Converts JSON into a [MastodonInstance] instance.
  factory MastodonInstance.fromJson(Map<String, dynamic> json) =>
      _$MastodonInstanceFromJson(json);

  /// Converts a [MastodonInstance] instance into JSON.
  Map<String, dynamic> toJson() => _$MastodonInstanceToJson(this);

  /// The domain name of the instance.
  final String domain;

  /// The title of the website.
  final String title;

  /// The version of Mastodon the instance is running.
  final String version;

  /// The URL for the source code of the software running on this instance.
  @JsonKey(name: 'source_url')
  final String sourceUrl;

  /// A short, plain-text description defined by the admin.
  final String description;

  /// Usage data for this instance.
  final UsageInfo usage;

  /// An image used to represent this instance.
  final InstanceThumbnail thumbnail;

  /// Primary languages of this instance and its staff.
  final List<String> languages;

  /// Configured values and limits for this instance.
  final InstanceConfiguration configuration;

  /// Information about registration on this instance.
  final RegistrationConfiguration registrations;

  /// Hints related to contacting a representative of this instance.
  final ContactInfo contact;

  /// An itemized list of [Rule]s for this website.
  final List<Rule> rules;
}

/// An image used to represent an instance.
@JsonSerializable()
class InstanceThumbnail {
  /// Constructs an instance of [MastodonInstance].
  InstanceThumbnail({
    required this.url,
    required this.blurhash,
    required this.versions,
  });

  /// Converts JSON into a [InstanceThumbnail] instance.
  factory InstanceThumbnail.fromJson(Map<String, dynamic> json) =>
      _$InstanceThumbnailFromJson(json);

  /// Converts a [InstanceThumbnail] instance into JSON.
  Map<String, dynamic> toJson() => _$InstanceThumbnailToJson(this);

  /// The URL for the thumbnail image.
  final String url;

  /// A hash computed by the BlurHash algorithm, for generating
  /// colorful preview thumbnails when media has not been downloaded yet.
  final String blurhash;

  /// Links to scaled resolution images, for high DPI screens.
  final ThumbnailVersions versions;
}

/// Links to scaled resolution images, for high DPI screens.
@JsonSerializable()
class ThumbnailVersions {
  /// Constructs an instance of [ThumbnailVersions].
  ThumbnailVersions({required this.oneTimes, required this.twoTimes});

  /// Converts JSON into a [ThumbnailVersions] instance.
  factory ThumbnailVersions.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailVersionsFromJson(json);

  /// Converts a [ThumbnailVersions] instance into JSON.
  Map<String, dynamic> toJson() => _$ThumbnailVersionsToJson(this);

  /// The URL for the thumbnail image at 1x resolution.
  @JsonKey(name: '@1x')
  final String oneTimes;

  /// The URL for the thumbnail image at 2x resolution.
  @JsonKey(name: '@2x')
  final String twoTimes;
}

/// Configured values and limits for an instance.
@JsonSerializable()
class InstanceConfiguration {
  /// Constructs an instance of [InstanceConfiguration].
  InstanceConfiguration({
    required this.urls,
    required this.accounts,
    required this.statuses,
    required this.mediaAttachments,
    required this.polls,
    required this.translation,
  });

  /// Converts JSON into a [InstanceConfiguration] instance.
  factory InstanceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$InstanceConfigurationFromJson(json);

  /// Converts a [InstanceConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$InstanceConfigurationToJson(this);

  /// URLs of interest for clients apps.
  final Map<String, String> urls;

  /// Limits related to accounts.
  final AccountConfiguration accounts;

  /// Limits related to authored statuses.
  final StatusConfiguration statuses;

  /// Hints for which attachments will be accepted.
  @JsonKey(name: 'media_attachments')
  final MediaConfiguration mediaAttachments;

  /// Limits related to polls.
  final PollConfiguration polls;

  /// Hints related to translation.
  final TranslationConfiguration translation;
}

/// Limits related to accounts.
@JsonSerializable()
class AccountConfiguration {
  /// Constructs an instance of [AccountConfiguration].
  AccountConfiguration({required this.maxFeaturedTags});

  /// Converts JSON into a [AccountConfiguration] instance.
  factory AccountConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AccountConfigurationFromJson(json);

  /// Converts a [AccountConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$AccountConfigurationToJson(this);

  /// The maximum number of featured tags allowed for each account.
  @JsonKey(name: 'max_featured_tags')
  final int maxFeaturedTags;
}

/// Limits related to authoring statuses.
@JsonSerializable()
class StatusConfiguration {
  /// Constructs an instance of [StatusConfiguration].
  StatusConfiguration({
    required this.maxCharacters,
    required this.maxMediaAttachments,
    required this.charactersReservedPerUrl,
  });

  /// Converts JSON into a [StatusConfiguration] instance.
  factory StatusConfiguration.fromJson(Map<String, dynamic> json) =>
      _$StatusConfigurationFromJson(json);

  /// Converts a [StatusConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$StatusConfigurationToJson(this);

  /// The maximum number of characters allowed in a post.
  @JsonKey(name: 'max_characters')
  final int maxCharacters;

  /// The maximum number of media attachments allowed in a post.
  @JsonKey(name: 'max_media_attachments')
  final int maxMediaAttachments;

  /// The number of characters that a URL counts for in a post.
  @JsonKey(name: 'characters_reserved_per_url')
  final int charactersReservedPerUrl;
}

/// Hints for which attachments will be accepted.
@JsonSerializable()
class MediaConfiguration {
  /// Constructs an instance of [MediaConfiguration].
  MediaConfiguration({
    required this.supportedMimeTypes,
    required this.imageSizeLimit,
    required this.imageMatrixLimit,
    required this.videoSizeLimit,
    required this.videoFrameRateLimit,
    required this.videoMatrixLimit,
  });

  /// Converts JSON into a [MediaConfiguration] instance.
  factory MediaConfiguration.fromJson(Map<String, dynamic> json) =>
      _$MediaConfigurationFromJson(json);

  /// Converts a [MediaConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$MediaConfigurationToJson(this);

  /// The supported MIME that can be uploaded.
  @JsonKey(name: 'supported_mime_types')
  final List<String> supportedMimeTypes;

  /// The maximum size of an image attachment in bytes.
  @JsonKey(name: 'image_size_limit')
  final int imageSizeLimit;

  /// The maximum number of pixels (width times height) for image uploads.
  @JsonKey(name: 'image_matrix_limit')
  final int imageMatrixLimit;

  /// The maximum size of a video attachment in bytes.
  @JsonKey(name: 'video_size_limit')
  final int videoSizeLimit;

  /// The maximum frame rate for any uploaded video.
  @JsonKey(name: 'video_frame_rate_limit')
  final int videoFrameRateLimit;

  /// The maximum number of pixels (width times height) for video uploads.
  @JsonKey(name: 'video_matrix_limit')
  final int videoMatrixLimit;
}

/// Limits related to polls.
@JsonSerializable()
class PollConfiguration {
  /// Constructs an instance of [PollConfiguration].
  PollConfiguration({
    required this.maxOptions,
    required this.maxCharactersPerOption,
    required this.minExpiration,
    required this.maxExpiration,
  });

  /// Converts JSON into a [PollConfiguration] instance.
  factory PollConfiguration.fromJson(Map<String, dynamic> json) =>
      _$PollConfigurationFromJson(json);

  /// Converts a [PollConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$PollConfigurationToJson(this);

  /// The maximum number of options allowed in a poll.
  @JsonKey(name: 'max_options')
  final int maxOptions;

  /// The maximum number of characters allowed in a poll option.
  @JsonKey(name: 'max_characters_per_option')
  final int maxCharactersPerOption;

  /// The shortest allowed poll duration in seconds.
  @JsonKey(name: 'min_expiration')
  final int minExpiration;

  /// The longest allowed poll duration in seconds.
  @JsonKey(name: 'max_expiration')
  final int maxExpiration;
}

/// Hints related to translation.
@JsonSerializable()
class TranslationConfiguration {
  /// Constructs an instance of [TranslationConfiguration].
  TranslationConfiguration({required this.enabled});

  /// Converts JSON into a [TranslationConfiguration] instance.
  factory TranslationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TranslationConfigurationFromJson(json);

  /// Converts a [TranslationConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$TranslationConfigurationToJson(this);

  /// Whether translation is enabled.
  final bool enabled;
}

/// Information about registering for an instance.
@JsonSerializable()
class RegistrationConfiguration {
  /// Constructs an instance of [RegistrationConfiguration].
  RegistrationConfiguration({
    required this.enabled,
    required this.approvalRequired,
    this.message,
  });

  /// Converts JSON into a [RegistrationConfiguration] instance.
  factory RegistrationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RegistrationConfigurationFromJson(json);

  /// Converts a [RegistrationConfiguration] instance into JSON.
  Map<String, dynamic> toJson() => _$RegistrationConfigurationToJson(this);

  /// Whether registration is enabled.
  final bool enabled;

  /// Whether registration requires moderator approval.
  @JsonKey(name: 'approval_required')
  final bool approvalRequired;

  /// A custom message to be shown when registrations are closed.
  final String? message;
}

/// Hints related to contacting a representative of an instance.
@JsonSerializable()
class ContactInfo {
  /// Constructs an instance of [ContactInfo].
  ContactInfo({
    required this.email,
    this.account,
  });

  /// Converts JSON into a [ContactInfo] instance.
  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  /// Converts a [ContactInfo] instance into JSON.
  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  /// An email addressed that can be messaged regarding inquiries or issues.
  final String email;

  /// An account that can be contacted natively over the network regarding
  /// inquiries or issues.
  final MastodonAccount? account;
}

/// Represents a rule that server users should follow.
@JsonSerializable()
class Rule {
  /// Constructs an instance of [Rule].
  Rule({
    required this.id,
    required this.text,
  });

  /// Converts JSON into a [Rule] instance.
  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  /// Converts a [Rule] instance into JSON.
  Map<String, dynamic> toJson() => _$RuleToJson(this);

  /// An identifier for the rule.
  final String id;

  /// The rule to be followed.
  final String text;
}

/// Usage data for an instance.
@JsonSerializable()
class UsageInfo {
  /// Constructs an instance of [UsageInfo].
  UsageInfo({required this.users});

  /// Converts JSON into a [UsageInfo] instance.
  factory UsageInfo.fromJson(Map<String, dynamic> json) =>
      _$UsageInfoFromJson(json);

  /// Converts a [UsageInfo] instance into JSON.
  Map<String, dynamic> toJson() => _$UsageInfoToJson(this);

  /// Usage data related to users on an instance.
  final UsersUsageInfo users;
}

/// Usage data related to users on an instance.
@JsonSerializable()
class UsersUsageInfo {
  /// Constructs an instance of [UsersUsageInfo].
  UsersUsageInfo({required this.activeMonth});

  /// Converts JSON into a [UsersUsageInfo] instance.
  factory UsersUsageInfo.fromJson(Map<String, dynamic> json) =>
      _$UsersUsageInfoFromJson(json);

  /// Converts a [UsersUsageInfo] instance into JSON.
  Map<String, dynamic> toJson() => _$UsersUsageInfoToJson(this);

  /// The number of active users in the last month.
  @JsonKey(name: 'active_month')
  final int activeMonth;
}
