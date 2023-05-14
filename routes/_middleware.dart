import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Handler middleware(Handler handler) {
  // Temporary middleware that print requests.
  return handler.use(requestLogger()).use(
        fromShelfMiddleware(
          corsHeaders(),
        ),
      );
}
