import 'dart:convert';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/repost_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';

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

/// Checks if a repost has been a [PostRecord], and if not, gives
/// it one. Either the existing or the newly created [PostRecord] is returned.
Future<PostRecord> postToDatabase(bsky.Post post) async {
  final existing =
      await db.postRecords.filter().cidEqualTo(post.cid).findFirst();
  if (existing == null) {
    final record = PostRecord(
      cid: post.cid,
      uri: post.uri.toString(),
      author: post.author.did,
    );
    final saved = await record.insert(post.indexedAt);
    return saved;
  } else {
    return existing;
  }
}

/// Checks if a repost has been a [RepostRecord], and if not, gives
/// it one. Either the existing or the newly created [RepostRecord] is returned.
Future<RepostRecord> repostToDatabase(bsky.FeedView view) async {
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

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorToDatabase(bsky.Actor actor) async {
  final existing =
      await db.userRecords.filter().didEqualTo(actor.did).findFirst();
  if (existing == null) {
    final record = UserRecord(did: actor.did, profileInfo: ProfileInfo());
    final saved = await record.insert();
    return saved;
  } else {
    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorProfileToDatabase(bsky.ActorProfile actor) async {
  final existing =
      await db.userRecords.filter().didEqualTo(actor.did).findFirst();
  if (existing == null) {
    final record = UserRecord(did: actor.did, profileInfo: ProfileInfo());
    final saved = await record.insert();
    return saved;
  } else {
    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> didToDatabase(String did) async {
  final existing = await db.userRecords.filter().didEqualTo(did).findFirst();
  if (existing == null) {
    final record = UserRecord(did: did, profileInfo: ProfileInfo());
    final saved = await record.insert();
    return saved;
  } else {
    return existing;
  }
}

/// Constructs a SHA256 hash of the reposter's DID and the original post's CID
/// to create a reproducible ID used to query for a [RepostRecord].
String constructRepostHash(String reposterDid, String cid) {
  return sha256.convert(utf8.encode(reposterDid + cid)).toString();
}
