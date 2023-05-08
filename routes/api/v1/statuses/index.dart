import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:bluesky_text/bluesky_text.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/forms/new_post_form.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// Publish a new post with the given parameters.
/// POST /api/v1/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#create
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow POST requests.
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // Construct bluesky connection.
  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  // Determine if the request is a JSON request or a form request.
  final request = context.request;
  final type = context.request.headers[HttpHeaders.contentTypeHeader] ?? '';
  Map<String, dynamic> body;
  if (type.contains('application/json')) {
    body = await request.json() as Map<String, dynamic>;
  } else {
    body = await request.formData();
  }

  final form = NewPostForm.fromJson(body);

  // Find any linked entities like mentions or links.
  final entities = form.status?.entities ?? [];
  final dids = await findDIDsForPost(bluesky, entities);

  // Create a new post with attached entities.
  // TODO(videah): Add media support.
  final newPost = await bluesky.feeds.createPost(
    text: form.status?.value ?? '',
    facets: entities.map((e) {
      switch (e.type) {
        case EntityType.handle:
          return bsky.Facet(
            index: bsky.ByteSlice(
              byteStart: e.indices.start,
              byteEnd: e.indices.end,
            ),
            features: [
              bsky.FacetFeature.mention(
                data: bsky.FacetMention(did: dids[e.value]!),
              ),
            ],
          );
        case EntityType.link:
          return bsky.Facet(
            index: bsky.ByteSlice(
              byteStart: e.indices.start,
              byteEnd: e.indices.end,
            ),
            features: [
              bsky.FacetFeature.link(
                data: bsky.FacetLink(uri: e.value),
              ),
            ],
          );
      }
    }).toList(),
  );

  // Get our newly created post.
  final response = await bluesky.feeds.findPosts(uris: [newPost.data.uri]);
  final postData = response.data.posts.first;

  // Construct and return the new post as a [MastodonPost].
  final mastodonPost = await db.writeTxn(
    () => MastodonPost.fromBlueSkyPost(postData),
  );

  return Response.json(
    body: mastodonPost,
  );
}
