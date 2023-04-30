import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';

part 'id_pairs.g.dart';

/// A database entry that maps Bluesky CID's to Mastodon-like 64bit ID's that
/// clients will expect.
@collection
class CIDPair {
  /// The unique 64bit ID of this entry.
  late Id id;

  /// The fingerprint hash content ID used to identify Bluesky objects.
  @Index(unique: true)
  late String cid;

  /// Inserts a new [CIDPair] into the database with a unique, 64bit
  /// time-sortable ID somewhat similar to Twitter/Mastodon's Snowflake IDs.
  Future<CIDPair> insert(DateTime createdAt) async {
    var sequence = 0;
    while (true) {
      // Generate a new Snowflake ID. We don't care about workerId right now.
      id = generateSnowflake(date: createdAt, workerId: 0, sequence: sequence);

      // Check if the ID already exists. Unlikely, but possible.
      final exists = await db.cIDPairs.get(id) != null;
      if (exists) {
        // Entry with this ID already exists, increment and try again.
        sequence++;
      } else {
        // Entry with this ID does not exist, insert it!
        await db.cIDPairs.put(this);
        print('Successfully inserted CIDPair with ID $id');
        return this;
      }
    }
  }
}

/// A database entry that maps Bluesky DID's to Mastodon-like 64bit ID's that
/// clients will expect.
@collection
class DIDPair {
  /// The unique 64bit ID of this entry.
  late Id id;

  /// The DID used to identify Bluesky users.
  late String did;

  /// Inserts a new [DIDPair] into the database with a unique, 64bit
  /// time-sortable ID.
  Future<DIDPair> insert() async {
    // Hash the DID and use the first 64 bits as the ID.
    //
    // I *think* this is ok to do, we don't have a way of knowing when
    // an account was created so we can't use the creation date to construct
    // a snowflake. We might have to change this in the future.
    //
    // The chances of collision are unbelievably low, but it's still
    // technically possible. Might want to add a check for this in the future.
    final hashBytes = sha256.convert(utf8.encode(did)).bytes;
    final hashUint8List = Uint8List.fromList(hashBytes);
    final hashData = ByteData.view(hashUint8List.buffer);
    id = hashData.getUint64(0) & 0x7fffffffffffffff; // 63-bit positive mask
    print('Successfully inserted DIDPair with ID $id');

    // Check if the ID already exists. Very unlikely, but possible.
    final exists = await db.dIDPairs.get(id) != null;

    if (exists) {
      // Entry with this ID already exists, bailing out.
      throw Exception('DIDPair with ID $id already exists! SHA256 collision?');
    }
    await db.dIDPairs.put(this);
    return this;
  }
}

/// Generates a 64bit time-sortable ID similar to Twitter/Mastodon's Snowflake
/// IDs. This is used to generate unique IDs for [CIDPair] and [DIDPair].
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
