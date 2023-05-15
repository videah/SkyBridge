import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/media_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_media_attachment.dart';

/// Get a media attachment, before it is attached to a post and posted, but
/// after it is accepted for processing. Use this method to check that the
/// full-sized media has finished processing.
/// GET /api/v1/media/:id HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/media/#get
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

  // Get the media attachment from the database.
  final idNumber = int.parse(id);
  final record = await db.mediaRecords.get(idNumber);
  if (record == null) Response(statusCode: HttpStatus.notFound);

  final attachment = MastodonMediaAttachment(
    id: record!.id.toString(),
    type: MediaType.image,
    previewUrl: '',
    url: '',
    description: record.description,
    blurhash: '',
  );

  // Return the post that we just liked.
  return Response.json(
    body: attachment,
  );
}
