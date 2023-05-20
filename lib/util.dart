import 'dart:typed_data';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dotenv/dotenv.dart';
import 'package:sky_bridge/models/mastodon/mastodon_post.dart';
import 'package:template_expressions/template_expressions.dart';

/// Environment variables loaded from a .env file.
DotEnv env = DotEnv(includePlatformEnvironment: true);

/// Returns a [DateTime] from a Unix epoch in seconds.
DateTime dateTimeFromEpoch(int epoch) {
  return DateTime.fromMillisecondsSinceEpoch(epoch * 1000).toUtc();
}

/// Returns a Unix epoch in seconds from a [DateTime].
int dateTimeToEpoch(DateTime date) {
  return (date.millisecondsSinceEpoch / 1000).floor();
}

/// Returns a [DateTime] from an ISO 8601 string.
DateTime dateTimeFromISO8601(String date) {
  return DateTime.parse(date).toUtc();
}

/// Returns an ISO 8601 string from a [DateTime].
String? dateTimeToISO8601(DateTime? date) {
  return date?.toUtc().toIso8601String();
}

/// Extends [String] to allow for rudimentary string formatting/templating.
extension StringFormatExtension on String {
  /// Formats the string using the provided [context].
  /// This is a very rudimentary implementation of string formatting/templating.
  String format(Map<String, dynamic> context) {
    const syntax = HashExpressionSyntax();
    final template = Template(
      syntax: [syntax],
      value: this,
    );
    return template.process(context: context);
  }
}

/// Determines if the provided [password] is a valid app password.
void isValidAppPassword(String password) {
  final r = RegExp(
    r'^[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}-[a-zA-Z0-9]{4}$',
  );

  final isAppPassword = r.hasMatch(password);

  if (!isAppPassword) {
    throw Exception('Provided password is not an app password!');
  }
}

/// Takes a list of items and a function that processes the items in chunks,
/// returning a list of results for each chunk. returns a Future that resolves
/// to a list of all results combined.
///
/// This is useful for getting around Bluesky API limits, where a lot of
/// endpoints will restrict the number of items you can query at once to 25.
Future<List<T>> chunkResults<T, K>({
  required List<K> items,
  required Future<List<T>> Function(List<K> results) callback,
  int limit = 25,
}) async {
  final results = <T>[];
  for (var i = 0; i < items.length; i += limit) {
    // Process the current chunk of items.
    final chunk = items.sublist(i, i + limit.clamp(0, items.length - i));
    results.addAll(await callback(chunk));
  }

  return results;
}

/// Traverse the replies of a [bsky.PostThreadView] and return a list of
/// [MastodonPost]s with the correct reply IDs set, down to a certain [depth].
///
/// Creates a list of replies compatible with the Mastodon API
/// status context endpoint.
Future<List<MastodonPost>> traverseReplies(
  bsky.PostThreadView view,
  int depth,
) async {
  final result = <MastodonPost>[];
  await view.map(
    record: (record) async {
      // Get the current depth post and add it to the list.
      final currentPost = await MastodonPost.fromBlueSkyPost(record.data.post);
      result.add(currentPost);

      // We don't want to traverse too deep, 6 is just a number I pulled out
      // of thin air. Need to look into how deep Bluesky goes.
      if (depth < 6) {
        if (record.data.replies != null) {
          for (final view in record.data.replies!) {
            // Step down and recursively traverse the replies.
            // TODO(videah): Handle this better asynchronously.
            final list = await traverseReplies(view, depth + 1);
            for (final childPost in list) {
              if (childPost.inReplyToId == null) {
                // We have a dangling reply which means they are replying to
                // this current post. Set the IDs accordingly.
                childPost
                  ..inReplyToAccountId = currentPost.account.id
                  ..inReplyToId = currentPost.id;
              }
              result.add(childPost);
            }
          }
        }
      }
    },
    notFound: (_) {},
    blocked: (_) {},
    unknown: (_) {},
  );

  return result;
}

/// Traverse the parents of a [bsky.PostThreadView] and return a list of
/// [MastodonPost]s with the correct reply IDs set, up to a certain [depth].
///
/// Creates a list of parents compatible with the Mastodon API
/// status context endpoint.
Future<List<MastodonPost>> traverseParents(
  bsky.PostThreadView view,
  int depth,
) async {
  final result = <MastodonPost>[];
  await view.map(
    record: (record) async {
      // Get the current depth post and add it to the list.
      final currentPost = await MastodonPost.fromBlueSkyPost(record.data.post);

      // We don't want to traverse too deep, 6 is just a number I pulled out
      // of thin air. Need to look into how deep Bluesky goes.
      if (depth < 6) {
        final view = record.data.parent;
        if (view != null) {
          final list = await traverseParents(view, depth + 1);
          for (final childPost in list) {
            if (childPost.inReplyToId == null) {
              // We have a dangling reply which means they are replying to
              // this current post. Set the IDs accordingly.
              currentPost
                ..inReplyToAccountId = childPost.account.id
                ..inReplyToId = childPost.id;
            }
            result.add(childPost);
          }
        }
      }
      // Skip the first post.
      if (depth > 0) result.add(currentPost);
    },
    notFound: (_) {},
    blocked: (_) {},
    unknown: (_) {},
  );

  return result;
}

/// Parameter conversion functions.

/// Convert a bool to an int. Used for converting parameter values.
// ignore: avoid_positional_boolean_parameters
String boolToInt(bool? value) => value ?? true ? '1' : '0';

/// Convert an int to a bool. Used for converting parameter values.
bool intToBool(String? value) => int.parse(value ?? '0') == 1;

/// Convert a string to an int. Used for converting parameter values.
int stringToInt(String? value) => int.parse(value ?? '0');

/// Convert an int to a string. Used for converting parameter values.
String intToString(int? value) => value?.toString() ?? '0';

/// Convert a string to a bool Used for converting parameter values.
bool stringToBool(String? value) => value == 'true';

/// Convert a bool to a string. Used for converting parameter values.
String boolToString(bool? value) => value?.toString() ?? 'false';

/// Get the file extension of an image from its bytes.
String? imageBytesToExtension(List<int> bytes) {
  final buffer = bytes is! Uint8List ? Uint8List.fromList(bytes) : bytes;
  final magic = buffer.length >= 2 ? ((buffer[0] << 8) | buffer[1]) : null;

  switch (magic) {
    case 0xFFD8:
      return 'jpeg';
    case 0x8950:
      return 'png';
    default:
      return null;
  }
}
