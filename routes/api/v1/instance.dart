import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  // Return fake instance information.
  // Needs to be made more robust at some point.
  return Response.json(
    body: {
      'uri': 'test.net',
      'title': 'Sky Bridge',
      'short_description': 'A bridge to the sky',
      'description': 'A bridge to the sky',
      'email': 'example@example.com',
      'version': '0.0.1',
      'urls': {
        'streaming_api': '',
      },
      'stats': {
        'user_count': 1,
        'status_count': 99999,
        'domain_count': 1,
      },
      'languages': ['en'],
      'registrations': false,
      'approval_required': true,
      'invitations_enabled': false,
      'configuration': {
        'accounts': {
          'max_featured_tags': 0,
        },
        'statuses': {
          'max_characters': 280,
          'max_media_attachments': 4,
          'characters_reserved_per_url': 23 // FIXME
        },
        'polls': {
          'max_options': 0,
          'max_characters_per_option': 20,
          'min_expiration': 1,
          'max_expiration': 10000,
        }
      },
      'rules': <dynamic>[],
    },
  );
}
