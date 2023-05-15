// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_instance_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonInstanceV1 _$MastodonInstanceV1FromJson(Map<String, dynamic> json) =>
    MastodonInstanceV1(
      uri: json['uri'] as String,
      title: json['title'] as String,
      shortDescription: json['short_description'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      version: json['version'] as String,
      urls: json['urls'] as Map<String, dynamic>,
      stats: StatInfo.fromJson(json['stats'] as Map<String, dynamic>),
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      registrations: json['registrations'] as bool,
      approvalRequired: json['approval_required'] as bool,
      invitesEnabled: json['invites_enabled'] as bool,
      configuration: InstanceConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnail: json['thumbnail'] as String?,
      contactAccount: json['contact_account'] == null
          ? null
          : MastodonAccount.fromJson(
              json['contact_account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MastodonInstanceV1ToJson(MastodonInstanceV1 instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'title': instance.title,
      'short_description': instance.shortDescription,
      'description': instance.description,
      'email': instance.email,
      'version': instance.version,
      'urls': instance.urls,
      'stats': instance.stats,
      'thumbnail': instance.thumbnail,
      'languages': instance.languages,
      'registrations': instance.registrations,
      'approval_required': instance.approvalRequired,
      'invites_enabled': instance.invitesEnabled,
      'configuration': instance.configuration,
      'contact_account': instance.contactAccount,
      'rules': instance.rules,
    };

StatInfo _$StatInfoFromJson(Map<String, dynamic> json) => StatInfo(
      userCount: json['user_count'] as int,
      statusCount: json['status_count'] as int,
      domainCount: json['domain_count'] as int,
    );

Map<String, dynamic> _$StatInfoToJson(StatInfo instance) => <String, dynamic>{
      'user_count': instance.userCount,
      'status_count': instance.statusCount,
      'domain_count': instance.domainCount,
    };
