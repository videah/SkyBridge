import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';

/// Returns accounts which follow the given account.
/// GET /api/v1/accounts/:id/following HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#following
Future<Response> onRequest(RequestContext context, String id) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the user from the database.
  // If the user is not in the database we return 404.
  final idNumber = int.parse(id);
  final userRecord = await db.userRecords.get(idNumber);
  if (userRecord == null) return Response(statusCode: HttpStatus.notFound);

  final response = await bluesky.graphs.findFollows(actor: userRecord.did);
  final follows = await db.writeTxn(() {
    return Future.wait(
      response.data.follows.map(MastodonAccount.fromActor),
    );
  });

  return Response.json(
    body: follows,
  );
}
