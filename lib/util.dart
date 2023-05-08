import 'package:bluesky/bluesky.dart' as bsky;
import 'package:bluesky_text/bluesky_text.dart';
import 'package:dotenv/dotenv.dart';
import 'package:template_expressions/template_expressions.dart';

/// Environment variables loaded from a .env file.
late DotEnv env;

/// Returns a [DateTime] from a Unix epoch in seconds.
DateTime dateTimeFromEpoch(int epoch) {
  return DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
}

/// Returns a Unix epoch in seconds from a [DateTime].
int dateTimeToEpoch(DateTime date) {
  return (date.millisecondsSinceEpoch / 1000).floor();
}

/// Returns a [DateTime] from an ISO 8601 string.
DateTime dateTimeFromISO8601(String date) {
  return DateTime.parse(date);
}

/// Returns an ISO 8601 string from a [DateTime].
String? dateTimeToISO8601(DateTime? date) {
  return date?.toIso8601String();
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

/// Returns a [bsky.Session] from the provided credentials.
Future<bsky.Session> get session async {
  final session = await bsky.createSession(
    identifier: env.getOrElse(
      'SKYBRIDGE_IDENTIFIER',
      () => throw Exception('SKYBRIDGE_IDENTIFIER not set!'),
    ),
    password: env.getOrElse(
      'SKYBRIDGE_APP_PASSWORD',
      () => throw Exception('SKYBRIDGE_APP_PASSWORD not set!'),
    ),
  );

  return session.data;
}

/// Get the DID's for mentioned handles in a post.
Future<Map<String, String>> findDIDsForPost(
    bsky.Bluesky bluesky,
    List<Entity> entities,
    ) async {
  final dids = <String, String>{};
  for (final entity in entities) {
    if (entity.type == EntityType.handle) {
      // Remove `@`
      final did = await bluesky.identities.findDID(
        handle: entity.value.substring(1),
      );
      dids[entity.value] = did.data.did;
    }
  }

  return dids;
}