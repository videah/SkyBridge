import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_relationship.dart';
import 'package:sky_bridge/models/params/relationship_params.dart';
import 'package:sky_bridge/util.dart';

/// Find out whether a given account is followed, blocked, muted, etc.
/// GET /api/v1/accounts/relationships HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#relationships
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParametersAll;
  final encodedParams = RelationshipParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get how each account relates to the current user, asynchronously.
  final futures = <Future<MastodonRelationship>>[];
  for (final id in encodedParams.ids) {
    final record = await db.userRecords.get(int.parse(id));
    if (record == null) continue;
    futures.add(MastodonRelationship.getActorRelationship(bluesky, record));
  }

  final relationships = await Future.wait(futures);

  return threadedJsonResponse(
    body: relationships,
  );
}
