import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';

import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/util.dart';

/// Follow the given account. Can also be used to update whether to
/// show reblogs or enable notifications.
/// POST /api/v1/accounts/:id/follow HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#follow
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
  final idNumber = int.parse(id);
  final record = await db.userRecords.get(idNumber);
  final did = record?.did;
  if (did == null) Response(statusCode: HttpStatus.notFound);

  // Check if we're already following the account.
  final profile = await bluesky.actors.findProfile(actor: did!);
  final alreadyFollowing = profile.data.viewer.following != null;

  // If we're not following the account, create a follow record.
  if (!alreadyFollowing) await bluesky.graphs.createFollow(did: did);

  final rel = await MastodonRelationship.getActorRelationship(bluesky, record!);

  // Return the post that we just liked.
  return threadedJsonResponse(
    body: rel,
  );
}
