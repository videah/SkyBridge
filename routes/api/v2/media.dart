import 'dart:io';
import 'dart:typed_data';

import 'package:dart_frog/dart_frog.dart';
import 'package:image_compression/image_compression.dart';
import 'package:sky_bridge/auth.dart';
import 'package:sky_bridge/database.dart';
import 'package:sky_bridge/models/forms/media_upload_form.dart';
import 'package:sky_bridge/models/mastodon/mastodon_media_attachment.dart';
import 'package:sky_bridge/util.dart';

/// Creates a media attachment to be used with a new status. The full sized
/// media will be processed asynchronously in the background for large uploads.
/// POST /api/v2/media HTTP/1.1
/// See: https://docs.joinmastodon.org/methods/media/#v2
Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    // Get a bluesky connection/session from the a provided bearer token.
    // If the token is invalid, bail out and return an error.
    final bluesky = await blueskyFromContext(context);
    if (bluesky == null) return authError();

    final formData = await context.request.formData();
    final formDataEncoded = MediaUploadForm.fromJson(formData.fields);

    // Check we actually have a file uploaded.
    final imageFile = formData.files['file'];
    if (imageFile == null) {
      print('No file found in form data.');
      return _invalidImage();
    }

    // Get the file bytes and check what file extension we should use.
    // Currently the ATProto library we're using relies on the file extension
    // rather than a magic number to determine the file type, so we need to
    // do this ahead of time.
    var imageFileBytes = Uint8List.fromList(await imageFile.readAsBytes());
    final extension = imageBytesToExtension(imageFileBytes);

    // If we can't determine the extension from the image header bail out.
    if (extension == null) {
      print('Could not determine extension from image header.');
      // Print the first 12 bytes of the image for debugging later.
      print(imageFileBytes.sublist(0, 12));
      return _invalidImage();
    }

    // Get the file size in bytes.
    final fileSize = imageFileBytes.length;

    // Check the file size is within the limits.
    // If not, compress the image.
    if (fileSize > 976560) {
      print('File size is too large, compressing.');

      final file = ImageFile(
        rawBytes: imageFileBytes,
        filePath: '/tmp/${imageFile.name}',
        contentType: extension,
      );

      // Compress until the file size is within the limits, 5 attempts.
      for (var i = 0; i < 5; i++) {
        print('Compressing attempt ${i + 1} of 5. Quality: ${80 - (i * 5)}');
        final config = ImageFileConfiguration(
          input: file,
          config: Configuration(
            jpgQuality: 80 - (i * 5),
          ),
        );

        final compressedImage = await compressInQueue(config);
        if (compressedImage.sizeInBytes < 976560) {
          // We've compressed the image enough, break out of the loop.
          imageFileBytes = compressedImage.rawBytes;
          break;
        } else {
          // If the image is still too big after 5 attempts, bail out.
          if (i == 4) {
            print('Could not compress image to within size limits.');
            return _invalidImage();
          }
        }
      }
    }

    // Upload the image file to bluesky.
    final response = await bluesky.repositories.uploadBlob(imageFileBytes);
    final blob = response.data.blob;

    // We need to store the blob info in the database so it can be retrieved
    // later when the media is attached to a post.
    final description = formDataEncoded.description ?? '';
    final record = await databaseTransaction(
      () async => BlobExtension.fromBlob(blob, description),
    );

    // The API is meant to return a URL at this point but we can't actually
    // get one until a blob is attached to a post. So we return nothing.
    // This might cause issues in the future but should be fine for now.
    return threadedJsonResponse(
      body: MastodonMediaAttachment(
        id: record.id.toString(),
        type: MediaType.image,
        previewUrl: '',
        url: '',
        description: formDataEncoded.description ?? '',
        blurhash: '',
      ),
    );
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Response _invalidImage() {
  const e = 'Validation failed: File content type is invalid, File is invalid';
  return Response.json(
    statusCode: HttpStatus.unprocessableEntity,
    body: {
      'error': e,
    },
  );
}
