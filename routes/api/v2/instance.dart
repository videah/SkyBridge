import 'package:dart_frog/dart_frog.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/mastodon/mastodon_instance.dart';
import 'package:sky_bridge/src/generated/prisma/prisma_client.dart';
import 'package:sky_bridge/util.dart';
import 'package:sky_bridge/videah_account.dart';

/// Obtain general information about the server.
/// GET /api/v2/instance HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/instance/#v2
Future<Response> onRequest(RequestContext context) async {
  final url = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  final userCount = await db.sessionRecord.aggregate().$count().id();

  return threadedJsonResponse(
    body: MastodonInstance(
      domain: url,
      title: 'SkyBridgey',
      version: '4.1.2',
      sourceUrl: 'https://github.com/videah/SkyBridge',
      description: 'A Mastodon bridge for Bluesky.',
      usage: UsageInfo(
        users: UsersUsageInfo(
          activeMonth: userCount,
        ),
      ),
      thumbnail: InstanceThumbnail(
        url: 'https://$url/og.png',
        blurhash: 'LHBG1I=p5uMgS.X6VF%ZD.xT-MTJ',
        versions: ThumbnailVersions(
          oneTimes: 'https://$url/og.png',
          twoTimes: 'https://$url/og.png',
        ),
      ),
      languages: ['en'],
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
          imageSizeLimit: 976560,
          imageMatrixLimit: 5000 * 5000,
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
      registrations: RegistrationConfiguration(
        enabled: false,
        approvalRequired: true,
        message: 'Register on the main Bluesky website.',
      ),
      contact: ContactInfo(
        email: 'videah@selfish.systems',
        account: getPlaceholderVideahAccount(),
      ),
      rules: [
        Rule(id: '1', text: 'Report all issues to the SkyBridge repo!'),
      ],
    ),
  );
}
