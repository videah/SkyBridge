import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// View accounts in a list.
/// GET /api/v1/lists/:id/accounts HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/lists/#accounts
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // If the id is not a number we return 404 for now.
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Construct bluesky connection.
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the user record from the database.
  final idNumber = BigInt.parse(id);
  final record = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  if (record == null) Response(statusCode: HttpStatus.notFound);

  // Get up to date profile information and convert it to a [MastodonAccount].
  final response = await bluesky.actors.findProfile(actor: record!.did);
  final profile = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(response.data),
  );

  // Return the user information as a list.
  // In the future we might have to support actual lists, but for now
  // this is just the profile associated with a custom feed.
  return threadedJsonResponse(
    body: [profile],
  );
}
