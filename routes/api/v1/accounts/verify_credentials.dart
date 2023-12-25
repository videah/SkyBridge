import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Test to make sure that the user token works.
/// GET /api/v1/accounts/verify_credentials HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#verify_credentials
Future<Response> onRequest(RequestContext context) async {
  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final session = await sessionFromContext(context);
  if (session == null) return authError();
  final bluesky = bsky.Bluesky.fromSession(session);

  final profile = await bluesky.actor.getProfile(actor: session.did);

  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  // Attach a source field with miscellaneous information about the
  // account. Ivory expects this for editing profile information.
  account
    ..source = AccountSource(
      note: profile.data.description ?? '',
      fields: [],
      privacy: PostVisibility.public,
      sensitive: false,
      language: 'en',
      followRequestsCount: 0,
    )

    // Attach a basic role.
    ..role = AccountRole(
      id: 99,
      name: '',
      permissions: 65536,
      highlighted: false,
    );

  return threadedJsonResponse(
    body: account,
  );
}
