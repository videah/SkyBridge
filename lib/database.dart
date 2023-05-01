import 'package:bluesky/bluesky.dart' as bsky;
import 'package:isar/isar.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';

/// Global Isar database instance. Initialized in main.dart on startup.
/// Used to store 64-bit integer IDs for posts and accounts.
late final Isar db;

/// Generates a 64bit time-sortable ID similar to Twitter/Mastodon's Snowflake
/// IDs. This is used to generate unique IDs for [CIDPair] and [DIDPair].
int generateSnowflake({
  required DateTime date,
  required int workerId,
  required int sequence,
}) {
  final epoch = DateTime(2010).millisecondsSinceEpoch;
  final timestamp = date.millisecondsSinceEpoch - epoch;

  // 42 bits for time in milliseconds
  // 5 bits for a worker id (gives us up to 32 workers)
  // 5 bits for a custom value (0 in our case)
  // 12 bits for an auto-incrementing sequence
  var id = timestamp << 22;
  id |= workerId << 17;
  id |= 0 << 12;
  id |= sequence;

  return id;
}

/// Checks if a post has been assigned a 64-bit integer ID, and if not, gives
/// it one. The newly assigned ID is returned.
Future<int> checkPost(bsky.Post post) async {
  final existing =
      await db.postRecords.filter().cidEqualTo(post.cid).findFirst();
  if (existing == null) {
    final record = PostRecord(
      cid: post.cid,
      uri: post.uri.toString(),
      author: post.author.did,
    );
    final saved = await record.insert(post.indexedAt);
    return saved.id;
  } else {
    return existing.id;
  }
}

/// Checks if a DID has been assigned a 64-bit integer ID, and if not, gives
/// it one. The newly assigned ID is returned.
Future<int> checkDID(String did) async {
  final existing = await db.userRecords.filter().didEqualTo(did).findFirst();
  if (existing == null) {
    final record = UserRecord(did: did);
    final saved = await record.insert();
    return saved.id;
  } else {
    return existing.id;
  }
}

/// Processes [bsky.FeedView]'s to assign them 64-bit integer IDs if they don't
/// already have them. Returns a map of the original CID to the new ID.
Future<Map<String, int>> markDownFeedView(List<bsky.FeedView> views) async {
  final pairs = <String, int>{};
  await db.writeTxn(() async {
    for (final view in views) {
      final id = await checkPost(view.post);
      pairs[view.post.cid] = id;
    }
  });

  return pairs;
}

/// Processes [bsky.Post]'s to assign them 64-bit integer IDs if they don't
/// already have them. Returns a map of the original CID to the new ID.
Future<void> markDownPosts(List<bsky.Post> posts) async {
  await db.writeTxn(() async {
    for (final post in posts) {
      await checkPost(post);
    }
  });
}

/// Processes [bsky.ActorProfile]'s to assign them 64-bit integer IDs if they
/// don't already have them. Returns a map of the original DID to the new ID.
Future<Map<String, int>> markDownAccountProfiles(
  List<bsky.ActorProfile> profiles,
) async {
  final pairs = <String, int>{};
  await db.writeTxn(() async {
    for (final profile in profiles) {
      final id = await checkDID(profile.did);
      pairs[profile.did] = id;
    }
  });

  return pairs;
}

/// Processes [bsky.Actor]'s to assign them 64-bit integer IDs if they
/// don't already have them. Returns a map of the original DID to the new ID.
Future<Map<String, int>> markDownAccounts(List<bsky.Actor> accounts) async {
  final pairs = <String, int>{};
  await db.writeTxn(() async {
    for (final account in accounts) {
      final id = await checkDID(account.did);
      pairs[account.did] = id;
    }
  });

  return pairs;
}
