import 'dart:convert';

import 'package:bluesky/bluesky.dart' as bsky;

import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_mention.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:sky_bridge/util.dart';

/// The result of [processFacets].
/// Contains a list of mentions and the post content with HTML tags attached.
class ProcessedFacets {
  /// Creates a new [ProcessedFacets] instance.
  ProcessedFacets({
    required this.mentions,
    required this.htmlText,
  });

  /// The mentions that were found in the post.
  /// Attaches to [MastodonPost.mentions].
  final List<MastodonMention> mentions;

  /// The post content with HTML tags attached.
  /// Attaches to [MastodonPost.content].
  final String htmlText;
}

/// A tuple class of a [bsky.FacetMention] and the handle that was used to
/// reference it.
class MentionTuple {
  /// Creates a new [MentionTuple] instance.
  MentionTuple({
    required this.facet,
    required this.handle,
  });

  /// The mention that was found in the post.
  final bsky.FacetMention facet;

  /// The handle that was used to reference the mention.
  final String handle;
}

/// Processes the facets in a post.
/// This is used to convert mentions and links to clickable HTML tags
/// in a string of text.
///
/// This is used in [MastodonPost] to convert the content of a post to HTML.
Future<ProcessedFacets> processFacets(
  List<bsky.Facet> facets,
  String text,
) async {
  const escape = HtmlEscape(HtmlEscapeMode.element);

  // If there are no facets, we can just return the text as-is.
  if (facets.isEmpty) {
    return ProcessedFacets(
      mentions: [],
      htmlText: escape.convert(text),
    );
  }

  // Convert the text to bytes so we can be sure emoji doesn't mess up
  // the indices.
  final facetBytes = utf8.encode(text);

  // We'll store the output in a list of strings, and then join them at the end.
  final output = <String>[];

  // We keep a list of mentions because they get mapped to MastodonMentions
  // at the end.
  final mentions = <MentionTuple>[];

  // We get the base URL from the environment to use for profile URLs.
  final base = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  var lastPos = 0;
  for (final facet in facets) {
    for (final feature in facet.features) {
      // We're assuming only one feature per facet for now, but I guess
      // this could change in the future.
      // TODO(videah): Handle this.

      // Add the text before the facet.
      if (facet.index.byteStart > lastPos) {
        output.add(
          escape.convert(
            utf8.decode(
              facetBytes.sublist(
                lastPos,
                facet.index.byteStart,
              ),
            ),
          ),
        );
      }

      // Get the text of the facet.
      // This could be an @ handle or a URL. Link text can be different
      // from the actual URL, so we need to use the facet text.
      final facetText = utf8.decode(
        facetBytes.sublist(
          facet.index.byteStart,
          facet.index.byteEnd,
        ),
      );

      if (feature.data is bsky.FacetLink) {
        // Facet is a link, attach url to <a> tag.
        final link = feature.data as bsky.FacetLink;
        output.add(
          '<a href="${link.uri}" rel="nofollow noopener noreferrer" target="_blank">$facetText</a>',
        );
      } else if (feature.data is bsky.FacetMention) {
        // Facet is a mention, attach fake profile url to <a> tag.
        final mention = feature.data as bsky.FacetMention;
        final url = 'https://$base/@$facetText';
        output.add(
          '<span class="h-card"><a href="$url" class="u-url mention" rel="nofollow noopener noreferrer" target="_blank">$facetText</a></span>',
        );
        mentions.add(MentionTuple(facet: mention, handle: facetText));
      }
      lastPos = facet.index.byteEnd;
    }
  }

  // Add the text after the last facet.
  output.add(escape.convert(utf8.decode(facetBytes.sublist(lastPos))));

  // Map mention facets to MastodonMention objects.
  final mentionUsers = await Future.wait(
    mentions.map(
      (mention) async {
        final record = await didToDatabase(mention.facet.did);
        final handle = mention.handle.substring(1); // Remove the @.
        return MastodonMention(
          id: record.id.toString(),
          username: handle,
          url: '$base/@${mention.handle.substring(1)}',
          acct: handle,
        );
      },
    ),
  );

  return ProcessedFacets(
    mentions: mentionUsers,
    htmlText: output.join(),
  );
}
