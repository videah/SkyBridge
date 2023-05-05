// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repost_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRepostRecordCollection on Isar {
  IsarCollection<RepostRecord> get repostRecords => this.collection();
}

const RepostRecordSchema = CollectionSchema(
  name: r'RepostRecord',
  id: 6269814497834915674,
  properties: {
    r'hashId': PropertySchema(
      id: 0,
      name: r'hashId',
      type: IsarType.string,
    )
  },
  estimateSize: _repostRecordEstimateSize,
  serialize: _repostRecordSerialize,
  deserialize: _repostRecordDeserialize,
  deserializeProp: _repostRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'hashId': IndexSchema(
      id: -7070364231115312276,
      name: r'hashId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hashId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'originalPost': LinkSchema(
      id: -8008701106267343945,
      name: r'originalPost',
      target: r'PostRecord',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _repostRecordGetId,
  getLinks: _repostRecordGetLinks,
  attach: _repostRecordAttach,
  version: '3.1.0+1',
);

int _repostRecordEstimateSize(
  RepostRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hashId.length * 3;
  return bytesCount;
}

void _repostRecordSerialize(
  RepostRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hashId);
}

RepostRecord _repostRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RepostRecord(
    hashId: reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _repostRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _repostRecordGetId(RepostRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _repostRecordGetLinks(RepostRecord object) {
  return [object.originalPost];
}

void _repostRecordAttach(
    IsarCollection<dynamic> col, Id id, RepostRecord object) {
  object.id = id;
  object.originalPost
      .attach(col, col.isar.collection<PostRecord>(), r'originalPost', id);
}

extension RepostRecordByIndex on IsarCollection<RepostRecord> {
  Future<RepostRecord?> getByHashId(String hashId) {
    return getByIndex(r'hashId', [hashId]);
  }

  RepostRecord? getByHashIdSync(String hashId) {
    return getByIndexSync(r'hashId', [hashId]);
  }

  Future<bool> deleteByHashId(String hashId) {
    return deleteByIndex(r'hashId', [hashId]);
  }

  bool deleteByHashIdSync(String hashId) {
    return deleteByIndexSync(r'hashId', [hashId]);
  }

  Future<List<RepostRecord?>> getAllByHashId(List<String> hashIdValues) {
    final values = hashIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'hashId', values);
  }

  List<RepostRecord?> getAllByHashIdSync(List<String> hashIdValues) {
    final values = hashIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'hashId', values);
  }

  Future<int> deleteAllByHashId(List<String> hashIdValues) {
    final values = hashIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'hashId', values);
  }

  int deleteAllByHashIdSync(List<String> hashIdValues) {
    final values = hashIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'hashId', values);
  }

  Future<Id> putByHashId(RepostRecord object) {
    return putByIndex(r'hashId', object);
  }

  Id putByHashIdSync(RepostRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'hashId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByHashId(List<RepostRecord> objects) {
    return putAllByIndex(r'hashId', objects);
  }

  List<Id> putAllByHashIdSync(List<RepostRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'hashId', objects, saveLinks: saveLinks);
  }
}

extension RepostRecordQueryWhereSort
    on QueryBuilder<RepostRecord, RepostRecord, QWhere> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RepostRecordQueryWhere
    on QueryBuilder<RepostRecord, RepostRecord, QWhereClause> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> hashIdEqualTo(
      String hashId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashId',
        value: [hashId],
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterWhereClause> hashIdNotEqualTo(
      String hashId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashId',
              lower: [],
              upper: [hashId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashId',
              lower: [hashId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashId',
              lower: [hashId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashId',
              lower: [],
              upper: [hashId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension RepostRecordQueryFilter
    on QueryBuilder<RepostRecord, RepostRecord, QFilterCondition> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> hashIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> hashIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> hashIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashId',
        value: '',
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      hashIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashId',
        value: '',
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> idBetween(
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
}

extension RepostRecordQueryObject
    on QueryBuilder<RepostRecord, RepostRecord, QFilterCondition> {}

extension RepostRecordQueryLinks
    on QueryBuilder<RepostRecord, RepostRecord, QFilterCondition> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition> originalPost(
      FilterQuery<PostRecord> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'originalPost');
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterFilterCondition>
      originalPostIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'originalPost', 0, true, 0, true);
    });
  }
}

extension RepostRecordQuerySortBy
    on QueryBuilder<RepostRecord, RepostRecord, QSortBy> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> sortByHashId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashId', Sort.asc);
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> sortByHashIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashId', Sort.desc);
    });
  }
}

extension RepostRecordQuerySortThenBy
    on QueryBuilder<RepostRecord, RepostRecord, QSortThenBy> {
  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> thenByHashId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashId', Sort.asc);
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> thenByHashIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashId', Sort.desc);
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RepostRecord, RepostRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension RepostRecordQueryWhereDistinct
    on QueryBuilder<RepostRecord, RepostRecord, QDistinct> {
  QueryBuilder<RepostRecord, RepostRecord, QDistinct> distinctByHashId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashId', caseSensitive: caseSensitive);
    });
  }
}

extension RepostRecordQueryProperty
    on QueryBuilder<RepostRecord, RepostRecord, QQueryProperty> {
  QueryBuilder<RepostRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RepostRecord, String, QQueryOperations> hashIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashId');
    });
  }
}
