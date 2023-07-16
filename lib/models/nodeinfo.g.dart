// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nodeinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) => NodeInfo(
      software: NodeSoftware.fromJson(json['software'] as Map<String, dynamic>),
      protocols:
          (json['protocols'] as List<dynamic>).map((e) => e as String).toList(),
      services: NodeServices.fromJson(json['services'] as Map<String, dynamic>),
      usage: NodeUsage.fromJson(json['usage'] as Map<String, dynamic>),
      openRegistrations: json['openRegistrations'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
      version: json['version'] as String? ?? '2.0',
    );

Map<String, dynamic> _$NodeInfoToJson(NodeInfo instance) => <String, dynamic>{
      'version': instance.version,
      'software': instance.software,
      'protocols': instance.protocols,
      'services': instance.services,
      'usage': instance.usage,
      'openRegistrations': instance.openRegistrations,
      'metadata': instance.metadata,
    };

NodeSoftware _$NodeSoftwareFromJson(Map<String, dynamic> json) => NodeSoftware(
      name: json['name'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$NodeSoftwareToJson(NodeSoftware instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
    };

NodeServices _$NodeServicesFromJson(Map<String, dynamic> json) => NodeServices(
      outbound:
          (json['outbound'] as List<dynamic>).map((e) => e as String).toList(),
      inbound:
          (json['inbound'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NodeServicesToJson(NodeServices instance) =>
    <String, dynamic>{
      'outbound': instance.outbound,
      'inbound': instance.inbound,
    };

NodeUsage _$NodeUsageFromJson(Map<String, dynamic> json) => NodeUsage(
      users: NodeUsers.fromJson(json['users'] as Map<String, dynamic>),
      localPosts: json['localPosts'] as int,
    );

Map<String, dynamic> _$NodeUsageToJson(NodeUsage instance) => <String, dynamic>{
      'users': instance.users,
      'localPosts': instance.localPosts,
    };

NodeUsers _$NodeUsersFromJson(Map<String, dynamic> json) => NodeUsers(
      total: json['total'] as int,
      activeMonth: json['activeMonth'] as int,
      activeHalfyear: json['activeHalfyear'] as int,
    );

Map<String, dynamic> _$NodeUsersToJson(NodeUsers instance) => <String, dynamic>{
      'total': instance.total,
      'activeMonth': instance.activeMonth,
      'activeHalfyear': instance.activeHalfyear,
    };
