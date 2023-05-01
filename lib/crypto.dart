import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:crypto/crypto.dart';
import 'package:sky_bridge/util.dart';

/// A key used to sign objects related to the authentication flow.
late Hmac bridgeKey;

String makeClientSecret(String clientId) {
  // Get secret from environment variable.
  final secret = env.getOrElse(
    'SKYBRIDGE_SECRET',
    () => throw Exception('SKYBRIDGE_SECRET not set!'),
  );

  final data = utf8.encode(secret + clientId);
  return sha1.convert(data).toString();
}

/// Generate a specified number of random bytes
List<int> randomBytes(int length) {
  final random = Random.secure();
  final bytes = List<int>.generate(length, (_) => random.nextInt(256));
  return bytes;
}

/// Packs a JSON object into a string and signs it with [bridgeKey].
String packObject(Map<String, dynamic> object) {
  final json = jsonEncode(object);
  final bytes = Uint8List.fromList(utf8.encode(json)).buffer;
  final signature = bridgeKey.convert(bytes.asUint8List()).bytes;
  final signatureString = base64.encode(signature);
  return '${btoa(json)}|$signatureString';
}

/// Unpacks a JSON object from a string and verifies the signature.
Map<String, dynamic>? unpackObject(String str) {
  try {
    final bits = str.split('|');
    if (bits.length == 2) {
      final json = utf8.decode(base64.decode(bits[0]));
      final bytes = Uint8List.fromList(utf8.encode(json)).buffer;
      final signature = base64.decode(bits[1]);
      final isValid = verifyHmac(bridgeKey, signature, bytes);
      if (isValid) {
        return jsonDecode(json) as Map<String, dynamic>;
      }
    }
  } catch (ex) {
    print('Failed to unpack signed object $ex');
  }

  return null;
}

/// Verifies that [signature] is valid for [data] using [hmac].
bool verifyHmac(Hmac hmac, Uint8List signature, ByteBuffer data) {
  final hmacSignature = hmac.convert(data.asUint8List()).bytes;
  final eq = const ListEquality<int>().equals;
  return eq(hmacSignature, signature);
}

/// Converts a string to base64.
String btoa(String str) {
  return base64.encode(utf8.encode(str));
}

/// Converts a base64 string to a normal string.
String atob(String str) {
  return utf8.decode(base64.decode(str));
}
