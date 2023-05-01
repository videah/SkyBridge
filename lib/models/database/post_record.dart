import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';

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
  });

  /// The unique 64bit ID of this entry.
  late Id id;

  /// The fingerprint hash content ID used to identify Bluesky objects.
  @Index(unique: true)
  final String cid;

  /// ATP URI pointing to the post.
  /// See: https://atproto.com/specs/at-uri-scheme
  final String uri;

  /// Inserts a new [PostRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<PostRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. We don't care about workerId right now.
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
}
