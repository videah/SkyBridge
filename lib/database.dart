import 'package:bluesky/bluesky.dart' as bsky;
import 'package:isar/isar.dart';
import 'package:sky_bridge/models/database/id_pairs.dart';

/// Global Isar database instance. Initialized in main.dart on startup.
/// Used to store 64-bit integer IDs for posts and accounts.
late final Isar db;

/// Checks if a post has been assigned a 64-bit integer ID, and if not, gives
/// it one. The newly assigned ID is returned.
Future<int> checkPost(bsky.Post post) async {
  final existing = await db.cIDPairs.filter().cidEqualTo(post.cid).findFirst();
  if (existing == null) {
    final pair = CIDPair()..cid = post.cid;
    final saved = await pair.insert(post.indexedAt);
    return saved.id;
  } else {
    return existing.id;
  }
}

/// Checks if a DID has been assigned a 64-bit integer ID, and if not, gives
/// it one. The newly assigned ID is returned.
Future<int> checkDID(String did) async {
  final existing = await db.dIDPairs.filter().didEqualTo(did).findFirst();
  if (existing == null) {
    final pair = DIDPair()..did = did;
    final saved = await pair.insert();
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
