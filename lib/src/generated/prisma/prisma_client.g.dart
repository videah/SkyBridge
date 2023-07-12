// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisma_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecordWhereInput _$UserRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => UserRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => UserRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => UserRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFilter.fromJson(json['did'] as Map<String, dynamic>),
      banner: json['banner'] == null
          ? null
          : StringFilter.fromJson(json['banner'] as Map<String, dynamic>),
      followersCount: json['followers_count'] == null
          ? null
          : IntFilter.fromJson(json['followers_count'] as Map<String, dynamic>),
      followsCount: json['follows_count'] == null
          ? null
          : IntFilter.fromJson(json['follows_count'] as Map<String, dynamic>),
      postsCount: json['posts_count'] == null
          ? null
          : IntFilter.fromJson(json['posts_count'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFilter.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecordWhereInputToJson(
    UserRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

UserRecordOrderByWithRelationInput _$UserRecordOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
      banner: $enumDecodeNullable(_$SortOrderEnumMap, json['banner']),
      followersCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
      followsCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
      postsCount: $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
      description: $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
    );

Map<String, dynamic> _$UserRecordOrderByWithRelationInputToJson(
    UserRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('banner', _$SortOrderEnumMap[instance.banner]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};

UserRecordWhereUniqueInput _$UserRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      did: json['did'] as String?,
    );

Map<String, dynamic> _$UserRecordWhereUniqueInputToJson(
    UserRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('did', instance.did);
  return val;
}

UserRecordOrderByWithAggregationInput
    _$UserRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        UserRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          banner: $enumDecodeNullable(_$SortOrderEnumMap, json['banner']),
          followersCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
          followsCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
          postsCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
          $count: json['_count'] == null
              ? null
              : UserRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : UserRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : UserRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : UserRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : UserRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserRecordOrderByWithAggregationInputToJson(
    UserRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('banner', _$SortOrderEnumMap[instance.banner]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

UserRecordScalarWhereWithAggregatesInput
    _$UserRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        UserRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              UserRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              UserRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              UserRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          did: json['did'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['did'] as Map<String, dynamic>),
          banner: json['banner'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['banner'] as Map<String, dynamic>),
          followersCount: json['followers_count'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['followers_count'] as Map<String, dynamic>),
          followsCount: json['follows_count'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['follows_count'] as Map<String, dynamic>),
          postsCount: json['posts_count'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['posts_count'] as Map<String, dynamic>),
          description: json['description'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['description'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserRecordScalarWhereWithAggregatesInputToJson(
    UserRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

PostRecordWhereInput _$PostRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => PostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => PostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => PostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFilter.fromJson(json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFilter.fromJson(json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringFilter.fromJson(json['author_did'] as Map<String, dynamic>),
      reposts: json['reposts'] == null
          ? null
          : RepostRecordListRelationFilter.fromJson(
              json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordWhereInputToJson(
    PostRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordOrderByWithRelationInput _$PostRecordOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
      reposts: json['reposts'] == null
          ? null
          : RepostRecordOrderByRelationAggregateInput.fromJson(
              json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordOrderByWithRelationInputToJson(
    PostRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordWhereUniqueInput _$PostRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      cid: json['cid'] as String?,
    );

Map<String, dynamic> _$PostRecordWhereUniqueInputToJson(
    PostRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('cid', instance.cid);
  return val;
}

PostRecordOrderByWithAggregationInput
    _$PostRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
          authorDid:
              $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
          $count: json['_count'] == null
              ? null
              : PostRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : PostRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : PostRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : PostRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : PostRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordOrderByWithAggregationInputToJson(
    PostRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

PostRecordScalarWhereWithAggregatesInput
    _$PostRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              PostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              PostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              PostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['uri'] as Map<String, dynamic>),
          authorDid: json['author_did'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['author_did'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordScalarWhereWithAggregatesInputToJson(
    PostRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

RepostRecordWhereInput _$RepostRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => RepostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => RepostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => RepostRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      hashId: json['hash_id'] == null
          ? null
          : StringFilter.fromJson(json['hash_id'] as Map<String, dynamic>),
      originalPostId: json['original_post_id'] == null
          ? null
          : BigIntFilter.fromJson(
              json['original_post_id'] as Map<String, dynamic>),
      originalPost: json['original_post'] == null
          ? null
          : PostRecordRelationFilter.fromJson(
              json['original_post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordWhereInputToJson(
    RepostRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post_id', instance.originalPostId?.toJson());
  writeNotNull('original_post', instance.originalPost?.toJson());
  return val;
}

RepostRecordOrderByWithRelationInput
    _$RepostRecordOrderByWithRelationInputFromJson(Map<String, dynamic> json) =>
        RepostRecordOrderByWithRelationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          hashId: $enumDecodeNullable(_$SortOrderEnumMap, json['hash_id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
          originalPost: json['original_post'] == null
              ? null
              : PostRecordOrderByWithRelationInput.fromJson(
                  json['original_post'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordOrderByWithRelationInputToJson(
    RepostRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('hash_id', _$SortOrderEnumMap[instance.hashId]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  writeNotNull('original_post', instance.originalPost?.toJson());
  return val;
}

RepostRecordWhereUniqueInput _$RepostRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      hashId: json['hash_id'] as String?,
    );

Map<String, dynamic> _$RepostRecordWhereUniqueInputToJson(
    RepostRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('hash_id', instance.hashId);
  return val;
}

RepostRecordOrderByWithAggregationInput
    _$RepostRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          hashId: $enumDecodeNullable(_$SortOrderEnumMap, json['hash_id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
          $count: json['_count'] == null
              ? null
              : RepostRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : RepostRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : RepostRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : RepostRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : RepostRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordOrderByWithAggregationInputToJson(
    RepostRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('hash_id', _$SortOrderEnumMap[instance.hashId]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

RepostRecordScalarWhereWithAggregatesInput
    _$RepostRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              RepostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              RepostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              RepostRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
          originalPostId: json['original_post_id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['original_post_id'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordScalarWhereWithAggregatesInputToJson(
    RepostRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post_id', instance.originalPostId?.toJson());
  return val;
}

NotificationRecordWhereInput _$NotificationRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    NotificationRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map((e) =>
          NotificationRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map((e) =>
          NotificationRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
          NotificationRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFilter.fromJson(json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFilter.fromJson(json['uri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationRecordWhereInputToJson(
    NotificationRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

NotificationRecordOrderByWithRelationInput
    _$NotificationRecordOrderByWithRelationInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordOrderByWithRelationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
        );

Map<String, dynamic> _$NotificationRecordOrderByWithRelationInputToJson(
    NotificationRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  return val;
}

NotificationRecordWhereUniqueInput _$NotificationRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    NotificationRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
    );

Map<String, dynamic> _$NotificationRecordWhereUniqueInputToJson(
    NotificationRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  return val;
}

NotificationRecordOrderByWithAggregationInput
    _$NotificationRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
          $count: json['_count'] == null
              ? null
              : NotificationRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : NotificationRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : NotificationRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : NotificationRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : NotificationRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NotificationRecordOrderByWithAggregationInputToJson(
    NotificationRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

NotificationRecordScalarWhereWithAggregatesInput
    _$NotificationRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              NotificationRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              NotificationRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              NotificationRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['uri'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NotificationRecordScalarWhereWithAggregatesInputToJson(
    NotificationRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

MediaRecordWhereInput _$MediaRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => MediaRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => MediaRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => MediaRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : StringFilter.fromJson(json['type'] as Map<String, dynamic>),
      mimeType: json['mime_type'] == null
          ? null
          : StringFilter.fromJson(json['mime_type'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : IntFilter.fromJson(json['size'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : StringFilter.fromJson(json['link'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFilter.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaRecordWhereInputToJson(
    MediaRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

MediaRecordOrderByWithRelationInput
    _$MediaRecordOrderByWithRelationInputFromJson(Map<String, dynamic> json) =>
        MediaRecordOrderByWithRelationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          type: $enumDecodeNullable(_$SortOrderEnumMap, json['type']),
          mimeType: $enumDecodeNullable(_$SortOrderEnumMap, json['mime_type']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
          link: $enumDecodeNullable(_$SortOrderEnumMap, json['link']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
        );

Map<String, dynamic> _$MediaRecordOrderByWithRelationInputToJson(
    MediaRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('type', _$SortOrderEnumMap[instance.type]);
  writeNotNull('mime_type', _$SortOrderEnumMap[instance.mimeType]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  writeNotNull('link', _$SortOrderEnumMap[instance.link]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

MediaRecordWhereUniqueInput _$MediaRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
    );

Map<String, dynamic> _$MediaRecordWhereUniqueInputToJson(
    MediaRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  return val;
}

MediaRecordOrderByWithAggregationInput
    _$MediaRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        MediaRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          type: $enumDecodeNullable(_$SortOrderEnumMap, json['type']),
          mimeType: $enumDecodeNullable(_$SortOrderEnumMap, json['mime_type']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
          link: $enumDecodeNullable(_$SortOrderEnumMap, json['link']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
          $count: json['_count'] == null
              ? null
              : MediaRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : MediaRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : MediaRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : MediaRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : MediaRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MediaRecordOrderByWithAggregationInputToJson(
    MediaRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('type', _$SortOrderEnumMap[instance.type]);
  writeNotNull('mime_type', _$SortOrderEnumMap[instance.mimeType]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  writeNotNull('link', _$SortOrderEnumMap[instance.link]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

MediaRecordScalarWhereWithAggregatesInput
    _$MediaRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        MediaRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              MediaRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              MediaRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              MediaRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          type: json['type'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['type'] as Map<String, dynamic>),
          mimeType: json['mime_type'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['mime_type'] as Map<String, dynamic>),
          size: json['size'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['size'] as Map<String, dynamic>),
          link: json['link'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['link'] as Map<String, dynamic>),
          description: json['description'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['description'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MediaRecordScalarWhereWithAggregatesInputToJson(
    MediaRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

FeedRecordWhereInput _$FeedRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => FeedRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => FeedRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => FeedRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFilter.fromJson(json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFilter.fromJson(json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringNullableFilter.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedRecordWhereInputToJson(
    FeedRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

FeedRecordOrderByWithRelationInput _$FeedRecordOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
    );

Map<String, dynamic> _$FeedRecordOrderByWithRelationInputToJson(
    FeedRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

FeedRecordWhereUniqueInput _$FeedRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordWhereUniqueInput(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
    );

Map<String, dynamic> _$FeedRecordWhereUniqueInputToJson(
    FeedRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  return val;
}

FeedRecordOrderByWithAggregationInput
    _$FeedRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        FeedRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
          authorDid:
              $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
          $count: json['_count'] == null
              ? null
              : FeedRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : FeedRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : FeedRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : FeedRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : FeedRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$FeedRecordOrderByWithAggregationInputToJson(
    FeedRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

FeedRecordScalarWhereWithAggregatesInput
    _$FeedRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        FeedRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              FeedRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              FeedRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              FeedRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : BigIntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['uri'] as Map<String, dynamic>),
          authorDid: json['author_did'] == null
              ? null
              : StringNullableWithAggregatesFilter.fromJson(
                  json['author_did'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$FeedRecordScalarWhereWithAggregatesInputToJson(
    FeedRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

SessionRecordWhereInput _$SessionRecordWhereInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => SessionRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => SessionRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => SessionRecordWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFilter.fromJson(json['did'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : StringFilter.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionRecordWhereInputToJson(
    SessionRecordWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

SessionRecordOrderByWithRelationInput
    _$SessionRecordOrderByWithRelationInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordOrderByWithRelationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          session: $enumDecodeNullable(_$SortOrderEnumMap, json['session']),
        );

Map<String, dynamic> _$SessionRecordOrderByWithRelationInputToJson(
    SessionRecordOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('session', _$SortOrderEnumMap[instance.session]);
  return val;
}

SessionRecordWhereUniqueInput _$SessionRecordWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordWhereUniqueInput(
      id: json['id'] as int?,
      did: json['did'] as String?,
    );

Map<String, dynamic> _$SessionRecordWhereUniqueInputToJson(
    SessionRecordWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('did', instance.did);
  return val;
}

SessionRecordOrderByWithAggregationInput
    _$SessionRecordOrderByWithAggregationInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordOrderByWithAggregationInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          session: $enumDecodeNullable(_$SortOrderEnumMap, json['session']),
          $count: json['_count'] == null
              ? null
              : SessionRecordCountOrderByAggregateInput.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $avg: json['_avg'] == null
              ? null
              : SessionRecordAvgOrderByAggregateInput.fromJson(
                  json['_avg'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : SessionRecordMaxOrderByAggregateInput.fromJson(
                  json['_max'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : SessionRecordMinOrderByAggregateInput.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $sum: json['_sum'] == null
              ? null
              : SessionRecordSumOrderByAggregateInput.fromJson(
                  json['_sum'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SessionRecordOrderByWithAggregationInputToJson(
    SessionRecordOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('session', _$SortOrderEnumMap[instance.session]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

SessionRecordScalarWhereWithAggregatesInput
    _$SessionRecordScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              SessionRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              SessionRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              SessionRecordScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          did: json['did'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['did'] as Map<String, dynamic>),
          session: json['session'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['session'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SessionRecordScalarWhereWithAggregatesInputToJson(
    SessionRecordScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

UserRecordCreateInput _$UserRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      did: json['did'] as String,
      banner: json['banner'] as String?,
      followersCount: json['followers_count'] as int?,
      followsCount: json['follows_count'] as int?,
      postsCount: json['posts_count'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserRecordCreateInputToJson(
    UserRecordCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'did': instance.did,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('banner', instance.banner);
  writeNotNull('followers_count', instance.followersCount);
  writeNotNull('follows_count', instance.followsCount);
  writeNotNull('posts_count', instance.postsCount);
  writeNotNull('description', instance.description);
  return val;
}

UserRecordUncheckedCreateInput _$UserRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordUncheckedCreateInput(
      id: BigInt.parse(json['id'] as String),
      did: json['did'] as String,
      banner: json['banner'] as String?,
      followersCount: json['followers_count'] as int?,
      followsCount: json['follows_count'] as int?,
      postsCount: json['posts_count'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserRecordUncheckedCreateInputToJson(
    UserRecordUncheckedCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'did': instance.did,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('banner', instance.banner);
  writeNotNull('followers_count', instance.followersCount);
  writeNotNull('follows_count', instance.followsCount);
  writeNotNull('posts_count', instance.postsCount);
  writeNotNull('description', instance.description);
  return val;
}

UserRecordUpdateInput _$UserRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      banner: json['banner'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['banner'] as Map<String, dynamic>),
      followersCount: json['followers_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['followers_count'] as Map<String, dynamic>),
      followsCount: json['follows_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['follows_count'] as Map<String, dynamic>),
      postsCount: json['posts_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['posts_count'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecordUpdateInputToJson(
    UserRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

UserRecordUncheckedUpdateInput _$UserRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      banner: json['banner'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['banner'] as Map<String, dynamic>),
      followersCount: json['followers_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['followers_count'] as Map<String, dynamic>),
      followsCount: json['follows_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['follows_count'] as Map<String, dynamic>),
      postsCount: json['posts_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['posts_count'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecordUncheckedUpdateInputToJson(
    UserRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

UserRecordUpdateManyMutationInput _$UserRecordUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      banner: json['banner'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['banner'] as Map<String, dynamic>),
      followersCount: json['followers_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['followers_count'] as Map<String, dynamic>),
      followsCount: json['follows_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['follows_count'] as Map<String, dynamic>),
      postsCount: json['posts_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['posts_count'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecordUpdateManyMutationInputToJson(
    UserRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

UserRecordUncheckedUpdateManyInput _$UserRecordUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      banner: json['banner'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['banner'] as Map<String, dynamic>),
      followersCount: json['followers_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['followers_count'] as Map<String, dynamic>),
      followsCount: json['follows_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['follows_count'] as Map<String, dynamic>),
      postsCount: json['posts_count'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['posts_count'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRecordUncheckedUpdateManyInputToJson(
    UserRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('banner', instance.banner?.toJson());
  writeNotNull('followers_count', instance.followersCount?.toJson());
  writeNotNull('follows_count', instance.followsCount?.toJson());
  writeNotNull('posts_count', instance.postsCount?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

PostRecordCreateInput _$PostRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String,
      reposts: json['reposts'] == null
          ? null
          : RepostRecordCreateNestedManyWithoutOriginalPostInput.fromJson(
              json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordCreateInputToJson(
    PostRecordCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'cid': instance.cid,
    'uri': instance.uri,
    'author_did': instance.authorDid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordUncheckedCreateInput _$PostRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordUncheckedCreateInput(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String,
      reposts: json['reposts'] == null
          ? null
          : RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput
              .fromJson(json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordUncheckedCreateInputToJson(
    PostRecordUncheckedCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'cid': instance.cid,
    'uri': instance.uri,
    'author_did': instance.authorDid,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordUpdateInput _$PostRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
      reposts: json['reposts'] == null
          ? null
          : RepostRecordUpdateManyWithoutOriginalPostNestedInput.fromJson(
              json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordUpdateInputToJson(
    PostRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordUncheckedUpdateInput _$PostRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
      reposts: json['reposts'] == null
          ? null
          : RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput
              .fromJson(json['reposts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordUncheckedUpdateInputToJson(
    PostRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  writeNotNull('reposts', instance.reposts?.toJson());
  return val;
}

PostRecordUpdateManyMutationInput _$PostRecordUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordUpdateManyMutationInputToJson(
    PostRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

PostRecordUncheckedUpdateManyInput _$PostRecordUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordUncheckedUpdateManyInputToJson(
    PostRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

RepostRecordCreateInput _$RepostRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      hashId: json['hash_id'] as String,
      originalPost: PostRecordCreateNestedOneWithoutRepostsInput.fromJson(
          json['original_post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordCreateInputToJson(
        RepostRecordCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'hash_id': instance.hashId,
      'original_post': instance.originalPost.toJson(),
    };

RepostRecordUncheckedCreateInput _$RepostRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordUncheckedCreateInput(
      id: BigInt.parse(json['id'] as String),
      hashId: json['hash_id'] as String,
      originalPostId: BigInt.parse(json['original_post_id'] as String),
    );

Map<String, dynamic> _$RepostRecordUncheckedCreateInputToJson(
        RepostRecordUncheckedCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'hash_id': instance.hashId,
      'original_post_id': instance.originalPostId.toString(),
    };

RepostRecordUpdateInput _$RepostRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      hashId: json['hash_id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['hash_id'] as Map<String, dynamic>),
      originalPost: json['original_post'] == null
          ? null
          : PostRecordUpdateOneRequiredWithoutRepostsNestedInput.fromJson(
              json['original_post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordUpdateInputToJson(
    RepostRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post', instance.originalPost?.toJson());
  return val;
}

RepostRecordUncheckedUpdateInput _$RepostRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      hashId: json['hash_id'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['hash_id'] as Map<String, dynamic>),
      originalPostId: json['original_post_id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['original_post_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordUncheckedUpdateInputToJson(
    RepostRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post_id', instance.originalPostId?.toJson());
  return val;
}

RepostRecordUpdateManyMutationInput
    _$RepostRecordUpdateManyMutationInputFromJson(Map<String, dynamic> json) =>
        RepostRecordUpdateManyMutationInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordUpdateManyMutationInputToJson(
    RepostRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  return val;
}

RepostRecordUncheckedUpdateManyInput
    _$RepostRecordUncheckedUpdateManyInputFromJson(Map<String, dynamic> json) =>
        RepostRecordUncheckedUpdateManyInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
          originalPostId: json['original_post_id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['original_post_id'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordUncheckedUpdateManyInputToJson(
    RepostRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post_id', instance.originalPostId?.toJson());
  return val;
}

NotificationRecordCreateInput _$NotificationRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    NotificationRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$NotificationRecordCreateInputToJson(
        NotificationRecordCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
    };

NotificationRecordUncheckedCreateInput
    _$NotificationRecordUncheckedCreateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordUncheckedCreateInput(
          id: BigInt.parse(json['id'] as String),
          cid: json['cid'] as String,
          uri: json['uri'] as String,
        );

Map<String, dynamic> _$NotificationRecordUncheckedCreateInputToJson(
        NotificationRecordUncheckedCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
    };

NotificationRecordUpdateInput _$NotificationRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    NotificationRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationRecordUpdateInputToJson(
    NotificationRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

NotificationRecordUncheckedUpdateInput
    _$NotificationRecordUncheckedUpdateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordUncheckedUpdateInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['uri'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NotificationRecordUncheckedUpdateInputToJson(
    NotificationRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

NotificationRecordUpdateManyMutationInput
    _$NotificationRecordUpdateManyMutationInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordUpdateManyMutationInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['uri'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NotificationRecordUpdateManyMutationInputToJson(
    NotificationRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

NotificationRecordUncheckedUpdateManyInput
    _$NotificationRecordUncheckedUpdateManyInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordUncheckedUpdateManyInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['uri'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NotificationRecordUncheckedUpdateManyInputToJson(
    NotificationRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  return val;
}

MediaRecordCreateInput _$MediaRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      type: json['type'] as String,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
      link: json['link'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MediaRecordCreateInputToJson(
        MediaRecordCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'type': instance.type,
      'mime_type': instance.mimeType,
      'size': instance.size,
      'link': instance.link,
      'description': instance.description,
    };

MediaRecordUncheckedCreateInput _$MediaRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordUncheckedCreateInput(
      id: BigInt.parse(json['id'] as String),
      type: json['type'] as String,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
      link: json['link'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MediaRecordUncheckedCreateInputToJson(
        MediaRecordUncheckedCreateInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'type': instance.type,
      'mime_type': instance.mimeType,
      'size': instance.size,
      'link': instance.link,
      'description': instance.description,
    };

MediaRecordUpdateInput _$MediaRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['type'] as Map<String, dynamic>),
      mimeType: json['mime_type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['mime_type'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['size'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['link'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaRecordUpdateInputToJson(
    MediaRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

MediaRecordUncheckedUpdateInput _$MediaRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['type'] as Map<String, dynamic>),
      mimeType: json['mime_type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['mime_type'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['size'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['link'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaRecordUncheckedUpdateInputToJson(
    MediaRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

MediaRecordUpdateManyMutationInput _$MediaRecordUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    MediaRecordUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      type: json['type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['type'] as Map<String, dynamic>),
      mimeType: json['mime_type'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['mime_type'] as Map<String, dynamic>),
      size: json['size'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['size'] as Map<String, dynamic>),
      link: json['link'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['link'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaRecordUpdateManyMutationInputToJson(
    MediaRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

MediaRecordUncheckedUpdateManyInput
    _$MediaRecordUncheckedUpdateManyInputFromJson(Map<String, dynamic> json) =>
        MediaRecordUncheckedUpdateManyInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          type: json['type'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['type'] as Map<String, dynamic>),
          mimeType: json['mime_type'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['mime_type'] as Map<String, dynamic>),
          size: json['size'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['size'] as Map<String, dynamic>),
          link: json['link'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['link'] as Map<String, dynamic>),
          description: json['description'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['description'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$MediaRecordUncheckedUpdateManyInputToJson(
    MediaRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('type', instance.type?.toJson());
  writeNotNull('mime_type', instance.mimeType?.toJson());
  writeNotNull('size', instance.size?.toJson());
  writeNotNull('link', instance.link?.toJson());
  writeNotNull('description', instance.description?.toJson());
  return val;
}

FeedRecordCreateInput _$FeedRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordCreateInput(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String?,
    );

Map<String, dynamic> _$FeedRecordCreateInputToJson(
    FeedRecordCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'cid': instance.cid,
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author_did', instance.authorDid);
  return val;
}

FeedRecordUncheckedCreateInput _$FeedRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordUncheckedCreateInput(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String?,
    );

Map<String, dynamic> _$FeedRecordUncheckedCreateInputToJson(
    FeedRecordUncheckedCreateInput instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'cid': instance.cid,
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author_did', instance.authorDid);
  return val;
}

FeedRecordUpdateInput _$FeedRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedRecordUpdateInputToJson(
    FeedRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

FeedRecordUncheckedUpdateInput _$FeedRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedRecordUncheckedUpdateInputToJson(
    FeedRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

FeedRecordUpdateManyMutationInput _$FeedRecordUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordUpdateManyMutationInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedRecordUpdateManyMutationInputToJson(
    FeedRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

FeedRecordUncheckedUpdateManyInput _$FeedRecordUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : BigIntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      cid: json['cid'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['cid'] as Map<String, dynamic>),
      uri: json['uri'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['uri'] as Map<String, dynamic>),
      authorDid: json['author_did'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['author_did'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedRecordUncheckedUpdateManyInputToJson(
    FeedRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

SessionRecordCreateInput _$SessionRecordCreateInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordCreateInput(
      did: json['did'] as String,
      session: json['session'] as String,
    );

Map<String, dynamic> _$SessionRecordCreateInputToJson(
        SessionRecordCreateInput instance) =>
    <String, dynamic>{
      'did': instance.did,
      'session': instance.session,
    };

SessionRecordUncheckedCreateInput _$SessionRecordUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordUncheckedCreateInput(
      id: json['id'] as int?,
      did: json['did'] as String,
      session: json['session'] as String,
    );

Map<String, dynamic> _$SessionRecordUncheckedCreateInputToJson(
    SessionRecordUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['did'] = instance.did;
  val['session'] = instance.session;
  return val;
}

SessionRecordUpdateInput _$SessionRecordUpdateInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordUpdateInput(
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionRecordUpdateInputToJson(
    SessionRecordUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

SessionRecordUncheckedUpdateInput _$SessionRecordUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    SessionRecordUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      did: json['did'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['did'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionRecordUncheckedUpdateInputToJson(
    SessionRecordUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

SessionRecordUpdateManyMutationInput
    _$SessionRecordUpdateManyMutationInputFromJson(Map<String, dynamic> json) =>
        SessionRecordUpdateManyMutationInput(
          did: json['did'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['did'] as Map<String, dynamic>),
          session: json['session'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['session'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SessionRecordUpdateManyMutationInputToJson(
    SessionRecordUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

SessionRecordUncheckedUpdateManyInput
    _$SessionRecordUncheckedUpdateManyInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordUncheckedUpdateManyInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          did: json['did'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['did'] as Map<String, dynamic>),
          session: json['session'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['session'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$SessionRecordUncheckedUpdateManyInputToJson(
    SessionRecordUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('did', instance.did?.toJson());
  writeNotNull('session', instance.session?.toJson());
  return val;
}

BigIntFilter _$BigIntFilterFromJson(Map<String, dynamic> json) => BigIntFilter(
      equals: json['equals'] == null
          ? null
          : BigInt.parse(json['equals'] as String),
      $in:
          (json['in'] as List<dynamic>?)?.map((e) => BigInt.parse(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => BigInt.parse(e as String)),
      lt: json['lt'] == null ? null : BigInt.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : BigInt.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : BigInt.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : BigInt.parse(json['gte'] as String),
      not: json['not'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BigIntFilterToJson(BigIntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals?.toString());
  writeNotNull('in', instance.$in?.map((e) => e.toString()).toList());
  writeNotNull('notIn', instance.notIn?.map((e) => e.toString()).toList());
  writeNotNull('lt', instance.lt?.toString());
  writeNotNull('lte', instance.lte?.toString());
  writeNotNull('gt', instance.gt?.toString());
  writeNotNull('gte', instance.gte?.toString());
  writeNotNull('not', instance.not?.toJson());
  return val;
}

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) => StringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

IntFilter _$IntFilterFromJson(Map<String, dynamic> json) => IntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntFilterToJson(IntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

UserRecordCountOrderByAggregateInput
    _$UserRecordCountOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        UserRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          banner: $enumDecodeNullable(_$SortOrderEnumMap, json['banner']),
          followersCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
          followsCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
          postsCount:
              $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
        );

Map<String, dynamic> _$UserRecordCountOrderByAggregateInputToJson(
    UserRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('banner', _$SortOrderEnumMap[instance.banner]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

UserRecordAvgOrderByAggregateInput _$UserRecordAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      followersCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
      followsCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
      postsCount: $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
    );

Map<String, dynamic> _$UserRecordAvgOrderByAggregateInputToJson(
    UserRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  return val;
}

UserRecordMaxOrderByAggregateInput _$UserRecordMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
      banner: $enumDecodeNullable(_$SortOrderEnumMap, json['banner']),
      followersCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
      followsCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
      postsCount: $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
      description: $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
    );

Map<String, dynamic> _$UserRecordMaxOrderByAggregateInputToJson(
    UserRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('banner', _$SortOrderEnumMap[instance.banner]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

UserRecordMinOrderByAggregateInput _$UserRecordMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
      banner: $enumDecodeNullable(_$SortOrderEnumMap, json['banner']),
      followersCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
      followsCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
      postsCount: $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
      description: $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
    );

Map<String, dynamic> _$UserRecordMinOrderByAggregateInputToJson(
    UserRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('banner', _$SortOrderEnumMap[instance.banner]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

UserRecordSumOrderByAggregateInput _$UserRecordSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserRecordSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      followersCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['followers_count']),
      followsCount:
          $enumDecodeNullable(_$SortOrderEnumMap, json['follows_count']),
      postsCount: $enumDecodeNullable(_$SortOrderEnumMap, json['posts_count']),
    );

Map<String, dynamic> _$UserRecordSumOrderByAggregateInputToJson(
    UserRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('followers_count', _$SortOrderEnumMap[instance.followersCount]);
  writeNotNull('follows_count', _$SortOrderEnumMap[instance.followsCount]);
  writeNotNull('posts_count', _$SortOrderEnumMap[instance.postsCount]);
  return val;
}

BigIntWithAggregatesFilter _$BigIntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    BigIntWithAggregatesFilter(
      equals: json['equals'] == null
          ? null
          : BigInt.parse(json['equals'] as String),
      $in:
          (json['in'] as List<dynamic>?)?.map((e) => BigInt.parse(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => BigInt.parse(e as String)),
      lt: json['lt'] == null ? null : BigInt.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : BigInt.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : BigInt.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : BigInt.parse(json['gte'] as String),
      not: json['not'] == null
          ? null
          : NestedBigIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BigIntWithAggregatesFilterToJson(
    BigIntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals?.toString());
  writeNotNull('in', instance.$in?.map((e) => e.toString()).toList());
  writeNotNull('notIn', instance.notIn?.map((e) => e.toString()).toList());
  writeNotNull('lt', instance.lt?.toString());
  writeNotNull('lte', instance.lte?.toString());
  writeNotNull('gt', instance.gt?.toString());
  writeNotNull('gte', instance.gte?.toString());
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

StringWithAggregatesFilter _$StringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    StringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringWithAggregatesFilterToJson(
    StringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

IntWithAggregatesFilter _$IntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    IntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntWithAggregatesFilterToJson(
    IntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

RepostRecordListRelationFilter _$RepostRecordListRelationFilterFromJson(
        Map<String, dynamic> json) =>
    RepostRecordListRelationFilter(
      every: json['every'] == null
          ? null
          : RepostRecordWhereInput.fromJson(
              json['every'] as Map<String, dynamic>),
      some: json['some'] == null
          ? null
          : RepostRecordWhereInput.fromJson(
              json['some'] as Map<String, dynamic>),
      none: json['none'] == null
          ? null
          : RepostRecordWhereInput.fromJson(
              json['none'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordListRelationFilterToJson(
    RepostRecordListRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('every', instance.every?.toJson());
  writeNotNull('some', instance.some?.toJson());
  writeNotNull('none', instance.none?.toJson());
  return val;
}

RepostRecordOrderByRelationAggregateInput
    _$RepostRecordOrderByRelationAggregateInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordOrderByRelationAggregateInput(
          $count: $enumDecodeNullable(_$SortOrderEnumMap, json['_count']),
        );

Map<String, dynamic> _$RepostRecordOrderByRelationAggregateInputToJson(
    RepostRecordOrderByRelationAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_count', _$SortOrderEnumMap[instance.$count]);
  return val;
}

PostRecordCountOrderByAggregateInput
    _$PostRecordCountOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        PostRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
          authorDid:
              $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
        );

Map<String, dynamic> _$PostRecordCountOrderByAggregateInputToJson(
    PostRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

PostRecordAvgOrderByAggregateInput _$PostRecordAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$PostRecordAvgOrderByAggregateInputToJson(
    PostRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

PostRecordMaxOrderByAggregateInput _$PostRecordMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
    );

Map<String, dynamic> _$PostRecordMaxOrderByAggregateInputToJson(
    PostRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

PostRecordMinOrderByAggregateInput _$PostRecordMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
    );

Map<String, dynamic> _$PostRecordMinOrderByAggregateInputToJson(
    PostRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

PostRecordSumOrderByAggregateInput _$PostRecordSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostRecordSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$PostRecordSumOrderByAggregateInputToJson(
    PostRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

PostRecordRelationFilter _$PostRecordRelationFilterFromJson(
        Map<String, dynamic> json) =>
    PostRecordRelationFilter(
      $is: json['is'] == null
          ? null
          : PostRecordWhereInput.fromJson(json['is'] as Map<String, dynamic>),
      isNot: json['isNot'] == null
          ? null
          : PostRecordWhereInput.fromJson(
              json['isNot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRecordRelationFilterToJson(
    PostRecordRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is', instance.$is?.toJson());
  writeNotNull('isNot', instance.isNot?.toJson());
  return val;
}

RepostRecordCountOrderByAggregateInput
    _$RepostRecordCountOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          hashId: $enumDecodeNullable(_$SortOrderEnumMap, json['hash_id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
        );

Map<String, dynamic> _$RepostRecordCountOrderByAggregateInputToJson(
    RepostRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('hash_id', _$SortOrderEnumMap[instance.hashId]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  return val;
}

RepostRecordAvgOrderByAggregateInput
    _$RepostRecordAvgOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        RepostRecordAvgOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
        );

Map<String, dynamic> _$RepostRecordAvgOrderByAggregateInputToJson(
    RepostRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  return val;
}

RepostRecordMaxOrderByAggregateInput
    _$RepostRecordMaxOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        RepostRecordMaxOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          hashId: $enumDecodeNullable(_$SortOrderEnumMap, json['hash_id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
        );

Map<String, dynamic> _$RepostRecordMaxOrderByAggregateInputToJson(
    RepostRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('hash_id', _$SortOrderEnumMap[instance.hashId]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  return val;
}

RepostRecordMinOrderByAggregateInput
    _$RepostRecordMinOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        RepostRecordMinOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          hashId: $enumDecodeNullable(_$SortOrderEnumMap, json['hash_id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
        );

Map<String, dynamic> _$RepostRecordMinOrderByAggregateInputToJson(
    RepostRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('hash_id', _$SortOrderEnumMap[instance.hashId]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  return val;
}

RepostRecordSumOrderByAggregateInput
    _$RepostRecordSumOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        RepostRecordSumOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          originalPostId:
              $enumDecodeNullable(_$SortOrderEnumMap, json['original_post_id']),
        );

Map<String, dynamic> _$RepostRecordSumOrderByAggregateInputToJson(
    RepostRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('original_post_id', _$SortOrderEnumMap[instance.originalPostId]);
  return val;
}

NotificationRecordCountOrderByAggregateInput
    _$NotificationRecordCountOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
        );

Map<String, dynamic> _$NotificationRecordCountOrderByAggregateInputToJson(
    NotificationRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  return val;
}

NotificationRecordAvgOrderByAggregateInput
    _$NotificationRecordAvgOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordAvgOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
        );

Map<String, dynamic> _$NotificationRecordAvgOrderByAggregateInputToJson(
    NotificationRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

NotificationRecordMaxOrderByAggregateInput
    _$NotificationRecordMaxOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordMaxOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
        );

Map<String, dynamic> _$NotificationRecordMaxOrderByAggregateInputToJson(
    NotificationRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  return val;
}

NotificationRecordMinOrderByAggregateInput
    _$NotificationRecordMinOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordMinOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
        );

Map<String, dynamic> _$NotificationRecordMinOrderByAggregateInputToJson(
    NotificationRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  return val;
}

NotificationRecordSumOrderByAggregateInput
    _$NotificationRecordSumOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        NotificationRecordSumOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
        );

Map<String, dynamic> _$NotificationRecordSumOrderByAggregateInputToJson(
    NotificationRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

MediaRecordCountOrderByAggregateInput
    _$MediaRecordCountOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        MediaRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          type: $enumDecodeNullable(_$SortOrderEnumMap, json['type']),
          mimeType: $enumDecodeNullable(_$SortOrderEnumMap, json['mime_type']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
          link: $enumDecodeNullable(_$SortOrderEnumMap, json['link']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
        );

Map<String, dynamic> _$MediaRecordCountOrderByAggregateInputToJson(
    MediaRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('type', _$SortOrderEnumMap[instance.type]);
  writeNotNull('mime_type', _$SortOrderEnumMap[instance.mimeType]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  writeNotNull('link', _$SortOrderEnumMap[instance.link]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

MediaRecordAvgOrderByAggregateInput
    _$MediaRecordAvgOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        MediaRecordAvgOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
        );

Map<String, dynamic> _$MediaRecordAvgOrderByAggregateInputToJson(
    MediaRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  return val;
}

MediaRecordMaxOrderByAggregateInput
    _$MediaRecordMaxOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        MediaRecordMaxOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          type: $enumDecodeNullable(_$SortOrderEnumMap, json['type']),
          mimeType: $enumDecodeNullable(_$SortOrderEnumMap, json['mime_type']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
          link: $enumDecodeNullable(_$SortOrderEnumMap, json['link']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
        );

Map<String, dynamic> _$MediaRecordMaxOrderByAggregateInputToJson(
    MediaRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('type', _$SortOrderEnumMap[instance.type]);
  writeNotNull('mime_type', _$SortOrderEnumMap[instance.mimeType]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  writeNotNull('link', _$SortOrderEnumMap[instance.link]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

MediaRecordMinOrderByAggregateInput
    _$MediaRecordMinOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        MediaRecordMinOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          type: $enumDecodeNullable(_$SortOrderEnumMap, json['type']),
          mimeType: $enumDecodeNullable(_$SortOrderEnumMap, json['mime_type']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
          link: $enumDecodeNullable(_$SortOrderEnumMap, json['link']),
          description:
              $enumDecodeNullable(_$SortOrderEnumMap, json['description']),
        );

Map<String, dynamic> _$MediaRecordMinOrderByAggregateInputToJson(
    MediaRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('type', _$SortOrderEnumMap[instance.type]);
  writeNotNull('mime_type', _$SortOrderEnumMap[instance.mimeType]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  writeNotNull('link', _$SortOrderEnumMap[instance.link]);
  writeNotNull('description', _$SortOrderEnumMap[instance.description]);
  return val;
}

MediaRecordSumOrderByAggregateInput
    _$MediaRecordSumOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        MediaRecordSumOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          size: $enumDecodeNullable(_$SortOrderEnumMap, json['size']),
        );

Map<String, dynamic> _$MediaRecordSumOrderByAggregateInputToJson(
    MediaRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('size', _$SortOrderEnumMap[instance.size]);
  return val;
}

StringNullableFilter _$StringNullableFilterFromJson(
        Map<String, dynamic> json) =>
    StringNullableFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringNullableFilterToJson(
    StringNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

SortOrderInput _$SortOrderInputFromJson(Map<String, dynamic> json) =>
    SortOrderInput(
      sort: $enumDecode(_$SortOrderEnumMap, json['sort']),
      nulls: $enumDecodeNullable(_$NullsOrderEnumMap, json['nulls']),
    );

Map<String, dynamic> _$SortOrderInputToJson(SortOrderInput instance) {
  final val = <String, dynamic>{
    'sort': _$SortOrderEnumMap[instance.sort]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nulls', _$NullsOrderEnumMap[instance.nulls]);
  return val;
}

const _$NullsOrderEnumMap = {
  NullsOrder.first: 'first',
  NullsOrder.last: 'last',
};

FeedRecordCountOrderByAggregateInput
    _$FeedRecordCountOrderByAggregateInputFromJson(Map<String, dynamic> json) =>
        FeedRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
          uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
          authorDid:
              $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
        );

Map<String, dynamic> _$FeedRecordCountOrderByAggregateInputToJson(
    FeedRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

FeedRecordAvgOrderByAggregateInput _$FeedRecordAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$FeedRecordAvgOrderByAggregateInputToJson(
    FeedRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

FeedRecordMaxOrderByAggregateInput _$FeedRecordMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
    );

Map<String, dynamic> _$FeedRecordMaxOrderByAggregateInputToJson(
    FeedRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

FeedRecordMinOrderByAggregateInput _$FeedRecordMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      cid: $enumDecodeNullable(_$SortOrderEnumMap, json['cid']),
      uri: $enumDecodeNullable(_$SortOrderEnumMap, json['uri']),
      authorDid: $enumDecodeNullable(_$SortOrderEnumMap, json['author_did']),
    );

Map<String, dynamic> _$FeedRecordMinOrderByAggregateInputToJson(
    FeedRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('cid', _$SortOrderEnumMap[instance.cid]);
  writeNotNull('uri', _$SortOrderEnumMap[instance.uri]);
  writeNotNull('author_did', _$SortOrderEnumMap[instance.authorDid]);
  return val;
}

FeedRecordSumOrderByAggregateInput _$FeedRecordSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    FeedRecordSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$FeedRecordSumOrderByAggregateInputToJson(
    FeedRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

StringNullableWithAggregatesFilter _$StringNullableWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    StringNullableWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringNullableWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntNullableFilter.fromJson(
              json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringNullableWithAggregatesFilterToJson(
    StringNullableWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

SessionRecordCountOrderByAggregateInput
    _$SessionRecordCountOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordCountOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          session: $enumDecodeNullable(_$SortOrderEnumMap, json['session']),
        );

Map<String, dynamic> _$SessionRecordCountOrderByAggregateInputToJson(
    SessionRecordCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('session', _$SortOrderEnumMap[instance.session]);
  return val;
}

SessionRecordAvgOrderByAggregateInput
    _$SessionRecordAvgOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordAvgOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
        );

Map<String, dynamic> _$SessionRecordAvgOrderByAggregateInputToJson(
    SessionRecordAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

SessionRecordMaxOrderByAggregateInput
    _$SessionRecordMaxOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordMaxOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          session: $enumDecodeNullable(_$SortOrderEnumMap, json['session']),
        );

Map<String, dynamic> _$SessionRecordMaxOrderByAggregateInputToJson(
    SessionRecordMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('session', _$SortOrderEnumMap[instance.session]);
  return val;
}

SessionRecordMinOrderByAggregateInput
    _$SessionRecordMinOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordMinOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
          did: $enumDecodeNullable(_$SortOrderEnumMap, json['did']),
          session: $enumDecodeNullable(_$SortOrderEnumMap, json['session']),
        );

Map<String, dynamic> _$SessionRecordMinOrderByAggregateInputToJson(
    SessionRecordMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('did', _$SortOrderEnumMap[instance.did]);
  writeNotNull('session', _$SortOrderEnumMap[instance.session]);
  return val;
}

SessionRecordSumOrderByAggregateInput
    _$SessionRecordSumOrderByAggregateInputFromJson(
            Map<String, dynamic> json) =>
        SessionRecordSumOrderByAggregateInput(
          id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
        );

Map<String, dynamic> _$SessionRecordSumOrderByAggregateInputToJson(
    SessionRecordSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

BigIntFieldUpdateOperationsInput _$BigIntFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    BigIntFieldUpdateOperationsInput(
      set: json['set'] == null ? null : BigInt.parse(json['set'] as String),
      increment: json['increment'] == null
          ? null
          : BigInt.parse(json['increment'] as String),
      decrement: json['decrement'] == null
          ? null
          : BigInt.parse(json['decrement'] as String),
      multiply: json['multiply'] == null
          ? null
          : BigInt.parse(json['multiply'] as String),
      divide: json['divide'] == null
          ? null
          : BigInt.parse(json['divide'] as String),
    );

Map<String, dynamic> _$BigIntFieldUpdateOperationsInputToJson(
    BigIntFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set?.toString());
  writeNotNull('increment', instance.increment?.toString());
  writeNotNull('decrement', instance.decrement?.toString());
  writeNotNull('multiply', instance.multiply?.toString());
  writeNotNull('divide', instance.divide?.toString());
  return val;
}

StringFieldUpdateOperationsInput _$StringFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    StringFieldUpdateOperationsInput(
      set: json['set'] as String?,
    );

Map<String, dynamic> _$StringFieldUpdateOperationsInputToJson(
    StringFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  return val;
}

IntFieldUpdateOperationsInput _$IntFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    IntFieldUpdateOperationsInput(
      set: json['set'] as int?,
      increment: json['increment'] as int?,
      decrement: json['decrement'] as int?,
      multiply: json['multiply'] as int?,
      divide: json['divide'] as int?,
    );

Map<String, dynamic> _$IntFieldUpdateOperationsInputToJson(
    IntFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  writeNotNull('increment', instance.increment);
  writeNotNull('decrement', instance.decrement);
  writeNotNull('multiply', instance.multiply);
  writeNotNull('divide', instance.divide);
  return val;
}

RepostRecordCreateNestedManyWithoutOriginalPostInput
    _$RepostRecordCreateNestedManyWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordCreateNestedManyWithoutOriginalPostInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              RepostRecordCreateWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) =>
                  RepostRecordCreateOrConnectWithoutOriginalPostInput.fromJson(
                      e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$RepostRecordCreateNestedManyWithoutOriginalPostInputToJson(
        RepostRecordCreateNestedManyWithoutOriginalPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput
    _$RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              RepostRecordCreateWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) =>
                  RepostRecordCreateOrConnectWithoutOriginalPostInput.fromJson(
                      e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInputToJson(
        RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

RepostRecordUpdateManyWithoutOriginalPostNestedInput
    _$RepostRecordUpdateManyWithoutOriginalPostNestedInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUpdateManyWithoutOriginalPostNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              RepostRecordCreateWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) =>
                  RepostRecordCreateOrConnectWithoutOriginalPostInput.fromJson(
                      e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput
                  .fromJson(e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput
                  .fromJson(e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpdateManyWithWhereWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              RepostRecordScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$RepostRecordUpdateManyWithoutOriginalPostNestedInputToJson(
        RepostRecordUpdateManyWithoutOriginalPostNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput
    _$RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              RepostRecordCreateWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) =>
                  RepostRecordCreateOrConnectWithoutOriginalPostInput.fromJson(
                      e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput
                  .fromJson(e as Map<String, dynamic>)),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              RepostRecordWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput
                  .fromJson(e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              RepostRecordUpdateManyWithWhereWithoutOriginalPostInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              RepostRecordScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic>
    _$RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInputToJson(
        RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

PostRecordCreateNestedOneWithoutRepostsInput
    _$PostRecordCreateNestedOneWithoutRepostsInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordCreateNestedOneWithoutRepostsInput(
          create: json['create'] == null
              ? null
              : PostRecordCreateWithoutRepostsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PostRecordCreateOrConnectWithoutRepostsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PostRecordWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordCreateNestedOneWithoutRepostsInputToJson(
    PostRecordCreateNestedOneWithoutRepostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

PostRecordUpdateOneRequiredWithoutRepostsNestedInput
    _$PostRecordUpdateOneRequiredWithoutRepostsNestedInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordUpdateOneRequiredWithoutRepostsNestedInput(
          create: json['create'] == null
              ? null
              : PostRecordCreateWithoutRepostsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PostRecordCreateOrConnectWithoutRepostsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : PostRecordUpsertWithoutRepostsInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PostRecordWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : PostRecordUpdateWithoutRepostsInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$PostRecordUpdateOneRequiredWithoutRepostsNestedInputToJson(
        PostRecordUpdateOneRequiredWithoutRepostsNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

NullableStringFieldUpdateOperationsInput
    _$NullableStringFieldUpdateOperationsInputFromJson(
            Map<String, dynamic> json) =>
        NullableStringFieldUpdateOperationsInput(
          set: json['set'] as String?,
        );

Map<String, dynamic> _$NullableStringFieldUpdateOperationsInputToJson(
    NullableStringFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  return val;
}

NestedBigIntFilter _$NestedBigIntFilterFromJson(Map<String, dynamic> json) =>
    NestedBigIntFilter(
      equals: json['equals'] == null
          ? null
          : BigInt.parse(json['equals'] as String),
      $in:
          (json['in'] as List<dynamic>?)?.map((e) => BigInt.parse(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => BigInt.parse(e as String)),
      lt: json['lt'] == null ? null : BigInt.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : BigInt.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : BigInt.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : BigInt.parse(json['gte'] as String),
      not: json['not'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedBigIntFilterToJson(NestedBigIntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals?.toString());
  writeNotNull('in', instance.$in?.map((e) => e.toString()).toList());
  writeNotNull('notIn', instance.notIn?.map((e) => e.toString()).toList());
  writeNotNull('lt', instance.lt?.toString());
  writeNotNull('lte', instance.lte?.toString());
  writeNotNull('gt', instance.gt?.toString());
  writeNotNull('gte', instance.gte?.toString());
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringFilter _$NestedStringFilterFromJson(Map<String, dynamic> json) =>
    NestedStringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringFilterToJson(NestedStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedIntFilter _$NestedIntFilterFromJson(Map<String, dynamic> json) =>
    NestedIntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntFilterToJson(NestedIntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedBigIntWithAggregatesFilter _$NestedBigIntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedBigIntWithAggregatesFilter(
      equals: json['equals'] == null
          ? null
          : BigInt.parse(json['equals'] as String),
      $in:
          (json['in'] as List<dynamic>?)?.map((e) => BigInt.parse(e as String)),
      notIn: (json['notIn'] as List<dynamic>?)
          ?.map((e) => BigInt.parse(e as String)),
      lt: json['lt'] == null ? null : BigInt.parse(json['lt'] as String),
      lte: json['lte'] == null ? null : BigInt.parse(json['lte'] as String),
      gt: json['gt'] == null ? null : BigInt.parse(json['gt'] as String),
      gte: json['gte'] == null ? null : BigInt.parse(json['gte'] as String),
      not: json['not'] == null
          ? null
          : NestedBigIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedBigIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedBigIntWithAggregatesFilterToJson(
    NestedBigIntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals?.toString());
  writeNotNull('in', instance.$in?.map((e) => e.toString()).toList());
  writeNotNull('notIn', instance.notIn?.map((e) => e.toString()).toList());
  writeNotNull('lt', instance.lt?.toString());
  writeNotNull('lte', instance.lte?.toString());
  writeNotNull('gt', instance.gt?.toString());
  writeNotNull('gte', instance.gte?.toString());
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedFloatFilter _$NestedFloatFilterFromJson(Map<String, dynamic> json) =>
    NestedFloatFilter(
      equals: (json['equals'] as num?)?.toDouble(),
      $in: (json['in'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      notIn:
          (json['notIn'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      lt: (json['lt'] as num?)?.toDouble(),
      lte: (json['lte'] as num?)?.toDouble(),
      gt: (json['gt'] as num?)?.toDouble(),
      gte: (json['gte'] as num?)?.toDouble(),
      not: json['not'] == null
          ? null
          : NestedFloatFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedFloatFilterToJson(NestedFloatFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringWithAggregatesFilter _$NestedStringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedStringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringWithAggregatesFilterToJson(
    NestedStringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedIntWithAggregatesFilter _$NestedIntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedIntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntWithAggregatesFilterToJson(
    NestedIntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedStringNullableFilter _$NestedStringNullableFilterFromJson(
        Map<String, dynamic> json) =>
    NestedStringNullableFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringNullableFilterToJson(
    NestedStringNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringNullableWithAggregatesFilter
    _$NestedStringNullableWithAggregatesFilterFromJson(
            Map<String, dynamic> json) =>
        NestedStringNullableWithAggregatesFilter(
          equals: json['equals'] as String?,
          $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
          notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
          lt: json['lt'] as String?,
          lte: json['lte'] as String?,
          gt: json['gt'] as String?,
          gte: json['gte'] as String?,
          contains: json['contains'] as String?,
          startsWith: json['startsWith'] as String?,
          endsWith: json['endsWith'] as String?,
          not: json['not'] == null
              ? null
              : NestedStringNullableWithAggregatesFilter.fromJson(
                  json['not'] as Map<String, dynamic>),
          $count: json['_count'] == null
              ? null
              : NestedIntNullableFilter.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : NestedStringNullableFilter.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : NestedStringNullableFilter.fromJson(
                  json['_max'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NestedStringNullableWithAggregatesFilterToJson(
    NestedStringNullableWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedIntNullableFilter _$NestedIntNullableFilterFromJson(
        Map<String, dynamic> json) =>
    NestedIntNullableFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntNullableFilterToJson(
    NestedIntNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

RepostRecordCreateWithoutOriginalPostInput
    _$RepostRecordCreateWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordCreateWithoutOriginalPostInput(
          id: BigInt.parse(json['id'] as String),
          hashId: json['hash_id'] as String,
        );

Map<String, dynamic> _$RepostRecordCreateWithoutOriginalPostInputToJson(
        RepostRecordCreateWithoutOriginalPostInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'hash_id': instance.hashId,
    };

RepostRecordUncheckedCreateWithoutOriginalPostInput
    _$RepostRecordUncheckedCreateWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUncheckedCreateWithoutOriginalPostInput(
          id: BigInt.parse(json['id'] as String),
          hashId: json['hash_id'] as String,
        );

Map<String, dynamic>
    _$RepostRecordUncheckedCreateWithoutOriginalPostInputToJson(
            RepostRecordUncheckedCreateWithoutOriginalPostInput instance) =>
        <String, dynamic>{
          'id': instance.id.toString(),
          'hash_id': instance.hashId,
        };

RepostRecordCreateOrConnectWithoutOriginalPostInput
    _$RepostRecordCreateOrConnectWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordCreateOrConnectWithoutOriginalPostInput(
          where: RepostRecordWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: RepostRecordCreateWithoutOriginalPostInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$RepostRecordCreateOrConnectWithoutOriginalPostInputToJson(
            RepostRecordCreateOrConnectWithoutOriginalPostInput instance) =>
        <String, dynamic>{
          'where': instance.where.toJson(),
          'create': instance.create.toJson(),
        };

RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput
    _$RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput(
          where: RepostRecordWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: RepostRecordUpdateWithoutOriginalPostInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: RepostRecordCreateWithoutOriginalPostInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInputToJson(
        RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput
    _$RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput(
          where: RepostRecordWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: RepostRecordUpdateWithoutOriginalPostInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInputToJson(
        RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

RepostRecordUpdateManyWithWhereWithoutOriginalPostInput
    _$RepostRecordUpdateManyWithWhereWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUpdateManyWithWhereWithoutOriginalPostInput(
          where: RepostRecordScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: RepostRecordUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$RepostRecordUpdateManyWithWhereWithoutOriginalPostInputToJson(
            RepostRecordUpdateManyWithWhereWithoutOriginalPostInput instance) =>
        <String, dynamic>{
          'where': instance.where.toJson(),
          'data': instance.data.toJson(),
        };

RepostRecordScalarWhereInput _$RepostRecordScalarWhereInputFromJson(
        Map<String, dynamic> json) =>
    RepostRecordScalarWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map((e) =>
          RepostRecordScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map((e) =>
          RepostRecordScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
          RepostRecordScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : BigIntFilter.fromJson(json['id'] as Map<String, dynamic>),
      hashId: json['hash_id'] == null
          ? null
          : StringFilter.fromJson(json['hash_id'] as Map<String, dynamic>),
      originalPostId: json['original_post_id'] == null
          ? null
          : BigIntFilter.fromJson(
              json['original_post_id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepostRecordScalarWhereInputToJson(
    RepostRecordScalarWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  writeNotNull('original_post_id', instance.originalPostId?.toJson());
  return val;
}

PostRecordCreateWithoutRepostsInput
    _$PostRecordCreateWithoutRepostsInputFromJson(Map<String, dynamic> json) =>
        PostRecordCreateWithoutRepostsInput(
          id: BigInt.parse(json['id'] as String),
          cid: json['cid'] as String,
          uri: json['uri'] as String,
          authorDid: json['author_did'] as String,
        );

Map<String, dynamic> _$PostRecordCreateWithoutRepostsInputToJson(
        PostRecordCreateWithoutRepostsInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
      'author_did': instance.authorDid,
    };

PostRecordUncheckedCreateWithoutRepostsInput
    _$PostRecordUncheckedCreateWithoutRepostsInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordUncheckedCreateWithoutRepostsInput(
          id: BigInt.parse(json['id'] as String),
          cid: json['cid'] as String,
          uri: json['uri'] as String,
          authorDid: json['author_did'] as String,
        );

Map<String, dynamic> _$PostRecordUncheckedCreateWithoutRepostsInputToJson(
        PostRecordUncheckedCreateWithoutRepostsInput instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
      'author_did': instance.authorDid,
    };

PostRecordCreateOrConnectWithoutRepostsInput
    _$PostRecordCreateOrConnectWithoutRepostsInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordCreateOrConnectWithoutRepostsInput(
          where: PostRecordWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: PostRecordCreateWithoutRepostsInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordCreateOrConnectWithoutRepostsInputToJson(
        PostRecordCreateOrConnectWithoutRepostsInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

PostRecordUpsertWithoutRepostsInput
    _$PostRecordUpsertWithoutRepostsInputFromJson(Map<String, dynamic> json) =>
        PostRecordUpsertWithoutRepostsInput(
          update: PostRecordUpdateWithoutRepostsInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: PostRecordCreateWithoutRepostsInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordUpsertWithoutRepostsInputToJson(
        PostRecordUpsertWithoutRepostsInput instance) =>
    <String, dynamic>{
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

PostRecordUpdateWithoutRepostsInput
    _$PostRecordUpdateWithoutRepostsInputFromJson(Map<String, dynamic> json) =>
        PostRecordUpdateWithoutRepostsInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['uri'] as Map<String, dynamic>),
          authorDid: json['author_did'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['author_did'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordUpdateWithoutRepostsInputToJson(
    PostRecordUpdateWithoutRepostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

PostRecordUncheckedUpdateWithoutRepostsInput
    _$PostRecordUncheckedUpdateWithoutRepostsInputFromJson(
            Map<String, dynamic> json) =>
        PostRecordUncheckedUpdateWithoutRepostsInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          cid: json['cid'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['cid'] as Map<String, dynamic>),
          uri: json['uri'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['uri'] as Map<String, dynamic>),
          authorDid: json['author_did'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['author_did'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostRecordUncheckedUpdateWithoutRepostsInputToJson(
    PostRecordUncheckedUpdateWithoutRepostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('cid', instance.cid?.toJson());
  writeNotNull('uri', instance.uri?.toJson());
  writeNotNull('author_did', instance.authorDid?.toJson());
  return val;
}

RepostRecordUpdateWithoutOriginalPostInput
    _$RepostRecordUpdateWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUpdateWithoutOriginalPostInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordUpdateWithoutOriginalPostInputToJson(
    RepostRecordUpdateWithoutOriginalPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  return val;
}

RepostRecordUncheckedUpdateWithoutOriginalPostInput
    _$RepostRecordUncheckedUpdateWithoutOriginalPostInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUncheckedUpdateWithoutOriginalPostInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$RepostRecordUncheckedUpdateWithoutOriginalPostInputToJson(
        RepostRecordUncheckedUpdateWithoutOriginalPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  return val;
}

RepostRecordUncheckedUpdateManyWithoutRepostsInput
    _$RepostRecordUncheckedUpdateManyWithoutRepostsInputFromJson(
            Map<String, dynamic> json) =>
        RepostRecordUncheckedUpdateManyWithoutRepostsInput(
          id: json['id'] == null
              ? null
              : BigIntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          hashId: json['hash_id'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['hash_id'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RepostRecordUncheckedUpdateManyWithoutRepostsInputToJson(
    RepostRecordUncheckedUpdateManyWithoutRepostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('hash_id', instance.hashId?.toJson());
  return val;
}

UserRecord _$UserRecordFromJson(Map<String, dynamic> json) => UserRecord(
      id: BigInt.parse(json['id'] as String),
      did: json['did'] as String,
      banner: json['banner'] as String,
      followersCount: json['followers_count'] as int,
      followsCount: json['follows_count'] as int,
      postsCount: json['posts_count'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$UserRecordToJson(UserRecord instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'did': instance.did,
      'banner': instance.banner,
      'followers_count': instance.followersCount,
      'follows_count': instance.followsCount,
      'posts_count': instance.postsCount,
      'description': instance.description,
    };

PostRecord _$PostRecordFromJson(Map<String, dynamic> json) => PostRecord(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String,
    );

Map<String, dynamic> _$PostRecordToJson(PostRecord instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
      'author_did': instance.authorDid,
    };

RepostRecord _$RepostRecordFromJson(Map<String, dynamic> json) => RepostRecord(
      id: BigInt.parse(json['id'] as String),
      hashId: json['hash_id'] as String,
      originalPostId: BigInt.parse(json['original_post_id'] as String),
    );

Map<String, dynamic> _$RepostRecordToJson(RepostRecord instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'hash_id': instance.hashId,
      'original_post_id': instance.originalPostId.toString(),
    };

NotificationRecord _$NotificationRecordFromJson(Map<String, dynamic> json) =>
    NotificationRecord(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
    );

Map<String, dynamic> _$NotificationRecordToJson(NotificationRecord instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'cid': instance.cid,
      'uri': instance.uri,
    };

MediaRecord _$MediaRecordFromJson(Map<String, dynamic> json) => MediaRecord(
      id: BigInt.parse(json['id'] as String),
      type: json['type'] as String,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
      link: json['link'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$MediaRecordToJson(MediaRecord instance) =>
    <String, dynamic>{
      'id': instance.id.toString(),
      'type': instance.type,
      'mime_type': instance.mimeType,
      'size': instance.size,
      'link': instance.link,
      'description': instance.description,
    };

FeedRecord _$FeedRecordFromJson(Map<String, dynamic> json) => FeedRecord(
      id: BigInt.parse(json['id'] as String),
      cid: json['cid'] as String,
      uri: json['uri'] as String,
      authorDid: json['author_did'] as String?,
    );

Map<String, dynamic> _$FeedRecordToJson(FeedRecord instance) {
  final val = <String, dynamic>{
    'id': instance.id.toString(),
    'cid': instance.cid,
    'uri': instance.uri,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author_did', instance.authorDid);
  return val;
}

SessionRecord _$SessionRecordFromJson(Map<String, dynamic> json) =>
    SessionRecord(
      id: json['id'] as int,
      did: json['did'] as String,
      session: json['session'] as String,
    );

Map<String, dynamic> _$SessionRecordToJson(SessionRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'did': instance.did,
      'session': instance.session,
    };

UserRecordGroupByOutputType _$UserRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    UserRecordGroupByOutputType(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      did: json['did'] as String?,
      banner: json['banner'] as String?,
      followersCount: json['followers_count'] as int?,
      followsCount: json['follows_count'] as int?,
      postsCount: json['posts_count'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserRecordGroupByOutputTypeToJson(
    UserRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('did', instance.did);
  writeNotNull('banner', instance.banner);
  writeNotNull('followers_count', instance.followersCount);
  writeNotNull('follows_count', instance.followsCount);
  writeNotNull('posts_count', instance.postsCount);
  writeNotNull('description', instance.description);
  return val;
}

PostRecordGroupByOutputType _$PostRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    PostRecordGroupByOutputType(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      cid: json['cid'] as String?,
      uri: json['uri'] as String?,
      authorDid: json['author_did'] as String?,
    );

Map<String, dynamic> _$PostRecordGroupByOutputTypeToJson(
    PostRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('cid', instance.cid);
  writeNotNull('uri', instance.uri);
  writeNotNull('author_did', instance.authorDid);
  return val;
}

RepostRecordGroupByOutputType _$RepostRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    RepostRecordGroupByOutputType(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      hashId: json['hash_id'] as String?,
      originalPostId: json['original_post_id'] == null
          ? null
          : BigInt.parse(json['original_post_id'] as String),
    );

Map<String, dynamic> _$RepostRecordGroupByOutputTypeToJson(
    RepostRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('hash_id', instance.hashId);
  writeNotNull('original_post_id', instance.originalPostId?.toString());
  return val;
}

NotificationRecordGroupByOutputType
    _$NotificationRecordGroupByOutputTypeFromJson(Map<String, dynamic> json) =>
        NotificationRecordGroupByOutputType(
          id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
          cid: json['cid'] as String?,
          uri: json['uri'] as String?,
        );

Map<String, dynamic> _$NotificationRecordGroupByOutputTypeToJson(
    NotificationRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('cid', instance.cid);
  writeNotNull('uri', instance.uri);
  return val;
}

MediaRecordGroupByOutputType _$MediaRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    MediaRecordGroupByOutputType(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      type: json['type'] as String?,
      mimeType: json['mime_type'] as String?,
      size: json['size'] as int?,
      link: json['link'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MediaRecordGroupByOutputTypeToJson(
    MediaRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('type', instance.type);
  writeNotNull('mime_type', instance.mimeType);
  writeNotNull('size', instance.size);
  writeNotNull('link', instance.link);
  writeNotNull('description', instance.description);
  return val;
}

FeedRecordGroupByOutputType _$FeedRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    FeedRecordGroupByOutputType(
      id: json['id'] == null ? null : BigInt.parse(json['id'] as String),
      cid: json['cid'] as String?,
      uri: json['uri'] as String?,
      authorDid: json['author_did'] as String?,
    );

Map<String, dynamic> _$FeedRecordGroupByOutputTypeToJson(
    FeedRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toString());
  writeNotNull('cid', instance.cid);
  writeNotNull('uri', instance.uri);
  writeNotNull('author_did', instance.authorDid);
  return val;
}

SessionRecordGroupByOutputType _$SessionRecordGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    SessionRecordGroupByOutputType(
      id: json['id'] as int?,
      did: json['did'] as String?,
      session: json['session'] as String?,
    );

Map<String, dynamic> _$SessionRecordGroupByOutputTypeToJson(
    SessionRecordGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('did', instance.did);
  writeNotNull('session', instance.session);
  return val;
}

AffectedRowsOutput _$AffectedRowsOutputFromJson(Map<String, dynamic> json) =>
    AffectedRowsOutput(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$AffectedRowsOutputToJson(AffectedRowsOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  return val;
}

Map<String, dynamic> _$DatasourcesToJson(Datasources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('db', instance.db);
  return val;
}
