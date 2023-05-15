// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../main.dart' as entrypoint;
import '../routes/index.dart' as index;
import '../routes/oauth/token.dart' as oauth_token;
import '../routes/oauth/revoke.dart' as oauth_revoke;
import '../routes/oauth/authorize.dart' as oauth_authorize;
import '../routes/api/v2/media.dart' as api_v2_media;
import '../routes/api/v2/instance.dart' as api_v2_instance;
import '../routes/api/v1/instance.dart' as api_v1_instance;
import '../routes/api/v1/apps.dart' as api_v1_apps;
import '../routes/api/v1/trends/statuses.dart' as api_v1_trends_statuses;
import '../routes/api/v1/timelines/home.dart' as api_v1_timelines_home;
import '../routes/api/v1/statuses/index.dart' as api_v1_statuses_index;
import '../routes/api/v1/statuses/[id]/unreblog.dart' as api_v1_statuses_$id_unreblog;
import '../routes/api/v1/statuses/[id]/unfavourite.dart' as api_v1_statuses_$id_unfavourite;
import '../routes/api/v1/statuses/[id]/reblog.dart' as api_v1_statuses_$id_reblog;
import '../routes/api/v1/statuses/[id]/index.dart' as api_v1_statuses_$id_index;
import '../routes/api/v1/statuses/[id]/favourite.dart' as api_v1_statuses_$id_favourite;
import '../routes/api/v1/statuses/[id]/context.dart' as api_v1_statuses_$id_context;
import '../routes/api/v1/notifications/index.dart' as api_v1_notifications_index;
import '../routes/api/v1/media/[id].dart' as api_v1_media_$id;
import '../routes/api/v1/accounts/verify_credentials.dart' as api_v1_accounts_verify_credentials;
import '../routes/api/v1/accounts/search.dart' as api_v1_accounts_search;
import '../routes/api/v1/accounts/relationships.dart' as api_v1_accounts_relationships;
import '../routes/api/v1/accounts/lookup.dart' as api_v1_accounts_lookup;
import '../routes/api/v1/accounts/familiar_followers.dart' as api_v1_accounts_familiar_followers;
import '../routes/api/v1/accounts/[id]/statuses.dart' as api_v1_accounts_$id_statuses;
import '../routes/api/v1/accounts/[id]/index.dart' as api_v1_accounts_$id_index;
import '../routes/api/v1/accounts/[id]/following.dart' as api_v1_accounts_$id_following;
import '../routes/api/v1/accounts/[id]/followers.dart' as api_v1_accounts_$id_followers;

import '../routes/_middleware.dart' as middleware;

void main() async {
  final address = InternetAddress.anyIPv6;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  await entrypoint.init(address, port);
  createServer(address, port);
}

Future<HttpServer> createServer(InternetAddress address, int port) async {
  final handler = Cascade().add(createStaticFileHandler()).add(buildRootHandler()).handler;
  final server = await entrypoint.run(handler, address, port);
  print('\x1B[92m✓\x1B[0m Running on http://${server.address.host}:${server.port}');
  return server;
}

Handler buildRootHandler() {
  final pipeline = const Pipeline().addMiddleware(middleware.middleware);
  final router = Router()
    ..mount('/api/v1/accounts/<id>', (context,id,) => buildApiV1Accounts$idHandler(id,)(context))
    ..mount('/api/v1/accounts', (context) => buildApiV1AccountsHandler()(context))
    ..mount('/api/v1/media', (context) => buildApiV1MediaHandler()(context))
    ..mount('/api/v1/notifications', (context) => buildApiV1NotificationsHandler()(context))
    ..mount('/api/v1/statuses/<id>', (context,id,) => buildApiV1Statuses$idHandler(id,)(context))
    ..mount('/api/v1/statuses', (context) => buildApiV1StatusesHandler()(context))
    ..mount('/api/v1/timelines', (context) => buildApiV1TimelinesHandler()(context))
    ..mount('/api/v1/trends', (context) => buildApiV1TrendsHandler()(context))
    ..mount('/api/v1', (context) => buildApiV1Handler()(context))
    ..mount('/api/v2', (context) => buildApiV2Handler()(context))
    ..mount('/oauth', (context) => buildOauthHandler()(context))
    ..mount('/', (context) => buildHandler()(context));
  return pipeline.addHandler(router);
}

Handler buildApiV1Accounts$idHandler(String id,) {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/statuses', (context) => api_v1_accounts_$id_statuses.onRequest(context,id,))..all('/', (context) => api_v1_accounts_$id_index.onRequest(context,id,))..all('/following', (context) => api_v1_accounts_$id_following.onRequest(context,id,))..all('/followers', (context) => api_v1_accounts_$id_followers.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildApiV1AccountsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/verify_credentials', (context) => api_v1_accounts_verify_credentials.onRequest(context,))..all('/search', (context) => api_v1_accounts_search.onRequest(context,))..all('/relationships', (context) => api_v1_accounts_relationships.onRequest(context,))..all('/lookup', (context) => api_v1_accounts_lookup.onRequest(context,))..all('/familiar_followers', (context) => api_v1_accounts_familiar_followers.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1MediaHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/<id>', (context,id,) => api_v1_media_$id.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildApiV1NotificationsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_v1_notifications_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1Statuses$idHandler(String id,) {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/unreblog', (context) => api_v1_statuses_$id_unreblog.onRequest(context,id,))..all('/unfavourite', (context) => api_v1_statuses_$id_unfavourite.onRequest(context,id,))..all('/reblog', (context) => api_v1_statuses_$id_reblog.onRequest(context,id,))..all('/', (context) => api_v1_statuses_$id_index.onRequest(context,id,))..all('/favourite', (context) => api_v1_statuses_$id_favourite.onRequest(context,id,))..all('/context', (context) => api_v1_statuses_$id_context.onRequest(context,id,));
  return pipeline.addHandler(router);
}

Handler buildApiV1StatusesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => api_v1_statuses_index.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1TimelinesHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/home', (context) => api_v1_timelines_home.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1TrendsHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/statuses', (context) => api_v1_trends_statuses.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV1Handler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/instance', (context) => api_v1_instance.onRequest(context,))..all('/apps', (context) => api_v1_apps.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildApiV2Handler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/media', (context) => api_v2_media.onRequest(context,))..all('/instance', (context) => api_v2_instance.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildOauthHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/token', (context) => oauth_token.onRequest(context,))..all('/revoke', (context) => oauth_revoke.onRequest(context,))..all('/authorize', (context) => oauth_authorize.onRequest(context,));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', (context) => index.onRequest(context,));
  return pipeline.addHandler(router);
}
