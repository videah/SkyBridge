// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNotificationRecordCollection on Isar {
  IsarCollection<NotificationRecord> get notificationRecords =>
      this.collection();
}

const NotificationRecordSchema = CollectionSchema(
  name: r'NotificationRecord',
  id: -8063810141512427725,
  properties: {
    r'cid': PropertySchema(
      id: 0,
      name: r'cid',
      type: IsarType.string,
    ),
    r'uri': PropertySchema(
      id: 1,
      name: r'uri',
      type: IsarType.string,
    )
  },
  estimateSize: _notificationRecordEstimateSize,
  serialize: _notificationRecordSerialize,
  deserialize: _notificationRecordDeserialize,
  deserializeProp: _notificationRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'cid': IndexSchema(
      id: 2203098626925536187,
      name: r'cid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _notificationRecordGetId,
  getLinks: _notificationRecordGetLinks,
  attach: _notificationRecordAttach,
  version: '3.1.0+1',
);

int _notificationRecordEstimateSize(
  NotificationRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cid.length * 3;
  bytesCount += 3 + object.uri.length * 3;
  return bytesCount;
}

void _notificationRecordSerialize(
  NotificationRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cid);
  writer.writeString(offsets[1], object.uri);
}

NotificationRecord _notificationRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NotificationRecord(
    cid: reader.readString(offsets[0]),
    uri: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _notificationRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _notificationRecordGetId(NotificationRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _notificationRecordGetLinks(
    NotificationRecord object) {
  return [];
}

void _notificationRecordAttach(
    IsarCollection<dynamic> col, Id id, NotificationRecord object) {
  object.id = id;
}

extension NotificationRecordQueryWhereSort
    on QueryBuilder<NotificationRecord, NotificationRecord, QWhere> {
  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NotificationRecordQueryWhere
    on QueryBuilder<NotificationRecord, NotificationRecord, QWhereClause> {
  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      cidEqualTo(String cid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cid',
        value: [cid],
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterWhereClause>
      cidNotEqualTo(String cid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cid',
              lower: [],
              upper: [cid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cid',
              lower: [cid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cid',
              lower: [cid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cid',
              lower: [],
              upper: [cid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension NotificationRecordQueryFilter
    on QueryBuilder<NotificationRecord, NotificationRecord, QFilterCondition> {
  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cid',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      cidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cid',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uri',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: '',
      ));
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterFilterCondition>
      uriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uri',
        value: '',
      ));
    });
  }
}

extension NotificationRecordQueryObject
    on QueryBuilder<NotificationRecord, NotificationRecord, QFilterCondition> {}

extension NotificationRecordQueryLinks
    on QueryBuilder<NotificationRecord, NotificationRecord, QFilterCondition> {}

extension NotificationRecordQuerySortBy
    on QueryBuilder<NotificationRecord, NotificationRecord, QSortBy> {
  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      sortByCid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cid', Sort.asc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      sortByCidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cid', Sort.desc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      sortByUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.asc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      sortByUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.desc);
    });
  }
}

extension NotificationRecordQuerySortThenBy
    on QueryBuilder<NotificationRecord, NotificationRecord, QSortThenBy> {
  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenByCid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cid', Sort.asc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenByCidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cid', Sort.desc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenByUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.asc);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QAfterSortBy>
      thenByUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.desc);
    });
  }
}

extension NotificationRecordQueryWhereDistinct
    on QueryBuilder<NotificationRecord, NotificationRecord, QDistinct> {
  QueryBuilder<NotificationRecord, NotificationRecord, QDistinct> distinctByCid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NotificationRecord, NotificationRecord, QDistinct> distinctByUri(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uri', caseSensitive: caseSensitive);
    });
  }
}

extension NotificationRecordQueryProperty
    on QueryBuilder<NotificationRecord, NotificationRecord, QQueryProperty> {
  QueryBuilder<NotificationRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NotificationRecord, String, QQueryOperations> cidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cid');
    });
  }

  QueryBuilder<NotificationRecord, String, QQueryOperations> uriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uri');
    });
  }
}
