import 'dart:io';

import 'package:bluesky/bluesky.dart' as bsky;
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';

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

      final header = context.request.headers['Authorization'];
      final token = validateBearerToken(header);

      final response = Response.json(
        statusCode: HttpStatus.unauthorized,
        body: {'error': 'The access token is invalid'},
      );

      if (token != null) {
        print('Deleting expired session for did: ${token.did}');
        await db.sessionRecord.delete(
          where: SessionRecordWhereUniqueInput(
            did: token.did,
          ),
        );
      }

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
