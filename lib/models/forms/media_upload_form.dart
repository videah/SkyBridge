import 'package:json_annotation/json_annotation.dart';

part 'media_upload_form.g.dart';

/// Form data for uploading a new media attachment.
@JsonSerializable()
class MediaUploadForm {
  /// Constructs an instance of [MediaUploadForm].
  MediaUploadForm({
    this.description,
    this.focus,
  });

  /// Converts JSON into a [MediaUploadForm] instance.
  factory MediaUploadForm.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadFormFromJson(json);

  /// Converts the [MediaUploadForm] to JSON.
  Map<String, dynamic> toJson() => _$MediaUploadFormToJson(this);

  /// A plain-text description of the media, for accessibility purposes.
  final String? description;

  /// Two floating points (x,y), comma-delimited, ranging from -1.0 to 1.0.
  final String? focus;
}
