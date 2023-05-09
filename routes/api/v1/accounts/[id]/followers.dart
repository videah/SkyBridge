import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/util.dart';

/// Returns accounts which follow the given account.
/// GET /api/v1/accounts/:id/followers HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#followers
Future<Response> onRequest(RequestContext context, String id) async {
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  // Get the user from the database.
  // If the user is not in the database we return 404.
  final idNumber = int.parse(id);
  final userRecord = await db.userRecords.get(idNumber);
  if (userRecord == null) return Response(statusCode: HttpStatus.notFound);

  final response = await bluesky.graphs.findFollowers(actor: userRecord.did);
  final followers = await db.writeTxn(() {
    return Future.wait(
      response.data.followers.map(MastodonAccount.fromActor),
    );
  });

  return Response.json(
    body: followers,
  );
}
