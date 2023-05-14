import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/forms/new_post_form.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';

/// Publish a new post with the given parameters.
/// POST /api/v1/statuses HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/statuses/#create
Future<Response> onRequest<T>(RequestContext context) async {
  // Only allow POST requests.
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  // Get a bluesky connection/session from the a provided bearer token.
  // If the token is invalid, bail out and return an error.
  final bluesky = await blueskyFromContext(context);
  if (bluesky == null) return authError();

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
  var facets = <Map<String, dynamic>>[];

  bsky.ReplyRef? postReplyRef;
  final replyId = form.inReplyToId;
  if (replyId != null) {
    final record = await db.postRecords.get(replyId);

    // The post we're trying to reply to doesn't exist in the database.
    if (record == null) return Response(statusCode: HttpStatus.notFound);

    final uri = bsky.AtUri.parse(record.uri);
    final post = (await bluesky.feeds.findPosts(uris: [uri])).data.posts.first;

    final parentRef = bsky.StrongRef(
      cid: post.cid,
      uri: post.uri,
    );

    // If the post we're replying to is itself a reply we need to grab the root
    // from it. Otherwise the root is the post we're replying to.
    final reply = post.record.reply;
    postReplyRef = bsky.ReplyRef(
      root: reply != null ? reply.root : parentRef,
      parent: parentRef,
    );
  }

  // Find any linked entities like mentions or links.
  final status = form.status;
  if (status != null) {
    facets = await status.entities.toFacets();
  }

  // Create a new post with attached entities.
  // TODO(videah): Add media support.
  final newPost = await bluesky.feeds.createPost(
    text: form.status?.value ?? '',
    facets: facets.map(bsky.Facet.fromJson).toList(),
    reply: postReplyRef,
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
