import 'dart:convert';
import 'dart:typed_data';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:crypto/crypto.dart';
import 'package:orm/orm.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

/// Global Isar database instance. Initialized in main.dart on startup.
/// Used to store 64-bit integer IDs for posts and accounts.
late final PrismaClient db;

/// Wrapper to execute a callback in a database transaction.
/// For now this does nothing and is a remnant of the now defunct
/// Isar database implementation.
Future<T> databaseTransaction<T>(Future<T> Function() callback) async {
  return callback();
}

/// The type of record with a unique index to generate a Snowflake ID for.
enum RecordType {
  /// A post.
  post(0),

  /// A repost.
  repost(1),

  /// A notification.
  notification(2),

  /// A media attachment.
  media(3),

  /// A feed.
  feed(4);

  const RecordType(this.value);

  /// The unique index for this record type.
  final int value;
}

/// Generates a 64bit time-sortable ID similar to Twitter/Mastodon's Snowflake
/// IDs. This is used to generate unique IDs for various records.
BigInt generateSnowflake({
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

  return BigInt.from(id);
}

/// Generates a *unique* 64bit time-sortable ID similar to Twitter/Mastodon's
/// Snowflake IDs. This is used to generate unique IDs for various records.
///
/// [checkCallback] is a callback function that returns a boolean indicating
/// if the ID already exists in the database. You should use a [ModelDelegate]
/// for this.
///
/// [recordType] is the type of record you are generating an ID for. This gives
/// each type a unique worker ID to prevent ID collisions between resources.
Future<BigInt> generateUniqueSnowflake<T>({
  required Future<T?> Function(BigInt id) checkCallback,
  required DateTime date,
  required RecordType recordType,
}) async {
  var sequence = 0;
  while (sequence < 1024) {
    // Generate a new Snowflake ID. Worker ID's are reserved in [recordType].
    final id = generateSnowflake(
      date: date,
      workerId: recordType.value,
      sequence: sequence,
    );

    // Check if the ID already exists. Unlikely, but possible.
    final existing = await checkCallback(id);
    if (existing != null) {
      // Entry with this ID already exists, increment and try again.
      sequence++;
    } else {
      return id;
    }
  }

  throw Exception('Failed to generate unique Snowflake ID, tried 1024 times.');
}

/// Checks if a post has been assigned a [PostRecord], and if not, gives
/// it one. Either the existing or the newly created [PostRecord] is returned.
Future<PostRecord> postToDatabase(bsky.Post post) async {
  final existing = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(cid: post.cid),
  );
  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: post.indexedAt,
      recordType: RecordType.post,
      checkCallback: (id) => db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(id: id),
      ),
    );

    return db.postRecord.upsert(
      where: PostRecordWhereUniqueInput(cid: post.cid),
      create: PostRecordCreateInput(
        id: id,
        cid: post.cid,
        uri: post.uri.toString(),
        authorDid: post.author.did,
      ),
      update: const PostRecordUpdateInput(),
    );
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
      final existing = await db.postRecord.findUnique(
        where: PostRecordWhereUniqueInput(cid: post.cid),
      );
      if (existing == null) {
        final id = await generateUniqueSnowflake(
          date: post.indexedAt,
          recordType: RecordType.post,
          checkCallback: (id) => db.postRecord.findUnique(
            where: PostRecordWhereUniqueInput(id: id),
          ),
        );
        return db.postRecord.upsert(
          where: PostRecordWhereUniqueInput(cid: post.cid),
          create: PostRecordCreateInput(
            id: id,
            cid: post.cid,
            uri: post.uri.toString(),
            authorDid: post.author.did,
          ),
          update: const PostRecordUpdateInput(),
        );
      } else {
        return existing;
      }
    },
    notFound: (_) => null,
    blocked: (_) => null,
    generatorView: (_) => null,
    unknown: (_) => null,
    listView: (_) => null,
  );
}

/// Checks if a repost has been assigned a [RepostRecord], and if not, gives
/// it one. Either the existing or the newly created [RepostRecord] is returned.
Future<RepostRecord> repostToDatabase(bsky.FeedView view) async {
  final repost = view.reason?.map(
    repost: (repost) => repost,
    unknown: (_) => null,
  );
  final isRepost = repost != null;
  if (!isRepost) {
    throw ArgumentError('FeedView is not a repost');
  }

  // Get the original post, we are assuming we already have it in our database.
  final original = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(cid: view.post.cid),
  );

  if (original == null) {
    throw ArgumentError('Original post not found in database!');
  }

  final reposterDid = repost.data.by.did;
  return original.repost(repost.data.indexedAt, reposterDid);
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorToDatabase(bsky.Actor actor) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: actor.did),
  );

  if (existing == null) {
    // Doesn't exist, create a new record.
    final id = hashBlueskyToId(actor.did);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: actor.did),
      create: UserRecordCreateInput(
        id: id,
        did: actor.did,
      ),
      update: const UserRecordUpdateInput(),
    );
  } else {
    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> actorProfileToDatabase(bsky.ActorProfile actor) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: actor.did),
  );

  if (existing == null) {
    // Doesn't exist, create a new record.
    final id = hashBlueskyToId(actor.did);
    final info = ProfileInfo.fromActorProfile(actor);

    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: actor.did),
      create: UserRecordCreateInput(
        id: id,
        did: actor.did,
        banner: info.banner,
        followsCount: info.followsCount,
        followersCount: info.followersCount,
        postsCount: info.postsCount,
        description: info.description,
      ),
      update: const UserRecordUpdateInput(),
    );
  } else {
    // Exists, update the record with any new information.
    await db.userRecord.update(
      where: UserRecordWhereUniqueInput(did: actor.did),
      data: UserRecordUpdateInput(
        banner: StringFieldUpdateOperationsInput(
          set: actor.banner ?? '',
        ),
        followsCount: IntFieldUpdateOperationsInput(
          set: actor.followsCount,
        ),
        followersCount: IntFieldUpdateOperationsInput(
          set: actor.followersCount,
        ),
        postsCount: IntFieldUpdateOperationsInput(
          set: actor.postsCount,
        ),
        description: StringFieldUpdateOperationsInput(
          set: actor.description ?? '',
        ),
      ),
    );

    return existing;
  }
}

