import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/models/nodeinfo.dart';
import 'package:sky_bridge/util.dart';

/// Used for advertising software name and version, protocols, usage statistics,
/// and whether registrations are open.
/// GET /nodeinfo/2.0 HTTP/1.1
/// See: https://docs.joinmastodon.org/dev/routes/#nodeinfo
Future<Response> onRequest(RequestContext context) async {
  final info = await NodeInfo.fromDefaults();
  return threadedJsonResponse(body: info);
}
