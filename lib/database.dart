import 'dart:convert';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/repost_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';

/// Global Isar database instance. Initialized in main.dart on startup.
/// Used to store 64-bit integer IDs for posts and accounts.
late final Isar db;

/// Generates a 64bit time-sortable ID similar to Twitter/Mastodon's Snowflake
/// IDs. This is used to generate unique IDs for various records.
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

/// Checks if a repost has been assigned a 64-bit integer ID, and if not, gives
/// it one.
Future<RepostRecord> checkRepost(bsky.FeedView view) async {
  // Double check that this is a repost, bail if not.
  final isRepost = view.reason?.type.endsWith('reasonRepost') ?? false;
  if (!isRepost) {
    throw ArgumentError('FeedView is not a repost');
  }

  final cid = view.post.cid;
  // Get the original post, we are assuming we already have it in our database.
  final original = await db.postRecords.filter().cidEqualTo(cid).findFirst();
  if (original == null) {
    throw ArgumentError('Original post not found in database!');
  }

  final reposterDid = view.reason!.by.did;
  final createdAt = view.reason!.indexedAt;
  return original.repost(createdAt, reposterDid);
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
      // Is this view a repost? If so we need to assign two different unique IDs
      // one for the repost itself and one for the original post.
      // Bluesky reposts don't natively get assigned IDs so we need to be
      // clever to assign one.
      final isRepost = view.reason?.type.endsWith('reasonRepost') ?? false;

      final id = await checkPost(view.post);
      pairs[view.post.cid] = id;

      if (isRepost) {
        final repost = await checkRepost(view);
        pairs[repost.hashId] = repost.id;
      }
    }
  });

  return pairs;
}

/// Processes [bsky.Post]'s to assign them 64-bit integer IDs if they don't
/// already have them. Returns a map of the original CID to the new ID.
Future<Map<String, int>> markDownPosts(List<bsky.Post> posts) async {
  final pairs = <String, int>{};
  await db.writeTxn(() async {
    for (final post in posts) {
      final id = await checkPost(post);
      pairs[post.cid] = id;
    }
  });

  return pairs;
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

/// Constructs a SHA256 hash of the reposter's DID and the original post's CID
/// to create a reproducible ID used to query for a [RepostRecord].
String constructRepostHash(String reposterDid, String cid) {
  return sha256.convert(utf8.encode(reposterDid + cid)).toString();
}
