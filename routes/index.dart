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
      statusCode: HttpStatus.notFound,
      body: {},
    );
  }

  final file = File(path.join(Directory.current.path, 'public', 'guide.html'));
  final indexHtml = await file.readAsString();

  return Response(
    body: indexHtml,
    headers: {
      HttpHeaders.contentTypeHeader: ContentType.html.value,
    },
  );
}
