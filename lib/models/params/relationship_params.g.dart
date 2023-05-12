// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipParams _$RelationshipParamsFromJson(Map<String, dynamic> json) =>
    RelationshipParams(
      ids: (json['id[]'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RelationshipParamsToJson(RelationshipParams instance) =>
    <String, dynamic>{
      'id[]': instance.ids,
    };
