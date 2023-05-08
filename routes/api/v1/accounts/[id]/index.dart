import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/database/user_record.dart';
import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/util.dart';

Future<Response> onRequest<T>(RequestContext context, String id) async {
  // If the id is not a number we return 404
  if (int.tryParse(id) == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final connection = await session;
  final bluesky = bsky.Bluesky.fromSession(connection);

  final idNumber = int.parse(id);
  final user = await db.userRecords.get(idNumber);
  if (user == null) {
    return Response(statusCode: HttpStatus.notFound);
  }

  final profile = await bluesky.actors.findProfile(actor: user.did);

  final account = await db.writeTxn(
    () => MastodonAccount.fromActorProfile(profile.data),
  );

  return Response.json(
    body: account,
  );
}
