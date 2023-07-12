import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:orm/logger.dart';
import 'package:shelf_rate_limiter/shelf_rate_limiter.dart';
import 'package:sky_bridge/crypto.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';

import 'routes/_middleware.dart';
import 'server/server.dart';

Future<void> init(InternetAddress ip, int port) async {
  // Make directory for the database if it doesn't exist.
  final dir = Directory.fromUri(Uri.directory('database'));
  if (!dir.existsSync()) {
    dir.createSync();
  }

  // Load the .env file if it exists.
  // Whoever wrote the dotenv package is using stderr instead of throwing
  // an exception for some reason so we manually check if the file exists.
  final f = File.fromUri(Uri.file('.env'));
  if (f.existsSync()) {
    env.load();
  } else {
    print('No .env file found, continuing without one.');
  }

  // Make sure we have a base URL set.
  env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  // Check if we are enforcing a bridge password.
  final needBridgePass = env.getOrElse(
    'SKYBRIDGE_REQUIRE_AUTH_PASSWORD',
    () => 'true',
  );

  final requireBridgePassword = !(needBridgePass.toLowerCase() == 'false');
  if (requireBridgePassword) {
    // Make sure we have an auth password set, used on the login page.
    print('Enforcing bridge password.');
    env.getOrElse(
      'SKYBRIDGE_AUTH_PASSWORD',
      () => throw Exception('SKYBRIDGE_AUTH_PASSWORD not set!'),
    );
  }

  // Make sure we have a secret key set.
  final secret = env.getOrElse(
    'SKYBRIDGE_SECRET',
    () => throw Exception('SKYBRIDGE_SECRET not set!'),
  );

  // Make sure the secret key isn't empty.
  if (secret.isEmpty) throw Exception('SKYBRIDGE_SECRET is empty!');

  // Ok, we're good, load the key.
  bridgeKey = Hmac(sha1, utf8.encode(secret));

  // Get the database URL from the environment.
  final databaseUrl = env.getOrElse(
    'DATABASE_URL',
    () => 'file:./database/skybridge.db',
  );

  // Open our database connections.
  db = PrismaClient(
    event: [Event.query],
    datasources: Datasources(
      db: '$databaseUrl?connection_limit=1',
    ),
  );

  // Enable WAL mode for SQLite.
  await db.$queryRaw('PRAGMA journal_mode=WAL;');

  // Check if we should wipe the database on startup.
  final shouldWipeDB = env.getOrElse(
    'SKYBRIDGE_WIPE_DB_ON_START',
    () => 'false',
  );

  // Clear the database if tge env var is set to true.
  // This will cause issues when apps try to access resources we don't
  // have IDs for anymore, but it's fine whilst we're in development.
  if (shouldWipeDB.toLowerCase() == 'true') {
    print('Wiping ID database...');
    await databaseTransaction(() async {
      const tables = [
        'UserRecord',
        'PostRecord',
        'RepostRecord',
        'NotificationRecord',
        'MediaRecord',
        'FeedRecord',
        'SessionRecord',
      ];

      await db.$queryRaw('PRAGMA foreign_keys=OFF;');
      for (final table in tables) {
        await db.$queryRaw('DELETE FROM $table;');
      }
      await db.$queryRaw('PRAGMA foreign_keys=ON;');
    });
  }

  // Print some statistics, mostly to confirm we have a working connection.
  print('Attempting to connect to database...');
  await db.$connect();

  final userCount = await db.userRecord.aggregate().$count().id();
  final postCount = await db.postRecord.aggregate().$count().id();

  print('Indexed $userCount users and $postCount posts.');
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // This is a super temporary fix for dart_frog generating routes in the
  // wrong order, preventing non-dynamic routes from being matched if in
  // the same directory as a dynamic directory route.
  //
  // See: https://github.com/VeryGoodOpenSource/dart_frog/issues/631
  //
  // It's likely you will get analysis errors at first if .dart_frog/server.dart
  // hasn't been generated yet.
  Handler buildRootHandler() {
    final memoryStorage = MemStorage();
    final rateLimiter = ShelfRateLimiter(
      storage: memoryStorage,
      duration: const Duration(minutes: 5),
      maxRequests: 300,
    );

    final pipeline = const Pipeline().addMiddleware(middleware).addMiddleware(
          fromShelfMiddleware(rateLimiter.rateLimiter()),
        );

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
        '/api/v1/media',
        (RequestContext context) => buildApiV1MediaHandler()(context),
      )
      ..mount(
        '/api/v1/lists',
        (RequestContext context) => buildApiV1ListsHandler()(context),
      )
      ..mount(
        '/api/v1/lists/<id>',
        (RequestContext context, String id) =>
            buildApiV1Lists$idHandler(id)(context),
      )
      ..mount(
        '/api/v1/notifications',
        (RequestContext context) => buildApiV1NotificationsHandler()(context),
      )
      ..mount(
        '/api/v1/statuses',
        (RequestContext context) => buildApiV1StatusesHandler()(context),
      )
      ..mount(
        '/api/v1/statuses/<id>',
        (RequestContext context, String id) =>
            buildApiV1Statuses$idHandler(id)(context),
      )
      ..mount(
        '/api/v1/timelines',
        (RequestContext context) => buildApiV1TimelinesHandler()(context),
      )
      ..mount(
        '/api/v1/timelines/list',
        (RequestContext context) => buildApiV1TimelinesListHandler()(context),
      )
      ..mount(
        '/api/v1/trends',
        (RequestContext context) => buildApiV1TrendsHandler()(context),
      )
      ..mount(
        '/api/v1',
        (RequestContext context) => buildApiV1Handler()(context),
      )
      ..mount(
        '/api/v2',
        (RequestContext context) => buildApiV2Handler()(context),
      )
      ..mount(
        '/oauth',
        (RequestContext context) => buildOauthHandler()(context),
      )
      ..mount(
        '/<userId>',
        (RequestContext context, String userId) => build$userIdHandler(userId)(
          context,
        ),
      )
      ..mount('/', (RequestContext context) => buildHandler()(context));
    return pipeline.addHandler(router.call);
  }

  final handler =
      Cascade().add(createStaticFileHandler()).add(buildRootHandler()).handler;

  final server = await serve(handler, ip, port);

  // Attach Cache-Control header to all responses so we cache static files.
  // We remove this in the middleware for API requests.
  server.defaultResponseHeaders.add(
    'Cache-Control',
    'public, max-age=15552000',
  );

  return server;
}
