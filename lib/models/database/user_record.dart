import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';

part 'user_record.g.dart';

/// A database entry that maps Bluesky DID's to Mastodon-like 64bit ID's that
/// clients will expect.
@collection
class UserRecord {
  /// Constructs a new [UserRecord] with the given [did].
  UserRecord({
    required this.did,
    required this.profileInfo,
  });

  /// The unique 64bit ID of this entry.
  late Id id;

  /// The DID used to identify Bluesky users.
  /// See: https://atproto.com/specs/did-plc
  final String did;

  /// The last seen profile information of the user.
  ///
  /// Clients like Ivory expect posts to always have profile information
  /// attached to them, but Bluesky does not do this. We store the last seen
  /// profile information here so we can attach it to posts.
  final ProfileInfo profileInfo;

  /// Inserts a new [UserRecord] into the database with a unique, 64bit
  /// time-sortable ID.
  Future<UserRecord> insert() async {
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
    print('Successfully inserted UserRecord with ID $id');

    // Check if the ID already exists. Very unlikely, but possible.
    final exists = await db.userRecords.get(id);

    if (exists != null) {
      // Entry with this ID already exists, bailing out.
      throw Exception(
        'UserRecord with ID $id already exists! SHA256 collision?\n  $did : ${exists.did}',
      );
    }
    await db.userRecords.put(this);
    return this;
  }
}
