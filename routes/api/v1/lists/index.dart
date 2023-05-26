import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_list.dart';
import 'package:sky_bridge/util.dart';

/// Create a new list.
/// This is used to create custom feed entries in Bluesky's case.
/// POST /api/v1/lists HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/lists/#create
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    // Determine if the request is a JSON request or a form request.
    final request = context.request;
    final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
    Map<String, dynamic> body;
    if (type.contains('application/json')) {
      body = await request.json() as Map<String, dynamic>;
    } else {
      body = await request.formData();
    }

    // Get a bluesky connection/session from the a provided bearer token.
    // If the token is invalid, bail out and return an error.
    final bluesky = await blueskyFromContext(context);
    if (bluesky == null) return authError();

    final newList = MastodonList.fromJson(body);

    // Check if the title starts with an @ symbol.
    if (!newList.title.startsWith('@')) {
      // We're currently overloading Mastodon lists to support custom bluesky
      // feeds, but if bluesky ends up supporting lists natively we'll need to
      // account or both use cases.
      //
      // My plan for now is if the list name starts with an @ it's intended
      // to be a feed, otherwise it's a regular list.
      //
      // Since regular lists don't exist yet, we just bail out for now.
      return Response(statusCode: HttpStatus.badRequest);
    }

    // Get the profile info for the handle.
    final handle = newList.title.substring(1);
    late bsky.ActorProfile profile;
    try {
      profile = (await bluesky.actors.findProfile(actor: handle)).data;
    } catch (e) {
      return Response(statusCode: HttpStatus.notFound);
    }

    // Convert the profile to a user record.
    final userRecord = await db.writeTxn(
      () async => actorProfileToDatabase(profile),
    );

    // Check if that actor has any feed generators.
    final response = await bluesky.feeds.findActorFeeds(actor: userRecord.did);
    final feeds = response.data.feeds;

    // If there are no feeds, bail out.
    if (feeds.isEmpty) {
      print('No feeds found for actor: ${profile.handle}');
      return Response(statusCode: HttpStatus.notFound);
    }

    // Get information on the feeds like display name and if it's online.
    final generator = await bluesky.feeds.findGenerator(
      uri: feeds.first.uri,
    );

    return threadedJsonResponse(
      body: MastodonList(
        id: userRecord.id.toString(),
        title: generator.data.view.displayName,
        repliesPolicy: RepliesPolicy.list,
      ),
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
