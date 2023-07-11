import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

/// Handles redirects for URLs like /@username/1234 which are used
/// by the likes of Ivory to link to posts without leaving the app.
///
/// Other Mastodon clients don't do this so we just point directly to the
/// post on the web for now.
Future<Response> onRequest<T>(
  RequestContext context,
  String userId,
  String postId,
) async {

  // Only allow GET requests.
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // Check that the userId starts with @.
  if (!userId.startsWith('@')) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  final userHandle = userId.substring(1);

  // If the post ID isn't a number we return 404.
  if (int.tryParse(postId) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  // Get the media attachment from the database.
  final postIdNumber = BigInt.parse(postId);
  final record = await db.postRecord.findUnique(
    where: PostRecordWhereUniqueInput(id: postIdNumber),
  );

  // If there's no record, return 404.
  if (record == null) return Response(statusCode: HttpStatus.notFound);

  // Get the string after the last slash in the records URI.
  final post = record.uri.split('/').last;

  final relocateUrl = 'https://bsky.app/profile/$userHandle/post/$post';

  return Response(
    statusCode: HttpStatus.found,
    headers: {
      HttpHeaders.locationHeader: relocateUrl,
    },
  );
}
