import 'package:sky_bridge/models/mastodon/mastodon_account.dart';
import 'package:sky_bridge/util.dart';

/// Get a placeholder account for a contact account to show in the
/// instance API endpoints.
MastodonAccount getPlaceholderVideahAccount() {
  final url = env.getOrElse(
    'SKYBRIDGE_BASEURL',
    () => throw Exception('SKYBRIDGE_BASEURL not set!'),
  );

  final videahAccount = {
    'id': '3621',
    'username': 'videah.net',
    'acct': 'videah.net',
    'display_name': 'videah θΔ',
    'locked': false,
    'bot': false,
    'group': false,
    'created_at': '2024-01-23T21:31:57.026Z',
    'note':
        'werewolf on the computer. he/it\n<a href=\"https://videah.net\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">https://videah.net</a>\n\ndeveloping <a href=\"https://skybridge.fly.dev\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">skybridge.fly.dev</a>\n\npfp by <span class=\"h-card\"><a href=\"https://videah-macbook.squeaker-squeaker.ts.net/@@kilcat.bsky.social\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@kilcat.bsky.social</a></span>\nbanner by <span class=\"h-card\"><a href=\"https://videah-macbook.squeaker-squeaker.ts.net/@@vetivernakamura.bsky.social\" class=\"u-url mention\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">@vetivernakamura.bsky.social</a></span>',
    'url': 'https://bsky.social/videah.net',
    'avatar': 'https://$url/pfp_fallback.png',
    'avatar_static': 'https://$url/pfp_fallback.png',
    'header': 'https://$url/bnr_fallback.png',
    'header_static': 'https://$url/bnr_fallback.png',
    'followers_count': 0,
    'following_count': 0,
    'statuses_count': 0,
    'last_status_at': '2024-01-25T06:46:15.483774Z',
    'emojis': [],
    'fields': [],
  };

  return MastodonAccount.fromJson(videahAccount);
}