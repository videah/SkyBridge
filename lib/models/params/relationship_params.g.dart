// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipParams _$RelationshipParamsFromJson(Map<String, dynamic> json) =>
    RelationshipParams(
      ids: parseQueryArray(json['id[]'] as Object),
    );

Map<String, dynamic> _$RelationshipParamsToJson(RelationshipParams instance) =>
    <String, dynamic>{
      'id[]': instance.ids,
    };
