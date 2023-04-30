import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  // Temporary middleware that print requests.
  return handler.use(requestLogger());
}