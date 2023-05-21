import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/models/mastodon/mastodon_instance.dart';
import 'package:sky_bridge/models/mastodon/mastodon_instance_v1.dart';
import 'package:sky_bridge/util.dart';

/// Obtain general information about the server.
/// GET /api/v1/instance HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/instance/#v1
Future<Response> onRequest(RequestContext context) {
  final url = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  return threadedJsonResponse(
    body: MastodonInstanceV1(
      uri: url,
      title: 'SkyBridge',
      shortDescription: 'A Mastodon bridge for Bluesky.',
      description: 'A Mastodon bridge for Bluesky.',
      email: 'videah@selfish.systems',
      version: '4.1.2',
      urls: {},
      stats: StatInfo(
        userCount: sessions.length,
        statusCount: 99999,
        domainCount: 1,
      ),
      languages: ['en'],
      registrations: false,
      approvalRequired: true,
      invitesEnabled: false,
      configuration: InstanceConfiguration(
        urls: {},
        accounts: AccountConfiguration(
          maxFeaturedTags: 0,
        ),
        statuses: StatusConfiguration(
          maxCharacters: 300,
          maxMediaAttachments: 4,
          charactersReservedPerUrl: 23,
        ),
        mediaAttachments: MediaConfiguration(
          supportedMimeTypes: [
            'image/jpeg',
            'image/png',
          ],
          imageSizeLimit: 3621,
          imageMatrixLimit: 3621,
          videoSizeLimit: 0,
          videoFrameRateLimit: 0,
          videoMatrixLimit: 0,
        ),
        polls: PollConfiguration(
          maxOptions: 0,
          maxCharactersPerOption: 20,
          minExpiration: 1,
          maxExpiration: 10000,
        ),
        translation: TranslationConfiguration(
          enabled: false,
        ),
      ),
      rules: [
        Rule(id: '1', text: 'Report all issues to the SkyBridge repo!'),
      ],
    ),
  );
}
