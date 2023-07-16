import 'package:json_annotation/json_annotation.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

part 'nodeinfo.g.dart';

/// Metadata exposed for clients that require NodeInfo for instance information.
/// Specifically 2.0 as that is what Mastodon uses.
/// See more: http://nodeinfo.diaspora.software
@JsonSerializable()
class NodeInfo {
  /// Constructs an instance of [NodeInfo].
  NodeInfo({
    required this.software,
    required this.protocols,
    required this.services,
    required this.usage,
    required this.openRegistrations,
    required this.metadata,
    this.version = '2.0',
  });

  /// Converts JSON into a [NodeInfo] instance.
  factory NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$NodeInfoFromJson(json);

  /// Returns a [NodeInfo] instance with default values applicable
  /// for spoofing a Mastodon instance.
  static Future<NodeInfo> fromDefaults() async {
    final userCount = await db.sessionRecord.aggregate().$count().id();
    final postCount = await db.postRecord.aggregate().$count().id();

    return NodeInfo(
      software: NodeSoftware(
        name: 'mastodon',
        version: '4.1.2',
      ),
      protocols: [
        'activitypub',
      ],
      services: NodeServices(
        inbound: [],
        outbound: [],
      ),
      usage: NodeUsage(
        users: NodeUsers(
          total: userCount,
          activeHalfyear: userCount,
          activeMonth: userCount,
        ),
        localPosts: postCount,
      ),
      openRegistrations: false,
      metadata: {},
    );
  }

  /// Converts the [NodeInfo] to JSON.
  Map<String, dynamic> toJson() => _$NodeInfoToJson(this);

  /// The schema version, must be 2.0.
  final String version;

  /// Metadata about server software in use.
  final NodeSoftware software;

  /// The protocols supported on this server.
  final List<String> protocols;

  /// The 3rd party sites this server can connect to via their application API.
  final NodeServices services;

  final NodeUsage usage;

  /// Whether this server allows open self-registration.
  final bool openRegistrations;

  /// Free form key value pairs for software specific values.
  /// Clients should not rely on any specific key present.
  final Map<String, dynamic> metadata;
}

/// Metadata about server software in use.
@JsonSerializable()
class NodeSoftware {
  /// Constructs an instance of [NodeSoftware].
  NodeSoftware({
    required this.name,
    required this.version,
  });

  /// Converts JSON into a [NodeSoftware] instance.
  factory NodeSoftware.fromJson(Map<String, dynamic> json) =>
      _$NodeSoftwareFromJson(json);

  /// Converts the [NodeSoftware] to JSON.
  Map<String, dynamic> toJson() => _$NodeSoftwareToJson(this);

  /// The canonical name of this server software.
  final String name;

  /// The version of this server software.
  final String version;
}

/// The 3rd party sites this server can connect to via their application API.
@JsonSerializable()
class NodeServices {
  /// Constructs an instance of [NodeServices].
  NodeServices({
    required this.outbound,
    required this.inbound,
  });

  /// Converts JSON into a [NodeServices] instance.
  factory NodeServices.fromJson(Map<String, dynamic> json) =>
      _$NodeServicesFromJson(json);

  /// Converts the [NodeServices] to JSON.
  Map<String, dynamic> toJson() => _$NodeServicesToJson(this);

  /// The 3rd party sites this server can publish messages to on
  /// the behalf of a user.
  final List<String> outbound;

  /// The third party sites this server can retrieve messages from for combined
  /// display with regular traffic.
  final List<String> inbound;
}

/// Usage statistics for this server.
@JsonSerializable()
class NodeUsage {
  /// Constructs an instance of [NodeUsage].
  NodeUsage({
    required this.users,
    required this.localPosts,
  });

  /// Converts JSON into a [NodeUsage] instance.
  factory NodeUsage.fromJson(Map<String, dynamic> json) =>
      _$NodeUsageFromJson(json);

  /// Converts the [NodeUsage] to JSON.
  Map<String, dynamic> toJson() => _$NodeUsageToJson(this);

  /// Statistics about the users of this server.
  final NodeUsers users;

  /// The amount of posts that were made by users that are registered on this
  /// server.
  final int localPosts;
}

/// Statistics about the users of this server.
@JsonSerializable()
class NodeUsers {
  /// Constructs an instance of [NodeUsers].
  NodeUsers({
    required this.total,
    required this.activeMonth,
    required this.activeHalfyear,
  });

  /// Converts JSON into a [NodeUsers] instance.
  factory NodeUsers.fromJson(Map<String, dynamic> json) =>
      _$NodeUsersFromJson(json);

  /// Converts the [NodeUsers] to JSON.
  Map<String, dynamic> toJson() => _$NodeUsersToJson(this);

  /// The total amount of registered users on this server.
  final int total;

  /// The amount of users that signed in at least once in the last 30 days.
  final int activeMonth;

  /// The amount of users that signed in at least once in the last 180 days.
  final int activeHalfyear;
}
