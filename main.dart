import 'dart:convert';
import 'dart:io';

import 'package:bluesky/bluesky.dart';
import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:isar/isar.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/post_record.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/util.dart';

import '.dart_frog/server.dart';
import 'routes/_middleware.dart';

Future<void> init(InternetAddress ip, int port) async {
  // Downloads the Isar core library at runtime.
  // Not a big fan of this, there has to be a better way of doing this
  await Isar.initializeIsarCore(download: true);

  // Open the ID database, we just use /tmp/ for now which puts non-unix
  // systems out of the picture. This will be fixed in the future.
  db = await Isar.open(
    [PostRecordSchema, UserRecordSchema],
    directory: '/tmp',
  );

  // Load the .env file if it exists.
  // Whoever wrote the dotenv package is using stderr instead of throwing
  // an exception for some reason so we manually check if the file exists.
  final f = File.fromUri(Uri.file('.env'));
  if (f.existsSync()) {
    env = DotEnv(includePlatformEnvironment: true)..load();
  } else {
    print('No .env file found, continuing without one.');
  }

  // Make sure we have an auth password set, used on the login page.
  env.getOrElse(
    'SKYBRIDGE_AUTH_PASSWORD',
    () => throw Exception('SKYBRIDGE_AUTH_PASSWORD not set!'),
  );

  // Make sure we have an app password set.
  final appPassword = env.getOrElse(
    'SKYBRIDGE_APP_PASSWORD',
    () => throw Exception('SKYBRIDGE_APP_PASSWORD not set!'),
  );

  // Check the provided password is an actual app password.
  // This is just a bonus check to make sure the user isn't using their
  // main account password. This only holds if the users password doesn't
  // follow the same format but it's better than nothing.
  isValidAppPassword(appPassword);

  // Make sure we have a secret key set.
  final secret = env.getOrElse(
    'SKYBRIDGE_SECRET',
    () => throw Exception('SKYBRIDGE_SECRET not set!'),
  );

  // Make sure the secret key isn't empty.
  if (secret.isEmpty) throw Exception('SKYBRIDGE_SECRET is empty!');

  // Ok, we're good, load the key.
  bridgeKey = Hmac(sha1, utf8.encode(secret));

  // Try to establish a session with Bluesky.
  // We want to catch issues such as incorrect identifier/passwords early.
  try {
    final connection = await session;
    print('Successfully established a session with Bluesky!');
    print('Logged in as @${connection.handle}');
  } on XRPCException catch (e) {
    final message = e.response.data.message;
    throw Exception('Failed to establish a session with Bluesky: $message');
  }

  // Check if we should wipe the database on startup.
  final shouldWipeDB = env.getOrElse(
    'SKYBRIDGE_WIPE_DB_ON_START',
    () => 'false',
  );

  // Clear the database if we env var is set to true.
  // This will cause issues when apps try to access resources we don't
  // have IDs for anymore, but it's fine whilst we're in development.
  if (shouldWipeDB.toLowerCase() == 'true') {
    print('Wiping ID database...');
    await db.writeTxn(() async {
      await db.clear();
    });
  }
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  // This is a super temporary fix for dart_frog generating routes in the
  // wrong order, preventing non-dynamic routes from being matched if in
  // the same directory as a dynamic directory route.
  //
  // See: https://github.com/VeryGoodOpenSource/dart_frog/issues/631
  //
  // It's likely you will get analysis errors at first if .dart_frog/server.dart
  // hasn't been generated yet.
  Handler buildRootHandler() {
    final pipeline = const Pipeline().addMiddleware(middleware);
    final router = Router()
      ..mount(
        '/api/v1/accounts',
        (RequestContext context) => buildApiV1AccountsHandler()(context),
      )
      ..mount(
        '/api/v1/accounts/<id>',
        (RequestContext context, String id) =>
            buildApiV1Accounts$idHandler(id)(context),
      )
      ..mount(
        '/api/v1/timelines',
        (RequestContext context) => buildApiV1TimelinesHandler()(context),
      )
      ..mount(
        '/api/v1',
        (RequestContext context) => buildApiV1Handler()(context),
      )
      ..mount(
        '/oauth',
        (RequestContext context) => buildOauthHandler()(context),
      )
      ..mount('/', (RequestContext context) => buildHandler()(context));
    return pipeline.addHandler(router.call);
  }

  final handler =
      Cascade().add(createStaticFileHandler()).add(buildRootHandler()).handler;

  return serve(handler, ip, port);
}
