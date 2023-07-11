import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';

import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

/// Unfollow the given account.
/// POST /api/v1/accounts/:id/unfollow HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#unfollow
Future<Response> onRequest<T>(RequestContext context, String id) async {
  // Only allow POST requests.
  if (context.request.method != HttpMethod.post) {
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

  // Get the media attachment from the database.
  final idNumber = BigInt.parse(id);
  final record = await db.userRecord.findUnique(
    where: UserRecordWhereUniqueInput(id: idNumber),
  );
  final did = record?.did;
  if (did == null) Response(statusCode: HttpStatus.notFound);

  final profile = await bluesky.actors.findProfile(actor: did!);

  // Check if we are actually following the account and get the follow uri
  // so we can delete it. Otherwise we just skip this step and return
  // the relationship.
  final followUri = profile.data.viewer.following;
  if (followUri != null) {
    await bluesky.repositories.deleteRecord(uri: followUri);
  }

  final rel = await MastodonRelationship.getActorRelationship(bluesky, record!);

  // Return the post that we just liked.
  return threadedJsonResponse(
    body: rel,
  );
}
