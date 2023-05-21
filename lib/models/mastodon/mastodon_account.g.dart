// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_account.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ProfileInfoSchema = Schema(
  name: r'ProfileInfo',
  id: 5701495882167099439,
  properties: {
    r'banner': PropertySchema(
      id: 0,
      name: r'banner',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'followersCount': PropertySchema(
      id: 2,
      name: r'followersCount',
      type: IsarType.long,
    ),
    r'followsCount': PropertySchema(
      id: 3,
      name: r'followsCount',
      type: IsarType.long,
    ),
    r'postsCount': PropertySchema(
      id: 4,
      name: r'postsCount',
      type: IsarType.long,
    )
  },
  estimateSize: _profileInfoEstimateSize,
  serialize: _profileInfoSerialize,
  deserialize: _profileInfoDeserialize,
  deserializeProp: _profileInfoDeserializeProp,
);

int _profileInfoEstimateSize(
  ProfileInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.banner;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _profileInfoSerialize(
  ProfileInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.banner);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.followersCount);
  writer.writeLong(offsets[3], object.followsCount);
  writer.writeLong(offsets[4], object.postsCount);
}

ProfileInfo _profileInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProfileInfo(
    banner: reader.readStringOrNull(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    followersCount: reader.readLongOrNull(offsets[2]),
    followsCount: reader.readLongOrNull(offsets[3]),
    postsCount: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _profileInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ProfileInfoQueryFilter
    on QueryBuilder<ProfileInfo, ProfileInfo, QFilterCondition> {
  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'banner',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      bannerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'banner',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      bannerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'banner',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      bannerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'banner',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition> bannerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'banner',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      bannerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'banner',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      bannerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'banner',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'followersCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'followersCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'followersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'followersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'followersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followersCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'followersCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'followsCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'followsCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'followsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'followsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'followsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      followsCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'followsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'postsCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'postsCount',
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'postsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'postsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'postsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProfileInfo, ProfileInfo, QAfterFilterCondition>
      postsCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'postsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProfileInfoQueryObject
    on QueryBuilder<ProfileInfo, ProfileInfo, QFilterCondition> {}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonAccount _$MastodonAccountFromJson(Map<String, dynamic> json) =>
    MastodonAccount(
      id: json['id'] as String,
      username: json['username'] as String,
      acct: json['acct'] as String,
      displayName: json['display_name'] as String,
      locked: json['locked'] as bool,
      bot: json['bot'] as bool,
      createdAt: dateTimeFromISO8601(json['created_at'] as String),
      note: json['note'] as String,
      url: json['url'] as String,
      avatar: json['avatar'] as String,
      avatarStatic: json['avatar_static'] as String,
      lastStatusAt: dateTimeFromISO8601(json['last_status_at'] as String),
      emojis: (json['emojis'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      header: json['header'] as String?,
      headerStatic: json['header_static'] as String?,
      followersCount: json['followers_count'] as int? ?? 0,
      followingCount: json['following_count'] as int? ?? 0,
      statusesCount: json['statuses_count'] as int? ?? 0,
      source: json['source'] == null
          ? null
          : AccountSource.fromJson(json['source'] as Map<String, dynamic>),
      role: json['role'] == null
          ? null
          : AccountRole.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MastodonAccountToJson(MastodonAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'acct': instance.acct,
      'display_name': instance.displayName,
      'locked': instance.locked,
      'bot': instance.bot,
      'created_at': dateTimeToISO8601(instance.createdAt),
      'note': instance.note,
      'url': instance.url,
      'avatar': instance.avatar,
      'avatar_static': instance.avatarStatic,
      'header': instance.header,
      'header_static': instance.headerStatic,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'statuses_count': instance.statusesCount,
      'last_status_at': dateTimeToISO8601(instance.lastStatusAt),
      'emojis': instance.emojis,
      'fields': instance.fields,
      'source': instance.source,
      'role': instance.role,
    };

AccountSource _$AccountSourceFromJson(Map<String, dynamic> json) =>
    AccountSource(
      note: json['note'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => AccountField.fromJson(e as Map<String, dynamic>))
          .toList(),
      privacy: $enumDecode(_$PostVisibilityEnumMap, json['privacy']),
      sensitive: json['sensitive'] as bool,
      language: json['language'] as String,
      followRequestsCount: json['follow_requests_count'] as int,
    );

Map<String, dynamic> _$AccountSourceToJson(AccountSource instance) =>
    <String, dynamic>{
      'note': instance.note,
      'fields': instance.fields,
      'privacy': _$PostVisibilityEnumMap[instance.privacy]!,
      'sensitive': instance.sensitive,
      'language': instance.language,
      'follow_requests_count': instance.followRequestsCount,
    };

const _$PostVisibilityEnumMap = {
  PostVisibility.public: 'public',
  PostVisibility.unlisted: 'unlisted',
  PostVisibility.private: 'private',
  PostVisibility.direct: 'direct',
};

AccountField _$AccountFieldFromJson(Map<String, dynamic> json) => AccountField(
      name: json['name'] as String,
      value: json['value'] as String,
      verifiedAt: dateTimeFromISO8601(json['verified_at'] as String),
    );

Map<String, dynamic> _$AccountFieldToJson(AccountField instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'verified_at': dateTimeToISO8601(instance.verifiedAt),
    };

AccountRole _$AccountRoleFromJson(Map<String, dynamic> json) => AccountRole(
      id: json['id'] as int,
      name: json['name'] as String,
      permissions: json['permissions'] as int,
      highlighted: json['highlighted'] as bool,
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$AccountRoleToJson(AccountRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'permissions': instance.permissions,
      'highlighted': instance.highlighted,
    };
