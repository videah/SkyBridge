import 'dart:convert';
import 'dart:typed_data';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/models/database/feed_record.dart';
import 'package:sky_bridge/models/database/notification_record.dart';
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

/// Checks if a post has been assigned a [PostRecord], and if not, gives
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

/// Checks if a embed post has been assigned a [PostRecord], and if not, gives
/// it one. Either the existing or the newly created [PostRecord] is returned.
Future<PostRecord?> embedPostToDatabase(bsky.EmbedViewRecordView view) async {
  return await view.map(
    record: (record) async {
      final post = record.data;
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
    },
    notFound: (_) => null,
    blocked: (_) => null,
    generatorView: (_) => null,
    unknown: (_) => null,
  );
}

/// Checks if a repost has been assigned a [RepostRecord], and if not, gives
/// it one. Either the existing or the newly created [RepostRecord] is returned.
Future<RepostRecord> repostToDatabase(bsky.FeedView view) async {
  // Double check that this is a repost, bail if not.
  final repost = view.reason?.map(
    repost: (repost) => repost,
    unknown: (_) => null,
  );
  final isRepost = repost != null;
  if (!isRepost) {
    throw ArgumentError('FeedView is not a repost');
  }

  final cid = view.post.cid;
  // Get the original post, we are assuming we already have it in our database.
  final original = await db.postRecords.filter().cidEqualTo(cid).findFirst();
  if (original == null) {
    throw ArgumentError('Original post not found in database!');
  }

  final reposterDid = repost.data.by.did;
  final createdAt = repost.data.indexedAt;
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
    final record = UserRecord(
      did: actor.did,
      profileInfo: ProfileInfo.fromActorProfile(actor),
    );
    final saved = await record.insert();
    return saved;
  } else {
    final record = UserRecord(
      did: actor.did,
      profileInfo: ProfileInfo.fromActorProfile(actor),
    )..id = existing.id;
    await db.userRecords.put(record);
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

/// Checks if a notification has been assigned a [NotificationRecord],
/// and if not, gives it one. Either the existing or the newly
/// created [NotificationRecord] is returned.
Future<NotificationRecord> notificationToDatabase(
  bsky.Notification notification,
) async {
  final existing = await db.notificationRecords
      .filter()
      .cidEqualTo(notification.cid)
      .findFirst();

  if (existing == null) {
    final record = NotificationRecord(
      cid: notification.cid,
      uri: notification.uri.toString(),
    );
    final saved = await record.insert(notification.indexedAt);
    return saved;
  } else {
    return existing;
  }
}

/// Checks if a feed has been assigned a [FeedRecord], and if not, gives
/// it one. Either the existing or the newly created [FeedRecord] is returned.
Future<FeedRecord> feedToDatabase(bsky.FeedGeneratorView feed) async {
  final existing =
      await db.feedRecords.filter().cidEqualTo(feed.cid).findFirst();
  if (existing == null) {
    final record = FeedRecord(
      cid: feed.cid,
      uri: feed.uri.toString(),
      author: feed.did,
    );
    final saved = await record.insert(feed.indexedAt);
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

/// Hash the DID and use the first 64 bits as the ID.
///
/// I *think* this is ok to do, we don't have a way of knowing when
/// an account was created so we can't use the creation date to construct
/// a snowflake. We might have to change this in the future.
///
/// The chances of collision are unbelievably low, but it's still
/// technically possible. Might want to add a check for this in the future.
int hashBlueskyToId(String bskyId) {
  final hashBytes = sha256.convert(utf8.encode(bskyId)).bytes;
  final hashUint8List = Uint8List.fromList(hashBytes);
  final hashData = ByteData.view(hashUint8List.buffer);
  return hashData.getUint64(0) & 0x7fffffffffffffff; // 63-bit positive mask
}
