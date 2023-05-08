// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserRecordCollection on Isar {
  IsarCollection<UserRecord> get userRecords => this.collection();
}

const UserRecordSchema = CollectionSchema(
  name: r'UserRecord',
  id: -8169517561997486027,
  properties: {
    r'did': PropertySchema(
      id: 0,
      name: r'did',
      type: IsarType.string,
    ),
    r'profileInfo': PropertySchema(
      id: 1,
      name: r'profileInfo',
      type: IsarType.object,
      target: r'ProfileInfo',
    )
  },
  estimateSize: _userRecordEstimateSize,
  serialize: _userRecordSerialize,
  deserialize: _userRecordDeserialize,
  deserializeProp: _userRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'ProfileInfo': ProfileInfoSchema},
  getId: _userRecordGetId,
  getLinks: _userRecordGetLinks,
  attach: _userRecordAttach,
  version: '3.1.0+1',
);

int _userRecordEstimateSize(
  UserRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.did.length * 3;
  bytesCount += 3 +
      ProfileInfoSchema.estimateSize(
          object.profileInfo, allOffsets[ProfileInfo]!, allOffsets);
  return bytesCount;
}

void _userRecordSerialize(
  UserRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.did);
  writer.writeObject<ProfileInfo>(
    offsets[1],
    allOffsets,
    ProfileInfoSchema.serialize,
    object.profileInfo,
  );
}

UserRecord _userRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserRecord(
    did: reader.readString(offsets[0]),
    profileInfo: reader.readObjectOrNull<ProfileInfo>(
          offsets[1],
          ProfileInfoSchema.deserialize,
          allOffsets,
        ) ??
        ProfileInfo(),
  );
  object.id = id;
  return object;
}

P _userRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<ProfileInfo>(
            offset,
            ProfileInfoSchema.deserialize,
            allOffsets,
          ) ??
          ProfileInfo()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userRecordGetId(UserRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userRecordGetLinks(UserRecord object) {
  return [];
}

void _userRecordAttach(IsarCollection<dynamic> col, Id id, UserRecord object) {
  object.id = id;
}

extension UserRecordQueryWhereSort
    on QueryBuilder<UserRecord, UserRecord, QWhere> {
  QueryBuilder<UserRecord, UserRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserRecordQueryWhere
    on QueryBuilder<UserRecord, UserRecord, QWhereClause> {
  QueryBuilder<UserRecord, UserRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserRecord, UserRecord, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterWhereClause> idBetween(
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
}

extension UserRecordQueryFilter
    on QueryBuilder<UserRecord, UserRecord, QFilterCondition> {
  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'did',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'did',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'did',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'did',
        value: '',
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> didIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'did',
        value: '',
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> idBetween(
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

extension UserRecordQueryObject
    on QueryBuilder<UserRecord, UserRecord, QFilterCondition> {
  QueryBuilder<UserRecord, UserRecord, QAfterFilterCondition> profileInfo(
      FilterQuery<ProfileInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'profileInfo');
    });
  }
}

extension UserRecordQueryLinks
    on QueryBuilder<UserRecord, UserRecord, QFilterCondition> {}

extension UserRecordQuerySortBy
    on QueryBuilder<UserRecord, UserRecord, QSortBy> {
  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> sortByDid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'did', Sort.asc);
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> sortByDidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'did', Sort.desc);
    });
  }
}

extension UserRecordQuerySortThenBy
    on QueryBuilder<UserRecord, UserRecord, QSortThenBy> {
  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> thenByDid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'did', Sort.asc);
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> thenByDidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'did', Sort.desc);
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserRecord, UserRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension UserRecordQueryWhereDistinct
    on QueryBuilder<UserRecord, UserRecord, QDistinct> {
  QueryBuilder<UserRecord, UserRecord, QDistinct> distinctByDid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'did', caseSensitive: caseSensitive);
    });
  }
}

extension UserRecordQueryProperty
    on QueryBuilder<UserRecord, UserRecord, QQueryProperty> {
  QueryBuilder<UserRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserRecord, String, QQueryOperations> didProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'did');
    });
  }

  QueryBuilder<UserRecord, ProfileInfo, QQueryOperations>
      profileInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileInfo');
    });
  }
}
