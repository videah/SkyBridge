import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest<T>(RequestContext context, String id) async {
  // If the id is not a number we return 404
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  final idNumber = BigInt.parse(id);
  final user = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (user == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final profile = await bluesky.actor.getProfile(actor: user.did);

  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  return threadedJsonResponse(
    body: account,
  );
}
