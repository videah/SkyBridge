import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';

part 'repost_record.g.dart';

/// A database entry that maps Bluesky reposts to Mastodon-like 64bit ID's that
/// clients will expect.
///
/// Bluesky reposts do not get assigned ID's like Mastodon posts do, so we do
/// a bunch of trickery to generate a unique ID for each repost.
@collection
class RepostRecord {
  /// Constructs a new [RepostRecord] with the given [hashId].
  RepostRecord({
    required this.hashId,
  });

  /// The unique 64bit ID of this repost entry.
  late Id id;

  /// SHA256 hash of the original post's CID and the reposter's DID.
  /// This is used to identify reposts at a later time.
  @Index(unique: true)
  final String hashId;

  /// The original post being reposted in the form of a [PostRecord].
  final originalPost = IsarLink<PostRecord>();

  /// Inserts a new [PostRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  ///
  /// Bluesky does not assign a CID to reposts, so to get consistent results
  /// we generate an ID hashing the original post's CID and the reposter's DID.
  Future<RepostRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. Worker ID 1 is reserved for reposts.
      id = generateSnowflake(date: createdAt, workerId: 1, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.repostRecords.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.repostRecords.put(this);
        print('Successfully inserted RepostRecord with ID $id');
        return this;
      }
    }
  }
}
