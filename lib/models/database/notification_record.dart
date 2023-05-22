import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';

part 'notification_record.g.dart';

/// A database entry that stores information about a notification that is
/// sent to a user.
@collection
class NotificationRecord {
  /// Constructs a new [NotificationRecord].
  NotificationRecord({
    required this.cid,
    required this.uri,
  });

  /// The unique 64bit ID of this entry.
  late Id id;

  /// The fingerprint hash content ID used to identify Bluesky objects.
  @Index()
  final String cid;

  /// ATP URI pointing to the post.
  /// See: https://atproto.com/specs/at-uri-scheme
  final String uri;

  /// Inserts a new [NotificationRecord] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<NotificationRecord> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. Worker ID 2 is reserved for notifications.
      id = generateSnowflake(date: createdAt, workerId: 2, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.notificationRecords.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.notificationRecords.put(this);
        print('Successfully inserted NotificationRecord with ID $id');
        return this;
      }
    }
  }
}
