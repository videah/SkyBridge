import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';

part 'feed_record.g.dart';

/// A database entry that maps Feed CIDs to Mastodon-like 64bit ID's that
/// clients will expect.
///
/// We store information we might need to access the feed later such as the URI.
@collection
class FeedRecord {
  /// Constructs a new [FeedRecord] with the given [cid] and [uri].
  FeedRecord({
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
  final String? author;

  /// Inserts a new [FeedRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<FeedRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. Worker ID 4 is reserved for feeds.
      id = generateSnowflake(date: createdAt, workerId: 4, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.feedRecords.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.feedRecords.put(this);
        print('Successfully inserted FeedRecord with ID $id');
        return this;
      }
    }
  }
}
