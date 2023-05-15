import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:sky_bridge/auth.dart';

Handler middleware(Handler handler) {
  return (RequestContext context) async {
    try {
      final response = await handler(context);

      // Reset Cache-Control so that we don't cache responses.
      return response.copyWith(
        headers: Map.of(response.headers)
          ..addAll(
            {
              'Cache-Control': 'no-cache, no-store, must-revalidate',
            },
          ),
      );
    } on bsky.InvalidRequestException catch (e) {
      final error = e.response.data.error;

      // This middleware is only for handling expired tokens.
      if (error != 'ExpiredToken') rethrow;

      // If we are at this point we have an expired token.
      // We're going to try to refresh it and then re-run the handler.
      final session = await sessionFromContext(context);
      if (session == null) return authError();
      final bluesky = bsky.Bluesky.fromSession(session);

      print('Expired token for ${session.did}, attempting refresh...');

      // Try refreshing the session with the refresh token.
      try {
        final newSession = await bluesky.servers.refreshSession(
          refreshJwt: session.refreshJwt,
        );

        // Success! Swap out the old session for the new one.
        sessions[session.did] = newSession.data;
        print('Successfully refreshed session for ${session.did}.');
      } catch (e) {
        // If we fail to refresh the session, there's nothing we can do.
        // We'll just remove the session and return an error.
        print('Failed to refresh session for ${session.did}, dropping...');
        sessions.remove(session.did);
        return authError();
      }

      // Try again now that we have a new session.
      final response = await handler(context);

      // Reset Cache-Control so that we don't cache responses.
      return response.copyWith(
        headers: Map.of(response.headers)
          ..addAll(
            {
              'Cache-Control': 'no-cache, no-store, must-revalidate',
            },
          ),
      );
    }
  }.use(requestLogger()).use(
        // Temporary middleware that print requests.
        fromShelfMiddleware(
          corsHeaders(),
        ),
      );
}
