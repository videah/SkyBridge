import 'package:bluesky/bluesky.dart' as bsky;
import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';

part 'media_record.g.dart';

/// A database entry that stores information about a media attachment upload
/// pending attachment to a post.
///
/// The layout of this is essentially a flattened [bsky.Blob] with a bonus
/// description field for alt text.
@collection
class MediaRecord {
  /// Constructs a new [MediaRecord].
  MediaRecord({
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  /// Turn a [bsky.Blob] into a [MediaRecord] along with a [description].
  factory MediaRecord.fromBlob(bsky.Blob blob, String description) {
    return MediaRecord(
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

  /// The unique 64bit ID of this entry.
  late Id id;

  /// The type of media attachment.
  final String type;

  /// The MIME type of the media attachment.
  final String mimeType;

  /// The size of the media attachment in bytes(?).
  final int size;

  /// The link to the media attachment. This is not a URL.
  final String link;

  /// The description of the media attachment. This is the alt text.
  final String description;

  /// Inserts a new [MediaRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<MediaRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. Worker ID 3 is reserved for media.
      id = generateSnowflake(date: createdAt, workerId: 3, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.mediaRecords.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.mediaRecords.put(this);
        print('Successfully inserted MediaRecord with ID $id');
        return this;
      }
    }
  }
}
