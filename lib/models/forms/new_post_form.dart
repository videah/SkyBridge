import 'package:bluesky_text/bluesky_text.dart';
import 'package:json_annotation/json_annotation.dart';

part 'new_post_form.g.dart';

/// Form data for creating a new post.
@JsonSerializable()
class NewPostForm {
  /// Constructs an instance of [NewPostForm].
  NewPostForm({
    required this.status,
    required this.mediaIds,
    required this.inReplyToId,
  });

  /// Converts JSON into a [NewPostForm] instance.
  factory NewPostForm.fromJson(Map<String, dynamic> json) =>
      _$NewPostFormFromJson(json);

  /// Converts the [NewPostForm] to JSON.
  Map<String, dynamic> toJson() => _$NewPostFormToJson(this);

  /// The text content of the post.
  /// If [mediaIds] is provided, this becomes optional.
  @JsonKey(toJson: blueskyToString, fromJson: stringToBluesky)
  final BlueskyText? status;

  /// Include Attachment IDs to be attached as media.
  /// If provided, [status] becomes optional.
  @JsonKey(name: 'media_ids')
  final List<String>? mediaIds;

  /// The ID of the post being replied to.
  @JsonKey(name: 'in_reply_to_id', fromJson: handleReplyId)
  final int? inReplyToId;
}

BlueskyText stringToBluesky(String? value) =>
    BlueskyText(value ?? '', enableMarkdown: false);
String blueskyToString(BlueskyText? text) => text?.value ?? '';

/// Ivory still has code lingering from Tweetbot that handles post IDs as [int]
/// when they really should be [String]. This function is used to guarantee
/// an int result for the [NewPostForm.inReplyToId] field.
int? handleReplyId(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}
