import 'package:json_annotation/json_annotation.dart';

part 'relationship_params.g.dart';

/// Parameters for getting relationship between accounts and the current user.
@JsonSerializable()
class RelationshipParams {
  /// Constructs an instance of [RelationshipParams].
  RelationshipParams({required this.ids});

  /// Converts JSON into a [RelationshipParams] instance.
  factory RelationshipParams.fromJson(Map<String, dynamic> json) =>
      _$RelationshipParamsFromJson(json);

  /// Converts the [RelationshipParams] to JSON.
  Map<String, dynamic> toJson() => _$RelationshipParamsToJson(this);

  /// Check relationships for the provided account IDs.
  @JsonKey(name: 'id[]', fromJson: parseQueryArray)
  final List<String> ids;
}

/// Parses a query parameter array, which can be a string if there is only one
/// element, or a list if there are multiple elements. We want to always return
/// a list.
List<String> parseQueryArray(Object array) {
  if (array is String) {
    return [array];
  } else if (array is List) {
    return array.cast<String>();
  } else {
    throw ArgumentError.value(array, 'array', 'Must be a string or list.');
  }
}
