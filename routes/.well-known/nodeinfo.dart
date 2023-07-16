import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/models/nodeinfo.dart';
import 'package:sky_bridge/util.dart';

/// Maps to NodeInfo 2.0 endpoint at /nodeinfo/2.0, used for advertising
/// software name and version, protocols, usage statistics,
/// and whether registrations are open.
/// GET /.well-known/nodeinfo HTTP/1.1
/// See: https://docs.joinmastodon.org/dev/routes/#nodeinfo
Future<Response> onRequest(RequestContext context) async {
  final info = await NodeInfo.fromDefaults();
  return threadedJsonResponse(body: info);
}
