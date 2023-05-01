import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/crypto.dart';

/// Check a request context for a valid bearer token to determine if the
/// request is authenticated.
bool isAuthenticated(RequestContext context) {
  final header = context.request.headers['Authorization'];
  return validateBearerToken(header);
}

/// A helper function to return a 401 response for an invalid bearer token.
Response authError() {
  return Response.json(
    statusCode: 401,
    body: {
      'error': 'The access token is invalid',
    },
  );
}

/// Check if [tokenString] is a valid signed bearer token that we can unpack.
bool validateBearerToken(String? tokenString) {
  if (tokenString == null) return false;
  if (tokenString.startsWith('Bearer ')) {
    final token = unpackObject(tokenString.substring(7));
    if (token != null) return true;
  }
  return false;
}