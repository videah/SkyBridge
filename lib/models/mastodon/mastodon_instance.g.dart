// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonInstance _$MastodonInstanceFromJson(Map<String, dynamic> json) =>
    MastodonInstance(
      domain: json['domain'] as String,
      title: json['title'] as String,
      version: json['version'] as String,
      sourceUrl: json['source_url'] as String,
      description: json['description'] as String,
      usage: UsageInfo.fromJson(json['usage'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] as Map<String, dynamic>,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      configuration: InstanceConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      registrations: RegistrationConfiguration.fromJson(
          json['registrations'] as Map<String, dynamic>),
      contact: ContactInfo.fromJson(json['contact'] as Map<String, dynamic>),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MastodonInstanceToJson(MastodonInstance instance) =>
    <String, dynamic>{
      'domain': instance.domain,
      'title': instance.title,
      'version': instance.version,
      'source_url': instance.sourceUrl,
      'description': instance.description,
      'usage': instance.usage,
      'thumbnail': instance.thumbnail,
      'languages': instance.languages,
      'configuration': instance.configuration,
      'registrations': instance.registrations,
      'contact': instance.contact,
      'rules': instance.rules,
    };

InstanceConfiguration _$InstanceConfigurationFromJson(
        Map<String, dynamic> json) =>
    InstanceConfiguration(
      urls: Map<String, String>.from(json['urls'] as Map),
      accounts: AccountConfiguration.fromJson(
          json['accounts'] as Map<String, dynamic>),
      statuses: StatusConfiguration.fromJson(
          json['statuses'] as Map<String, dynamic>),
      mediaAttachments: MediaConfiguration.fromJson(
          json['media_attachments'] as Map<String, dynamic>),
      polls: PollConfiguration.fromJson(json['polls'] as Map<String, dynamic>),
      translation: TranslationConfiguration.fromJson(
          json['translation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstanceConfigurationToJson(
        InstanceConfiguration instance) =>
    <String, dynamic>{
      'urls': instance.urls,
      'accounts': instance.accounts,
      'statuses': instance.statuses,
      'media_attachments': instance.mediaAttachments,
      'polls': instance.polls,
      'translation': instance.translation,
    };

AccountConfiguration _$AccountConfigurationFromJson(
        Map<String, dynamic> json) =>
    AccountConfiguration(
      maxFeaturedTags: json['max_featured_tags'] as int,
    );

Map<String, dynamic> _$AccountConfigurationToJson(
        AccountConfiguration instance) =>
    <String, dynamic>{
      'max_featured_tags': instance.maxFeaturedTags,
    };

StatusConfiguration _$StatusConfigurationFromJson(Map<String, dynamic> json) =>
    StatusConfiguration(
      maxCharacters: json['max_characters'] as int,
      maxMediaAttachments: json['max_media_attachments'] as int,
      charactersReservedPerUrl: json['characters_reserved_per_url'] as int,
    );

Map<String, dynamic> _$StatusConfigurationToJson(
        StatusConfiguration instance) =>
    <String, dynamic>{
      'max_characters': instance.maxCharacters,
      'max_media_attachments': instance.maxMediaAttachments,
      'characters_reserved_per_url': instance.charactersReservedPerUrl,
    };

MediaConfiguration _$MediaConfigurationFromJson(Map<String, dynamic> json) =>
    MediaConfiguration(
      supportedMimeTypes: (json['supported_mime_types'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageSizeLimit: json['image_size_limit'] as int,
      imageMatrixLimit: json['image_matrix_limit'] as int,
      videoSizeLimit: json['video_size_limit'] as int,
      videoFrameRateLimit: json['video_frame_rate_limit'] as int,
      videoMatrixLimit: json['video_matrix_limit'] as int,
    );

Map<String, dynamic> _$MediaConfigurationToJson(MediaConfiguration instance) =>
    <String, dynamic>{
      'supported_mime_types': instance.supportedMimeTypes,
      'image_size_limit': instance.imageSizeLimit,
      'image_matrix_limit': instance.imageMatrixLimit,
      'video_size_limit': instance.videoSizeLimit,
      'video_frame_rate_limit': instance.videoFrameRateLimit,
      'video_matrix_limit': instance.videoMatrixLimit,
    };

PollConfiguration _$PollConfigurationFromJson(Map<String, dynamic> json) =>
    PollConfiguration(
      maxOptions: json['max_options'] as int,
      maxCharactersPerOption: json['max_characters_per_option'] as int,
      minExpiration: json['min_expiration'] as int,
      maxExpiration: json['max_expiration'] as int,
    );

Map<String, dynamic> _$PollConfigurationToJson(PollConfiguration instance) =>
    <String, dynamic>{
      'max_options': instance.maxOptions,
      'max_characters_per_option': instance.maxCharactersPerOption,
      'min_expiration': instance.minExpiration,
      'max_expiration': instance.maxExpiration,
    };

TranslationConfiguration _$TranslationConfigurationFromJson(
        Map<String, dynamic> json) =>
    TranslationConfiguration(
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$TranslationConfigurationToJson(
        TranslationConfiguration instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
    };

RegistrationConfiguration _$RegistrationConfigurationFromJson(
        Map<String, dynamic> json) =>
    RegistrationConfiguration(
      enabled: json['enabled'] as bool,
      approvalRequired: json['approval_required'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RegistrationConfigurationToJson(
        RegistrationConfiguration instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'approval_required': instance.approvalRequired,
      'message': instance.message,
    };

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      email: json['email'] as String,
      account: json['account'] == null
          ? null
          : MastodonAccount.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'email': instance.email,
      'account': instance.account,
    };

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
      id: json['id'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$RuleToJson(Rule instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

UsageInfo _$UsageInfoFromJson(Map<String, dynamic> json) => UsageInfo(
      users: UsersUsageInfo.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsageInfoToJson(UsageInfo instance) => <String, dynamic>{
      'users': instance.users,
    };

UsersUsageInfo _$UsersUsageInfoFromJson(Map<String, dynamic> json) =>
    UsersUsageInfo(
      activeMonth: json['active_month'] as int,
    );

Map<String, dynamic> _$UsersUsageInfoToJson(UsersUsageInfo instance) =>
    <String, dynamic>{
      'active_month': instance.activeMonth,
    };
