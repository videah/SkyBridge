import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/repost_record.dart';

part 'post_record.g.dart';

/// A database entry that maps Bluesky CID's to Mastodon-like 64bit ID's that
/// clients will expect.
///
/// We store information we might need to access the post later such as the URI.
@collection
class PostRecord {
  /// Constructs a new [PostRecord] with the given [cid] and [uri].
  PostRecord({
    required this.cid,
    required this.uri,
    required this.author,
  });

  /// The unique 64bit ID of this entry.
  late Id id;

  /// The fingerprint hash content ID used to identify Bluesky objects.
  @Index()
  final String cid;

  /// ATP URI pointing to the post.
  /// See: https://atproto.com/specs/at-uri-scheme
  final String uri;

  /// The DID of the author of this post.
  /// See: https://atproto.com/specs/did-plc
  final String author;

  /// Inserts a new [PostRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<PostRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. Worker ID 0 is reserved for posts.
      id = generateSnowflake(date: createdAt, workerId: 0, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.postRecords.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.postRecords.put(this);
        print('Successfully inserted PostRecord with ID $id');
        return this;
      }
    }
  }

  /// If one doesn't already exists, inserts a new [RepostRecord] into the
  /// database with a unique, 64bit time-sortable ID somewhat similar to
  /// Twitter/Mastodon's Snowflake IDs.
  ///
  /// A SHA256 of the reposter's DID and the original post's CID is used to
  /// identify reposts at a later time.
  ///
  /// Returns the [RepostRecord] that was inserted or already existed.
  Future<RepostRecord> repost(DateTime createdAt, String reposterDid) async {
    // Hash the original post's CID and the reposter's DID.
    final hash = constructRepostHash(reposterDid, cid);

    final existing =
        await db.repostRecords.filter().hashIdEqualTo(hash).findFirst();

    // Repost already exists we don't have to do anything.
    if (existing != null) return existing;

    final repost = RepostRecord(hashId: hash)..originalPost.value = this;
    return repost.insert(createdAt);
  }
}
