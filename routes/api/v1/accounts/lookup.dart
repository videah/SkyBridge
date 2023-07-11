import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/params/lookup_account_params.dart';
import 'package:sky_bridge/util.dart';

/// Quickly lookup a username to see if it is available.
/// GET /api/v1/accounts/lookup HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#lookup
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = LookupAccountParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  // Get the profile for the given handle.
  final profile = await bluesky.actors.findProfile(actor: encodedParams.acct);
  final account = await databaseTransaction(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  return threadedJsonResponse(
    body: account,
  );
}
