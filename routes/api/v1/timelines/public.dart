import 'package:dart_frog/dart_frog.dart';

import 'home.dart' as home;

/// This is temporarily just a copy of the home timeline.
/// Clients like Twidere expect this endpoint to exist.
Future<Response> onRequest(RequestContext context) async {
  // TODO(videah): implement this properly.
  return home.onRequest(context);
}
