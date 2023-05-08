import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
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

  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

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
      profile = (await bluesky.actors.findProfile(actor: handle)).data;
    } catch (e) {
      // We just assume no account exists for now.
      print("Could not find profile with handle: ${encodedParams.query}");
      return Response.json(body: [], statusCode: HttpStatus.notFound);
    }

    final account = await db.writeTxn(
      () => MastodonAccount.fromActorProfile(profile),
    );

    return Response.json(
      body: [account],
    );
  } else {
    // We assume that the query is a general search query.
    final results = await bluesky.actors.searchActors(
      term: encodedParams.query,
      limit: encodedParams.limit,
    );

    // Get all the handles from the results and grab the full profile info.
    final handles = results.data.actors.map((actor) => actor.handle).toList();

    // Split handles into chunks of 25.
    // This is the max number of handles we can query at once.
    const chunkSize = 25;
    final profiles = <bsky.ActorProfile>[];
    for (var i = 0; i < handles.length; i += chunkSize) {
      // Process the current chunk of 25 handles which is currently the max
      // that bluesky allows you to query at once.
      final chunk = handles.sublist(
        i,
        i + chunkSize.clamp(0, handles.length - i),
      );

      // Get the profiles for the current chunk.
      final results = await bluesky.actors.findProfiles(
        actors: chunk,
      );
      profiles.addAll(results.data.profiles);
    }

    // Convert all the profiles to MastodonAccounts.
    final accounts = await db.writeTxn(() {
      return Future.wait(
        profiles.map(MastodonAccount.fromActorProfile),
      );
    });

    return Response.json(
      body: accounts,
    );
  }
}
