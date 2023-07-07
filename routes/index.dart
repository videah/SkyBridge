import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:path/path.dart' as path;
import 'package:sky_bridge/util.dart';

Future<Response> onRequest(RequestContext context) async {
  final shouldShowIndex = env.getOrElse(
    'SKYBRIDGE_SHOW_INDEX',
    () => 'false',
  );

  if (shouldShowIndex.toLowerCase() == 'false') {
    return Response.json(
      body: {},
    );
  }

  final file = File(path.join(Directory.current.path, 'public', 'guide.html'));
  final indexHtml = await file.readAsString();

  final baseUrl = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  return Response(
    body: indexHtml.format({
      'baseurl': baseUrl,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.html.value,
    },
  );
}