/// Checks if a DID has been assigned a [UserRecord], and if not, gives
/// it one. Either the existing or the newly created [UserRecord] is returned.
Future<UserRecord> didToDatabase(String did) async {
  final existing = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(did: did),
  );
  if (existing == null) {
    // Hash the DID and use the first 64 bits as the ID.
    //
    // I *think* this is ok to do, we don't have a way of knowing when
    // an account was created so we can't use the creation date to construct
    // a snowflake. We might have to change this in the future.
    //
    // The chances of collision are unbelievably low, but it's still
    // technically possible. Might want to add a check for this in the future.
    final id = hashBlueskyToId(did);
    return db.userRecord.upsert(
      where: UserRecordWhereUniqueInput(did: did),
      create: UserRecordCreateInput(id: id, did: did),
      update: const UserRecordUpdateInput(),
    );
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
  final existing = await db.notificationRecord.findFirst(
    where: NotificationRecordWhereInput(
      cid: StringFilter(equals: notification.cid),
    ),
  );

  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: notification.indexedAt,
      recordType: RecordType.notification,
      checkCallback: (id) => db.notificationRecord.findUnique(
        where: NotificationRecordWhereUniqueInput(id: id),
      ),
    );
    final data = NotificationRecordCreateInput(
      id: id,
      cid: notification.cid,
      uri: notification.uri.toString(),
    );
    return db.notificationRecord.create(data: data);
  } else {
    return existing;
  }
}

/// Checks if a feed has been assigned a [FeedRecord], and if not, gives
/// it one. Either the existing or the newly created [FeedRecord] is returned.
Future<FeedRecord> feedToDatabase(bsky.FeedGeneratorView feed) async {
  final existing = await db.feedRecord.findFirst(
    where: FeedRecordWhereInput(
      cid: StringFilter(equals: feed.cid),
    ),
  );

  if (existing == null) {
    final id = await generateUniqueSnowflake(
      date: feed.indexedAt,
      recordType: RecordType.feed,
      checkCallback: (id) => db.feedRecord.findUnique(
        where: FeedRecordWhereUniqueInput(id: id),
      ),
    );
    final data = FeedRecordCreateInput(
      id: id,
      cid: feed.cid,
      uri: feed.uri.toString(),
      authorDid: feed.did,
    );
    return await db.feedRecord.create(data: data);
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
BigInt hashBlueskyToId(String bskyId) {
  final hashBytes = sha256.convert(utf8.encode(bskyId)).bytes;
  final hashUint8List = Uint8List.fromList(hashBytes);
  final hashData = ByteData.view(hashUint8List.buffer);
  final id = hashData.getUint64(0) & 0x7fffffffffffffff; // 63-bit positive mask
  return BigInt.from(id);
}

/// Extension on [PostRecord] to add a [repost] method, makes constructing
/// a [RepostRecord] easier.
extension RepostExtension on PostRecord {
  /// Takes a a date ([createdAt]) and a reposter's DID ([reposterDid]) and
  /// creates a [RepostRecord] for the post this is called on.
  Future<RepostRecord> repost(DateTime createdAt, String reposterDid) async {
    // Hash the original post's CID and the reposter's DID.
    final hash = constructRepostHash(reposterDid, cid);

    final existing = await db.repostRecord.findUnique(
      where: RepostRecordWhereUniqueInput(hashId: hash),
    );

    // If the repost already exists, return it.
    if (existing != null) return existing;

    // Otherwise, create a new repost record.
    final id = await generateUniqueSnowflake(
      date: createdAt,
      recordType: RecordType.repost,
      checkCallback: (id) => db.repostRecord.findUnique(
        where: RepostRecordWhereUniqueInput(id: id),
      ),
    );

    return db.repostRecord.upsert(
      where: RepostRecordWhereUniqueInput(hashId: hash),
      create: RepostRecordCreateInput(
        id: id,
        hashId: hash,
        originalPost: PostRecordCreateNestedOneWithoutRepostsInput(
          connect: PostRecordWhereUniqueInput(cid: cid),
        ),
      ),
      update: const RepostRecordUpdateInput(),
    );
  }
}

/// Extension methods for [MediaRecord] that convert back and forth between
/// [MediaRecord] and [bsky.Blob].
extension BlobExtension on MediaRecord {
  /// Turn a [bsky.Blob] into a [MediaRecord] along with a [description].
  static Future<MediaRecord> fromBlob(
    bsky.Blob blob,
    String description,
  ) async {
    final id = await generateUniqueSnowflake(
      date: DateTime.now().toUtc(),
      recordType: RecordType.media,
      checkCallback: (id) => db.mediaRecord.findUnique(
        where: MediaRecordWhereUniqueInput(id: id),
      ),
    );

    return MediaRecord(
      id: id,
      type: blob.type,
      mimeType: blob.mimeType,
      size: blob.size,
      link: blob.ref.link,
      description: description,
    );
  }

  /// Converts this [MediaRecord] back into a [bsky.Blob].
  bsky.Blob toBlob() {
    return bsky.Blob(
      type: type,
      mimeType: mimeType,
      size: size,
      ref: bsky.BlobRef(link: link),
    );
  }
}
