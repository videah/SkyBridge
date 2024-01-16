import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/models/params/search_account_params.dart';
import 'package:sky_bridge/util.dart';

/// Search for matching accounts by username or display name.
/// GET /api/v1/accounts/search HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/accounts/#search
Future<Response> onRequest(RequestContext context) async {
  final params = context.request.uri.queryParameters;
  final encodedParams = SearchAccountParams.fromJson(params);

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

  if (encodedParams.resolve) {
    // Query is a single handle, just need to return a single account.
    late final bsky.ActorProfile profile;
    try {
      // Strip the base url from the query handle.
      final base = env.getOrElse(
        'SKYBRIDGE_BASEURL',
        () => throw Exception('SKYBRIDGE_BASEURL not set!'),
      );

      final handle = encodedParams.query.replaceFirst('@$base', '');
      profile = (await bluesky.actor.getProfile(actor: handle)).data;
    } catch (e) {
      // We just assume no account exists for now.
      print('Could not find profile with handle: ${encodedParams.query}');
      return Response.json(body: [], statusCode: HttpStatus.notFound);
    }

    final account = await databaseTransaction(
      () => MastodonAccount.fromActorProfile(profile),
    );

    return Response.json(
      body: [account],
    );
  } else {
    // We assume that the query is a general search query.
    final results = await bluesky.actor.searchActors(
      term: encodedParams.query,
      limit: encodedParams.limit,
    );

    // Get all the handles from the results and grab the full profile info.
    final handles = results.data.actors.map((actor) => actor.handle).toList();

    final profiles = await chunkResults<bsky.ActorProfile, String>(
      items: handles,
      callback: (chunk) async {
        final response = await bluesky.actor.getProfiles(actors: chunk);
        return response.data.profiles;
      },
    );

    // Convert all the profiles to MastodonAccounts.
    final accounts = await databaseTransaction(() {
      return Future.wait(
        profiles.map(MastodonAccount.fromActorProfile),
      );
    });

    return threadedJsonResponse(
      body: accounts,
    );
  }
}
