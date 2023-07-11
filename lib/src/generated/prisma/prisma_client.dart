// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_annotation/json_annotation.dart';
import 'package:orm/binary_engine.dart' as _i5;
import 'package:orm/engine_core.dart' as _i3;
import 'package:orm/graphql.dart' as _i2;
import 'package:orm/logger.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm/orm.dart' show DateTimeJsonConverter;

part 'prisma_client.g.dart';

enum UserRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  did,
  banner,
  @JsonValue('followers_count')
  followersCount(r'followers_count'),
  @JsonValue('follows_count')
  followsCount(r'follows_count'),
  @JsonValue('posts_count')
  postsCount(r'posts_count'),
  description;

  const UserRecordScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum PostRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  cid,
  uri,
  @JsonValue('author_did')
  authorDid(r'author_did');

  const PostRecordScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum RepostRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  @JsonValue('hash_id')
  hashId(r'hash_id'),
  @JsonValue('original_post_id')
  originalPostId(r'original_post_id');

  const RepostRecordScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum NotificationRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  cid,
  uri;

  @override
  String? get originalName => null;
}

enum MediaRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  type,
  @JsonValue('mime_type')
  mimeType(r'mime_type'),
  size,
  link,
  description;

  const MediaRecordScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum FeedRecordScalarFieldEnum implements _i1.PrismaEnum {
  id,
  cid,
  uri,
  @JsonValue('author_did')
  authorDid(r'author_did');

  const FeedRecordScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum SortOrder implements _i1.PrismaEnum {
  asc,
  desc;

  @override
  String? get originalName => null;
}

enum NullsOrder implements _i1.PrismaEnum {
  first,
  last;

  @override
  String? get originalName => null;
}

@_i1.jsonSerializable
class UserRecordWhereInput implements _i1.JsonSerializable {
  const UserRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordWhereInputFromJson(json);

  final Iterable<UserRecordWhereInput>? AND;

  final Iterable<UserRecordWhereInput>? OR;

  final Iterable<UserRecordWhereInput>? NOT;

  final BigIntFilter? id;

  final StringFilter? did;

  final StringFilter? banner;

  @JsonKey(name: r'followers_count')
  final IntFilter? followersCount;

  @JsonKey(name: r'follows_count')
  final IntFilter? followsCount;

  @JsonKey(name: r'posts_count')
  final IntFilter? postsCount;

  final StringFilter? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordOrderByWithRelationInput implements _i1.JsonSerializable {
  const UserRecordOrderByWithRelationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? did;

  final SortOrder? banner;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordWhereUniqueInput implements _i1.JsonSerializable {
  const UserRecordWhereUniqueInput({
    this.id,
    this.did,
  });

  factory UserRecordWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  final String? did;

  @override
  Map<String, dynamic> toJson() => _$UserRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordOrderByWithAggregationInput implements _i1.JsonSerializable {
  const UserRecordOrderByWithAggregationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory UserRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? did;

  final SortOrder? banner;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  final SortOrder? description;

  @JsonKey(name: r'_count')
  final UserRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final UserRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final UserRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final UserRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final UserRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const UserRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<UserRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<UserRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<UserRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? did;

  final StringWithAggregatesFilter? banner;

  @JsonKey(name: r'followers_count')
  final IntWithAggregatesFilter? followersCount;

  @JsonKey(name: r'follows_count')
  final IntWithAggregatesFilter? followsCount;

  @JsonKey(name: r'posts_count')
  final IntWithAggregatesFilter? postsCount;

  final StringWithAggregatesFilter? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordWhereInput implements _i1.JsonSerializable {
  const PostRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  factory PostRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordWhereInputFromJson(json);

  final Iterable<PostRecordWhereInput>? AND;

  final Iterable<PostRecordWhereInput>? OR;

  final Iterable<PostRecordWhereInput>? NOT;

  final BigIntFilter? id;

  final StringFilter? cid;

  final StringFilter? uri;

  @JsonKey(name: r'author_did')
  final StringFilter? authorDid;

  final RepostRecordListRelationFilter? reposts;

  @override
  Map<String, dynamic> toJson() => _$PostRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordOrderByWithRelationInput implements _i1.JsonSerializable {
  const PostRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  factory PostRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  final RepostRecordOrderByRelationAggregateInput? reposts;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordWhereUniqueInput implements _i1.JsonSerializable {
  const PostRecordWhereUniqueInput({
    this.id,
    this.cid,
  });

  factory PostRecordWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  final String? cid;

  @override
  Map<String, dynamic> toJson() => _$PostRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordOrderByWithAggregationInput implements _i1.JsonSerializable {
  const PostRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory PostRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @JsonKey(name: r'_count')
  final PostRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final PostRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final PostRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final PostRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final PostRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const PostRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<PostRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<PostRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<PostRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? cid;

  final StringWithAggregatesFilter? uri;

  @JsonKey(name: r'author_did')
  final StringWithAggregatesFilter? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordWhereInput implements _i1.JsonSerializable {
  const RepostRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  factory RepostRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordWhereInputFromJson(json);

  final Iterable<RepostRecordWhereInput>? AND;

  final Iterable<RepostRecordWhereInput>? OR;

  final Iterable<RepostRecordWhereInput>? NOT;

  final BigIntFilter? id;

  @JsonKey(name: r'hash_id')
  final StringFilter? hashId;

  @JsonKey(name: r'original_post_id')
  final BigIntFilter? originalPostId;

  @JsonKey(name: r'original_post')
  final PostRecordRelationFilter? originalPost;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordOrderByWithRelationInput implements _i1.JsonSerializable {
  const RepostRecordOrderByWithRelationInput({
    this.id,
    this.hashId,
    this.originalPostId,
    this.originalPost,
  });

  factory RepostRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'hash_id')
  final SortOrder? hashId;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @JsonKey(name: r'original_post')
  final PostRecordOrderByWithRelationInput? originalPost;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordWhereUniqueInput implements _i1.JsonSerializable {
  const RepostRecordWhereUniqueInput({
    this.id,
    this.hashId,
  });

  factory RepostRecordWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  @JsonKey(name: r'hash_id')
  final String? hashId;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordOrderByWithAggregationInput implements _i1.JsonSerializable {
  const RepostRecordOrderByWithAggregationInput({
    this.id,
    this.hashId,
    this.originalPostId,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory RepostRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'hash_id')
  final SortOrder? hashId;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @JsonKey(name: r'_count')
  final RepostRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final RepostRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final RepostRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final RepostRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final RepostRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordScalarWhereWithAggregatesInput
    implements _i1.JsonSerializable {
  const RepostRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<RepostRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<RepostRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<RepostRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  @JsonKey(name: r'hash_id')
  final StringWithAggregatesFilter? hashId;

  @JsonKey(name: r'original_post_id')
  final BigIntWithAggregatesFilter? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordWhereInput implements _i1.JsonSerializable {
  const NotificationRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$NotificationRecordWhereInputFromJson(json);

  final Iterable<NotificationRecordWhereInput>? AND;

  final Iterable<NotificationRecordWhereInput>? OR;

  final Iterable<NotificationRecordWhereInput>? NOT;

  final BigIntFilter? id;

  final StringFilter? cid;

  final StringFilter? uri;

  @override
  Map<String, dynamic> toJson() => _$NotificationRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordOrderByWithRelationInput
    implements _i1.JsonSerializable {
  const NotificationRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordWhereUniqueInput implements _i1.JsonSerializable {
  const NotificationRecordWhereUniqueInput({this.id});

  factory NotificationRecordWhereUniqueInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordOrderByWithAggregationInput
    implements _i1.JsonSerializable {
  const NotificationRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory NotificationRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'_count')
  final NotificationRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final NotificationRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final NotificationRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final NotificationRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final NotificationRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordScalarWhereWithAggregatesInput
    implements _i1.JsonSerializable {
  const NotificationRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<NotificationRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<NotificationRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<NotificationRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? cid;

  final StringWithAggregatesFilter? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordWhereInput implements _i1.JsonSerializable {
  const MediaRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordWhereInputFromJson(json);

  final Iterable<MediaRecordWhereInput>? AND;

  final Iterable<MediaRecordWhereInput>? OR;

  final Iterable<MediaRecordWhereInput>? NOT;

  final BigIntFilter? id;

  final StringFilter? type;

  @JsonKey(name: r'mime_type')
  final StringFilter? mimeType;

  final IntFilter? size;

  final StringFilter? link;

  final StringFilter? description;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordOrderByWithRelationInput implements _i1.JsonSerializable {
  const MediaRecordOrderByWithRelationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? type;

  @JsonKey(name: r'mime_type')
  final SortOrder? mimeType;

  final SortOrder? size;

  final SortOrder? link;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordWhereUniqueInput implements _i1.JsonSerializable {
  const MediaRecordWhereUniqueInput({this.id});

  factory MediaRecordWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordOrderByWithAggregationInput implements _i1.JsonSerializable {
  const MediaRecordOrderByWithAggregationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory MediaRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? type;

  @JsonKey(name: r'mime_type')
  final SortOrder? mimeType;

  final SortOrder? size;

  final SortOrder? link;

  final SortOrder? description;

  @JsonKey(name: r'_count')
  final MediaRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final MediaRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final MediaRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final MediaRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final MediaRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordScalarWhereWithAggregatesInput
    implements _i1.JsonSerializable {
  const MediaRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<MediaRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<MediaRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<MediaRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? type;

  @JsonKey(name: r'mime_type')
  final StringWithAggregatesFilter? mimeType;

  final IntWithAggregatesFilter? size;

  final StringWithAggregatesFilter? link;

  final StringWithAggregatesFilter? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordWhereInput implements _i1.JsonSerializable {
  const FeedRecordWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordWhereInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordWhereInputFromJson(json);

  final Iterable<FeedRecordWhereInput>? AND;

  final Iterable<FeedRecordWhereInput>? OR;

  final Iterable<FeedRecordWhereInput>? NOT;

  final BigIntFilter? id;

  final StringFilter? cid;

  final StringFilter? uri;

  @JsonKey(name: r'author_did')
  final StringNullableFilter? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordWhereInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordOrderByWithRelationInput implements _i1.JsonSerializable {
  const FeedRecordOrderByWithRelationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordOrderByWithRelationInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordWhereUniqueInput implements _i1.JsonSerializable {
  const FeedRecordWhereUniqueInput({this.id});

  factory FeedRecordWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordWhereUniqueInputFromJson(json);

  final BigInt? id;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordOrderByWithAggregationInput implements _i1.JsonSerializable {
  const FeedRecordOrderByWithAggregationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory FeedRecordOrderByWithAggregationInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @JsonKey(name: r'_count')
  final FeedRecordCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final FeedRecordAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final FeedRecordMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final FeedRecordMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final FeedRecordSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const FeedRecordScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<FeedRecordScalarWhereWithAggregatesInput>? AND;

  final Iterable<FeedRecordScalarWhereWithAggregatesInput>? OR;

  final Iterable<FeedRecordScalarWhereWithAggregatesInput>? NOT;

  final BigIntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? cid;

  final StringWithAggregatesFilter? uri;

  @JsonKey(name: r'author_did')
  final StringNullableWithAggregatesFilter? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordCreateInput implements _i1.JsonSerializable {
  const UserRecordCreateInput({
    required this.id,
    required this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordCreateInputFromJson(json);

  final BigInt id;

  final String did;

  final String? banner;

  @JsonKey(name: r'followers_count')
  final int? followersCount;

  @JsonKey(name: r'follows_count')
  final int? followsCount;

  @JsonKey(name: r'posts_count')
  final int? postsCount;

  final String? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const UserRecordUncheckedCreateInput({
    required this.id,
    required this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  final String did;

  final String? banner;

  @JsonKey(name: r'followers_count')
  final int? followersCount;

  @JsonKey(name: r'follows_count')
  final int? followsCount;

  @JsonKey(name: r'posts_count')
  final int? postsCount;

  final String? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordUpdateInput implements _i1.JsonSerializable {
  const UserRecordUpdateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? did;

  final StringFieldUpdateOperationsInput? banner;

  @JsonKey(name: r'followers_count')
  final IntFieldUpdateOperationsInput? followersCount;

  @JsonKey(name: r'follows_count')
  final IntFieldUpdateOperationsInput? followsCount;

  @JsonKey(name: r'posts_count')
  final IntFieldUpdateOperationsInput? postsCount;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const UserRecordUncheckedUpdateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? did;

  final StringFieldUpdateOperationsInput? banner;

  @JsonKey(name: r'followers_count')
  final IntFieldUpdateOperationsInput? followersCount;

  @JsonKey(name: r'follows_count')
  final IntFieldUpdateOperationsInput? followsCount;

  @JsonKey(name: r'posts_count')
  final IntFieldUpdateOperationsInput? postsCount;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordUpdateManyMutationInput implements _i1.JsonSerializable {
  const UserRecordUpdateManyMutationInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? did;

  final StringFieldUpdateOperationsInput? banner;

  @JsonKey(name: r'followers_count')
  final IntFieldUpdateOperationsInput? followersCount;

  @JsonKey(name: r'follows_count')
  final IntFieldUpdateOperationsInput? followsCount;

  @JsonKey(name: r'posts_count')
  final IntFieldUpdateOperationsInput? postsCount;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const UserRecordUncheckedUpdateManyInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? did;

  final StringFieldUpdateOperationsInput? banner;

  @JsonKey(name: r'followers_count')
  final IntFieldUpdateOperationsInput? followersCount;

  @JsonKey(name: r'follows_count')
  final IntFieldUpdateOperationsInput? followsCount;

  @JsonKey(name: r'posts_count')
  final IntFieldUpdateOperationsInput? postsCount;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordCreateInput implements _i1.JsonSerializable {
  const PostRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
    this.reposts,
  });

  factory PostRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String authorDid;

  final RepostRecordCreateNestedManyWithoutOriginalPostInput? reposts;

  @override
  Map<String, dynamic> toJson() => _$PostRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const PostRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
    this.reposts,
  });

  factory PostRecordUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String authorDid;

  final RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput? reposts;

  @override
  Map<String, dynamic> toJson() => _$PostRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUpdateInput implements _i1.JsonSerializable {
  const PostRecordUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  factory PostRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  final RepostRecordUpdateManyWithoutOriginalPostNestedInput? reposts;

  @override
  Map<String, dynamic> toJson() => _$PostRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const PostRecordUncheckedUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
    this.reposts,
  });

  factory PostRecordUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$PostRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  final RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput? reposts;

  @override
  Map<String, dynamic> toJson() => _$PostRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUpdateManyMutationInput implements _i1.JsonSerializable {
  const PostRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const PostRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordCreateInput implements _i1.JsonSerializable {
  const RepostRecordCreateInput({
    required this.id,
    required this.hashId,
    required this.originalPost,
  });

  factory RepostRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordCreateInputFromJson(json);

  final BigInt id;

  @JsonKey(name: r'hash_id')
  final String hashId;

  @JsonKey(name: r'original_post')
  final PostRecordCreateNestedOneWithoutRepostsInput originalPost;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const RepostRecordUncheckedCreateInput({
    required this.id,
    required this.hashId,
    required this.originalPostId,
  });

  factory RepostRecordUncheckedCreateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  @JsonKey(name: r'hash_id')
  final String hashId;

  @JsonKey(name: r'original_post_id')
  final BigInt originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpdateInput implements _i1.JsonSerializable {
  const RepostRecordUpdateInput({
    this.id,
    this.hashId,
    this.originalPost,
  });

  factory RepostRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @JsonKey(name: r'original_post')
  final PostRecordUpdateOneRequiredWithoutRepostsNestedInput? originalPost;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const RepostRecordUncheckedUpdateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordUncheckedUpdateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @JsonKey(name: r'original_post_id')
  final BigIntFieldUpdateOperationsInput? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpdateManyMutationInput implements _i1.JsonSerializable {
  const RepostRecordUpdateManyMutationInput({
    this.id,
    this.hashId,
  });

  factory RepostRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const RepostRecordUncheckedUpdateManyInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @JsonKey(name: r'original_post_id')
  final BigIntFieldUpdateOperationsInput? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordCreateInput implements _i1.JsonSerializable {
  const NotificationRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
  });

  factory NotificationRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$NotificationRecordCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @override
  Map<String, dynamic> toJson() => _$NotificationRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const NotificationRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
  });

  factory NotificationRecordUncheckedCreateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordUpdateInput implements _i1.JsonSerializable {
  const NotificationRecordUpdateInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$NotificationRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @override
  Map<String, dynamic> toJson() => _$NotificationRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const NotificationRecordUncheckedUpdateInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordUncheckedUpdateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordUpdateManyMutationInput
    implements _i1.JsonSerializable {
  const NotificationRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordUncheckedUpdateManyInput
    implements _i1.JsonSerializable {
  const NotificationRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordCreateInput implements _i1.JsonSerializable {
  const MediaRecordCreateInput({
    required this.id,
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  factory MediaRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordCreateInputFromJson(json);

  final BigInt id;

  final String type;

  @JsonKey(name: r'mime_type')
  final String mimeType;

  final int size;

  final String link;

  final String description;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const MediaRecordUncheckedCreateInput({
    required this.id,
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  factory MediaRecordUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  final String type;

  @JsonKey(name: r'mime_type')
  final String mimeType;

  final int size;

  final String link;

  final String description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordUpdateInput implements _i1.JsonSerializable {
  const MediaRecordUpdateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? type;

  @JsonKey(name: r'mime_type')
  final StringFieldUpdateOperationsInput? mimeType;

  final IntFieldUpdateOperationsInput? size;

  final StringFieldUpdateOperationsInput? link;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const MediaRecordUncheckedUpdateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? type;

  @JsonKey(name: r'mime_type')
  final StringFieldUpdateOperationsInput? mimeType;

  final IntFieldUpdateOperationsInput? size;

  final StringFieldUpdateOperationsInput? link;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordUpdateManyMutationInput implements _i1.JsonSerializable {
  const MediaRecordUpdateManyMutationInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? type;

  @JsonKey(name: r'mime_type')
  final StringFieldUpdateOperationsInput? mimeType;

  final IntFieldUpdateOperationsInput? size;

  final StringFieldUpdateOperationsInput? link;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const MediaRecordUncheckedUpdateManyInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? type;

  @JsonKey(name: r'mime_type')
  final StringFieldUpdateOperationsInput? mimeType;

  final IntFieldUpdateOperationsInput? size;

  final StringFieldUpdateOperationsInput? link;

  final StringFieldUpdateOperationsInput? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordCreateInput implements _i1.JsonSerializable {
  const FeedRecordCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    this.authorDid,
  });

  factory FeedRecordCreateInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordCreateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordUncheckedCreateInput implements _i1.JsonSerializable {
  const FeedRecordUncheckedCreateInput({
    required this.id,
    required this.cid,
    required this.uri,
    this.authorDid,
  });

  factory FeedRecordUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordUncheckedCreateInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordUpdateInput implements _i1.JsonSerializable {
  const FeedRecordUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final NullableStringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordUpdateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordUncheckedUpdateInput implements _i1.JsonSerializable {
  const FeedRecordUncheckedUpdateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordUncheckedUpdateInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final NullableStringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordUpdateManyMutationInput implements _i1.JsonSerializable {
  const FeedRecordUpdateManyMutationInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordUpdateManyMutationInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordUpdateManyMutationInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final NullableStringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const FeedRecordUncheckedUpdateManyInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordUncheckedUpdateManyInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordUncheckedUpdateManyInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final NullableStringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class BigIntFilter implements _i1.JsonSerializable {
  const BigIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory BigIntFilter.fromJson(Map<String, dynamic> json) =>
      _$BigIntFilterFromJson(json);

  final BigInt? equals;

  @JsonKey(name: r'in')
  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final BigInt? lt;

  final BigInt? lte;

  final BigInt? gt;

  final BigInt? gte;

  final NestedBigIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$BigIntFilterToJson(this);
}

@_i1.jsonSerializable
class StringFilter implements _i1.JsonSerializable {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

@_i1.jsonSerializable
class IntFilter implements _i1.JsonSerializable {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory IntFilter.fromJson(Map<String, dynamic> json) =>
      _$IntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$IntFilterToJson(this);
}

@_i1.jsonSerializable
class UserRecordCountOrderByAggregateInput implements _i1.JsonSerializable {
  const UserRecordCountOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? did;

  final SortOrder? banner;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const UserRecordAvgOrderByAggregateInput({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  factory UserRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const UserRecordMaxOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? did;

  final SortOrder? banner;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordMinOrderByAggregateInput implements _i1.JsonSerializable {
  const UserRecordMinOrderByAggregateInput({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? did;

  final SortOrder? banner;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserRecordSumOrderByAggregateInput implements _i1.JsonSerializable {
  const UserRecordSumOrderByAggregateInput({
    this.id,
    this.followersCount,
    this.followsCount,
    this.postsCount,
  });

  factory UserRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'followers_count')
  final SortOrder? followersCount;

  @JsonKey(name: r'follows_count')
  final SortOrder? followsCount;

  @JsonKey(name: r'posts_count')
  final SortOrder? postsCount;

  @override
  Map<String, dynamic> toJson() =>
      _$UserRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class BigIntWithAggregatesFilter implements _i1.JsonSerializable {
  const BigIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory BigIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$BigIntWithAggregatesFilterFromJson(json);

  final BigInt? equals;

  @JsonKey(name: r'in')
  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final BigInt? lt;

  final BigInt? lte;

  final BigInt? gt;

  final BigInt? gte;

  final NestedBigIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedBigIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedBigIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedBigIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$BigIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringWithAggregatesFilter implements _i1.JsonSerializable {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$StringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$StringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class IntWithAggregatesFilter implements _i1.JsonSerializable {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory IntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$IntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$IntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class RepostRecordListRelationFilter implements _i1.JsonSerializable {
  const RepostRecordListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  factory RepostRecordListRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordListRelationFilterFromJson(json);

  final RepostRecordWhereInput? every;

  final RepostRecordWhereInput? some;

  final RepostRecordWhereInput? none;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordListRelationFilterToJson(this);
}

@_i1.jsonSerializable
class RepostRecordOrderByRelationAggregateInput
    implements _i1.JsonSerializable {
  const RepostRecordOrderByRelationAggregateInput({this.$count});

  factory RepostRecordOrderByRelationAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordOrderByRelationAggregateInputFromJson(json);

  @JsonKey(name: r'_count')
  final SortOrder? $count;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordOrderByRelationAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordCountOrderByAggregateInput implements _i1.JsonSerializable {
  const PostRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const PostRecordAvgOrderByAggregateInput({this.id});

  factory PostRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const PostRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordMinOrderByAggregateInput implements _i1.JsonSerializable {
  const PostRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordSumOrderByAggregateInput implements _i1.JsonSerializable {
  const PostRecordSumOrderByAggregateInput({this.id});

  factory PostRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordRelationFilter implements _i1.JsonSerializable {
  const PostRecordRelationFilter({
    this.$is,
    this.isNot,
  });

  factory PostRecordRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$PostRecordRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final PostRecordWhereInput? $is;

  final PostRecordWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$PostRecordRelationFilterToJson(this);
}

@_i1.jsonSerializable
class RepostRecordCountOrderByAggregateInput implements _i1.JsonSerializable {
  const RepostRecordCountOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'hash_id')
  final SortOrder? hashId;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const RepostRecordAvgOrderByAggregateInput({
    this.id,
    this.originalPostId,
  });

  factory RepostRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const RepostRecordMaxOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'hash_id')
  final SortOrder? hashId;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordMinOrderByAggregateInput implements _i1.JsonSerializable {
  const RepostRecordMinOrderByAggregateInput({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'hash_id')
  final SortOrder? hashId;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordSumOrderByAggregateInput implements _i1.JsonSerializable {
  const RepostRecordSumOrderByAggregateInput({
    this.id,
    this.originalPostId,
  });

  factory RepostRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'original_post_id')
  final SortOrder? originalPostId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordCountOrderByAggregateInput
    implements _i1.JsonSerializable {
  const NotificationRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordAvgOrderByAggregateInput
    implements _i1.JsonSerializable {
  const NotificationRecordAvgOrderByAggregateInput({this.id});

  factory NotificationRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordMaxOrderByAggregateInput
    implements _i1.JsonSerializable {
  const NotificationRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordMinOrderByAggregateInput
    implements _i1.JsonSerializable {
  const NotificationRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordSumOrderByAggregateInput
    implements _i1.JsonSerializable {
  const NotificationRecordSumOrderByAggregateInput({this.id});

  factory NotificationRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordCountOrderByAggregateInput implements _i1.JsonSerializable {
  const MediaRecordCountOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? type;

  @JsonKey(name: r'mime_type')
  final SortOrder? mimeType;

  final SortOrder? size;

  final SortOrder? link;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const MediaRecordAvgOrderByAggregateInput({
    this.id,
    this.size,
  });

  factory MediaRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? size;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const MediaRecordMaxOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? type;

  @JsonKey(name: r'mime_type')
  final SortOrder? mimeType;

  final SortOrder? size;

  final SortOrder? link;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordMinOrderByAggregateInput implements _i1.JsonSerializable {
  const MediaRecordMinOrderByAggregateInput({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? type;

  @JsonKey(name: r'mime_type')
  final SortOrder? mimeType;

  final SortOrder? size;

  final SortOrder? link;

  final SortOrder? description;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class MediaRecordSumOrderByAggregateInput implements _i1.JsonSerializable {
  const MediaRecordSumOrderByAggregateInput({
    this.id,
    this.size,
  });

  factory MediaRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$MediaRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? size;

  @override
  Map<String, dynamic> toJson() =>
      _$MediaRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class StringNullableFilter implements _i1.JsonSerializable {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory StringNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$StringNullableFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringNullableFilterToJson(this);
}

@_i1.jsonSerializable
class SortOrderInput implements _i1.JsonSerializable {
  const SortOrderInput({
    required this.sort,
    this.nulls,
  });

  factory SortOrderInput.fromJson(Map<String, dynamic> json) =>
      _$SortOrderInputFromJson(json);

  final SortOrder sort;

  final NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => _$SortOrderInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordCountOrderByAggregateInput implements _i1.JsonSerializable {
  const FeedRecordCountOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordCountOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const FeedRecordAvgOrderByAggregateInput({this.id});

  factory FeedRecordAvgOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const FeedRecordMaxOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordMaxOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordMinOrderByAggregateInput implements _i1.JsonSerializable {
  const FeedRecordMinOrderByAggregateInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordMinOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? cid;

  final SortOrder? uri;

  @JsonKey(name: r'author_did')
  final SortOrder? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class FeedRecordSumOrderByAggregateInput implements _i1.JsonSerializable {
  const FeedRecordSumOrderByAggregateInput({this.id});

  factory FeedRecordSumOrderByAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$FeedRecordSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() =>
      _$FeedRecordSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class StringNullableWithAggregatesFilter implements _i1.JsonSerializable {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringNullableWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$StringNullableWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntNullableFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringNullableFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$StringNullableWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class BigIntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const BigIntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory BigIntFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$BigIntFieldUpdateOperationsInputFromJson(json);

  final BigInt? set;

  final BigInt? increment;

  final BigInt? decrement;

  final BigInt? multiply;

  final BigInt? divide;

  @override
  Map<String, dynamic> toJson() =>
      _$BigIntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class StringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const StringFieldUpdateOperationsInput({this.set});

  factory StringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$StringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$StringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class IntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory IntFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$IntFieldUpdateOperationsInputFromJson(json);

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => _$IntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordCreateNestedManyWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordCreateNestedManyWithoutOriginalPostInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory RepostRecordCreateNestedManyWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordCreateNestedManyWithoutOriginalPostInputFromJson(json);

  final Iterable<RepostRecordCreateWithoutOriginalPostInput>? create;

  final Iterable<RepostRecordCreateOrConnectWithoutOriginalPostInput>?
      connectOrCreate;

  final Iterable<RepostRecordWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordCreateNestedManyWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInputFromJson(
          json);

  final Iterable<RepostRecordCreateWithoutOriginalPostInput>? create;

  final Iterable<RepostRecordCreateOrConnectWithoutOriginalPostInput>?
      connectOrCreate;

  final Iterable<RepostRecordWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedCreateNestedManyWithoutOriginalPostInputToJson(
          this);
}

@_i1.jsonSerializable
class RepostRecordUpdateManyWithoutOriginalPostNestedInput
    implements _i1.JsonSerializable {
  const RepostRecordUpdateManyWithoutOriginalPostNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory RepostRecordUpdateManyWithoutOriginalPostNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpdateManyWithoutOriginalPostNestedInputFromJson(json);

  final Iterable<RepostRecordCreateWithoutOriginalPostInput>? create;

  final Iterable<RepostRecordCreateOrConnectWithoutOriginalPostInput>?
      connectOrCreate;

  final Iterable<RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput>?
      upsert;

  final Iterable<RepostRecordWhereUniqueInput>? set;

  final Iterable<RepostRecordWhereUniqueInput>? disconnect;

  final Iterable<RepostRecordWhereUniqueInput>? delete;

  final Iterable<RepostRecordWhereUniqueInput>? connect;

  final Iterable<RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput>?
      update;

  final Iterable<RepostRecordUpdateManyWithWhereWithoutOriginalPostInput>?
      updateMany;

  final Iterable<RepostRecordScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpdateManyWithoutOriginalPostNestedInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput
    implements _i1.JsonSerializable {
  const RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInputFromJson(
          json);

  final Iterable<RepostRecordCreateWithoutOriginalPostInput>? create;

  final Iterable<RepostRecordCreateOrConnectWithoutOriginalPostInput>?
      connectOrCreate;

  final Iterable<RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput>?
      upsert;

  final Iterable<RepostRecordWhereUniqueInput>? set;

  final Iterable<RepostRecordWhereUniqueInput>? disconnect;

  final Iterable<RepostRecordWhereUniqueInput>? delete;

  final Iterable<RepostRecordWhereUniqueInput>? connect;

  final Iterable<RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput>?
      update;

  final Iterable<RepostRecordUpdateManyWithWhereWithoutOriginalPostInput>?
      updateMany;

  final Iterable<RepostRecordScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedUpdateManyWithoutOriginalPostNestedInputToJson(
          this);
}

@_i1.jsonSerializable
class PostRecordCreateNestedOneWithoutRepostsInput
    implements _i1.JsonSerializable {
  const PostRecordCreateNestedOneWithoutRepostsInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory PostRecordCreateNestedOneWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordCreateNestedOneWithoutRepostsInputFromJson(json);

  final PostRecordCreateWithoutRepostsInput? create;

  final PostRecordCreateOrConnectWithoutRepostsInput? connectOrCreate;

  final PostRecordWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordCreateNestedOneWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUpdateOneRequiredWithoutRepostsNestedInput
    implements _i1.JsonSerializable {
  const PostRecordUpdateOneRequiredWithoutRepostsNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  factory PostRecordUpdateOneRequiredWithoutRepostsNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUpdateOneRequiredWithoutRepostsNestedInputFromJson(json);

  final PostRecordCreateWithoutRepostsInput? create;

  final PostRecordCreateOrConnectWithoutRepostsInput? connectOrCreate;

  final PostRecordUpsertWithoutRepostsInput? upsert;

  final PostRecordWhereUniqueInput? connect;

  final PostRecordUpdateWithoutRepostsInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUpdateOneRequiredWithoutRepostsNestedInputToJson(this);
}

@_i1.jsonSerializable
class NullableStringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const NullableStringFieldUpdateOperationsInput({this.set});

  factory NullableStringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$NullableStringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$NullableStringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class NestedBigIntFilter implements _i1.JsonSerializable {
  const NestedBigIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedBigIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedBigIntFilterFromJson(json);

  final BigInt? equals;

  @JsonKey(name: r'in')
  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final BigInt? lt;

  final BigInt? lte;

  final BigInt? gt;

  final BigInt? gte;

  final NestedBigIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedBigIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringFilter implements _i1.JsonSerializable {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntFilter implements _i1.JsonSerializable {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedBigIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedBigIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedBigIntWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedBigIntWithAggregatesFilterFromJson(json);

  final BigInt? equals;

  @JsonKey(name: r'in')
  final Iterable<BigInt>? $in;

  final Iterable<BigInt>? notIn;

  final BigInt? lt;

  final BigInt? lte;

  final BigInt? gt;

  final BigInt? gte;

  final NestedBigIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedBigIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedBigIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedBigIntFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedBigIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedFloatFilter implements _i1.JsonSerializable {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedFloatFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedFloatFilterFromJson(json);

  final double? equals;

  @JsonKey(name: r'in')
  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final double? lt;

  final double? lte;

  final double? gt;

  final double? gte;

  final NestedFloatFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedFloatFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringNullableFilter implements _i1.JsonSerializable {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringNullableFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringNullableFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringNullableWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringNullableWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringNullableWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntNullableFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringNullableFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringNullableWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntNullableFilter implements _i1.JsonSerializable {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntNullableFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntNullableFilterToJson(this);
}

@_i1.jsonSerializable
class RepostRecordCreateWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordCreateWithoutOriginalPostInput({
    required this.id,
    required this.hashId,
  });

  factory RepostRecordCreateWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordCreateWithoutOriginalPostInputFromJson(json);

  final BigInt id;

  @JsonKey(name: r'hash_id')
  final String hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordCreateWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedCreateWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUncheckedCreateWithoutOriginalPostInput({
    required this.id,
    required this.hashId,
  });

  factory RepostRecordUncheckedCreateWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedCreateWithoutOriginalPostInputFromJson(json);

  final BigInt id;

  @JsonKey(name: r'hash_id')
  final String hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedCreateWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordCreateOrConnectWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordCreateOrConnectWithoutOriginalPostInput({
    required this.where,
    required this.create,
  });

  factory RepostRecordCreateOrConnectWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordCreateOrConnectWithoutOriginalPostInputFromJson(json);

  final RepostRecordWhereUniqueInput where;

  final RepostRecordCreateWithoutOriginalPostInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordCreateOrConnectWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput({
    required this.where,
    required this.update,
    required this.create,
  });

  factory RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInputFromJson(json);

  final RepostRecordWhereUniqueInput where;

  final RepostRecordUpdateWithoutOriginalPostInput update;

  final RepostRecordCreateWithoutOriginalPostInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpsertWithWhereUniqueWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput({
    required this.where,
    required this.data,
  });

  factory RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInputFromJson(json);

  final RepostRecordWhereUniqueInput where;

  final RepostRecordUpdateWithoutOriginalPostInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpdateWithWhereUniqueWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpdateManyWithWhereWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUpdateManyWithWhereWithoutOriginalPostInput({
    required this.where,
    required this.data,
  });

  factory RepostRecordUpdateManyWithWhereWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpdateManyWithWhereWithoutOriginalPostInputFromJson(json);

  final RepostRecordScalarWhereInput where;

  final RepostRecordUpdateManyMutationInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpdateManyWithWhereWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordScalarWhereInput implements _i1.JsonSerializable {
  const RepostRecordScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordScalarWhereInput.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordScalarWhereInputFromJson(json);

  final Iterable<RepostRecordScalarWhereInput>? AND;

  final Iterable<RepostRecordScalarWhereInput>? OR;

  final Iterable<RepostRecordScalarWhereInput>? NOT;

  final BigIntFilter? id;

  @JsonKey(name: r'hash_id')
  final StringFilter? hashId;

  @JsonKey(name: r'original_post_id')
  final BigIntFilter? originalPostId;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordScalarWhereInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordCreateWithoutRepostsInput implements _i1.JsonSerializable {
  const PostRecordCreateWithoutRepostsInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
  });

  factory PostRecordCreateWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordCreateWithoutRepostsInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordCreateWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUncheckedCreateWithoutRepostsInput
    implements _i1.JsonSerializable {
  const PostRecordUncheckedCreateWithoutRepostsInput({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
  });

  factory PostRecordUncheckedCreateWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUncheckedCreateWithoutRepostsInputFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUncheckedCreateWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordCreateOrConnectWithoutRepostsInput
    implements _i1.JsonSerializable {
  const PostRecordCreateOrConnectWithoutRepostsInput({
    required this.where,
    required this.create,
  });

  factory PostRecordCreateOrConnectWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordCreateOrConnectWithoutRepostsInputFromJson(json);

  final PostRecordWhereUniqueInput where;

  final PostRecordCreateWithoutRepostsInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordCreateOrConnectWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUpsertWithoutRepostsInput implements _i1.JsonSerializable {
  const PostRecordUpsertWithoutRepostsInput({
    required this.update,
    required this.create,
  });

  factory PostRecordUpsertWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUpsertWithoutRepostsInputFromJson(json);

  final PostRecordUpdateWithoutRepostsInput update;

  final PostRecordCreateWithoutRepostsInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUpsertWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUpdateWithoutRepostsInput implements _i1.JsonSerializable {
  const PostRecordUpdateWithoutRepostsInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordUpdateWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUpdateWithoutRepostsInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUpdateWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class PostRecordUncheckedUpdateWithoutRepostsInput
    implements _i1.JsonSerializable {
  const PostRecordUncheckedUpdateWithoutRepostsInput({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordUncheckedUpdateWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$PostRecordUncheckedUpdateWithoutRepostsInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? cid;

  final StringFieldUpdateOperationsInput? uri;

  @JsonKey(name: r'author_did')
  final StringFieldUpdateOperationsInput? authorDid;

  @override
  Map<String, dynamic> toJson() =>
      _$PostRecordUncheckedUpdateWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUpdateWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUpdateWithoutOriginalPostInput({
    this.id,
    this.hashId,
  });

  factory RepostRecordUpdateWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUpdateWithoutOriginalPostInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUpdateWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedUpdateWithoutOriginalPostInput
    implements _i1.JsonSerializable {
  const RepostRecordUncheckedUpdateWithoutOriginalPostInput({
    this.id,
    this.hashId,
  });

  factory RepostRecordUncheckedUpdateWithoutOriginalPostInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedUpdateWithoutOriginalPostInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedUpdateWithoutOriginalPostInputToJson(this);
}

@_i1.jsonSerializable
class RepostRecordUncheckedUpdateManyWithoutRepostsInput
    implements _i1.JsonSerializable {
  const RepostRecordUncheckedUpdateManyWithoutRepostsInput({
    this.id,
    this.hashId,
  });

  factory RepostRecordUncheckedUpdateManyWithoutRepostsInput.fromJson(
          Map<String, dynamic> json) =>
      _$RepostRecordUncheckedUpdateManyWithoutRepostsInputFromJson(json);

  final BigIntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'hash_id')
  final StringFieldUpdateOperationsInput? hashId;

  @override
  Map<String, dynamic> toJson() =>
      _$RepostRecordUncheckedUpdateManyWithoutRepostsInputToJson(this);
}

@_i1.jsonSerializable
class UserRecord implements _i1.JsonSerializable {
  const UserRecord({
    required this.id,
    required this.did,
    required this.banner,
    required this.followersCount,
    required this.followsCount,
    required this.postsCount,
    required this.description,
  });

  factory UserRecord.fromJson(Map<String, dynamic> json) =>
      _$UserRecordFromJson(json);

  final BigInt id;

  final String did;

  final String banner;

  @JsonKey(name: r'followers_count')
  final int followersCount;

  @JsonKey(name: r'follows_count')
  final int followsCount;

  @JsonKey(name: r'posts_count')
  final int postsCount;

  final String description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordToJson(this);
}

@_i1.jsonSerializable
class PostRecord implements _i1.JsonSerializable {
  const PostRecord({
    required this.id,
    required this.cid,
    required this.uri,
    required this.authorDid,
  });

  factory PostRecord.fromJson(Map<String, dynamic> json) =>
      _$PostRecordFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String authorDid;

  @override
  Map<String, dynamic> toJson() => _$PostRecordToJson(this);
}

@_i1.jsonSerializable
class RepostRecord implements _i1.JsonSerializable {
  const RepostRecord({
    required this.id,
    required this.hashId,
    required this.originalPostId,
  });

  factory RepostRecord.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordFromJson(json);

  final BigInt id;

  @JsonKey(name: r'hash_id')
  final String hashId;

  @JsonKey(name: r'original_post_id')
  final BigInt originalPostId;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordToJson(this);
}

@_i1.jsonSerializable
class NotificationRecord implements _i1.JsonSerializable {
  const NotificationRecord({
    required this.id,
    required this.cid,
    required this.uri,
  });

  factory NotificationRecord.fromJson(Map<String, dynamic> json) =>
      _$NotificationRecordFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @override
  Map<String, dynamic> toJson() => _$NotificationRecordToJson(this);
}

@_i1.jsonSerializable
class MediaRecord implements _i1.JsonSerializable {
  const MediaRecord({
    required this.id,
    required this.type,
    required this.mimeType,
    required this.size,
    required this.link,
    required this.description,
  });

  factory MediaRecord.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordFromJson(json);

  final BigInt id;

  final String type;

  @JsonKey(name: r'mime_type')
  final String mimeType;

  final int size;

  final String link;

  final String description;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordToJson(this);
}

@_i1.jsonSerializable
class FeedRecord implements _i1.JsonSerializable {
  const FeedRecord({
    required this.id,
    required this.cid,
    required this.uri,
    this.authorDid,
  });

  factory FeedRecord.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordFromJson(json);

  final BigInt id;

  final String cid;

  final String uri;

  @JsonKey(name: r'author_did')
  final String? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordToJson(this);
}

class UserRecordFluent<T> extends _i1.PrismaFluent<T> {
  const UserRecordFluent(
    super.original,
    super.$query,
  );
}

class PostRecordFluent<T> extends _i1.PrismaFluent<T> {
  const PostRecordFluent(
    super.original,
    super.$query,
  );

  Future<Iterable<RepostRecord>?> reposts({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithRelationInput>? orderBy,
    RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<RepostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'reposts',
          fields: fields,
          args: args,
        )
      ]),
      key: r'reposts',
    );
    final fields = RepostRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> reposts) =>
        reposts.map((Map reposts) => RepostRecord.fromJson(reposts.cast()));
    return query(fields)
        .then((json) => json is Iterable ? compiler(json.cast()) : null);
  }

  PostRecordCountOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return PostRecordCountOutputType(query);
  }
}

class RepostRecordFluent<T> extends _i1.PrismaFluent<T> {
  const RepostRecordFluent(
    super.original,
    super.$query,
  );

  PostRecordFluent<PostRecord> originalPost() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post',
          fields: fields,
        )
      ]),
      key: r'original_post',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: PostRecord)'));
    return PostRecordFluent<PostRecord>(
      future,
      query,
    );
  }
}

class NotificationRecordFluent<T> extends _i1.PrismaFluent<T> {
  const NotificationRecordFluent(
    super.original,
    super.$query,
  );
}

class MediaRecordFluent<T> extends _i1.PrismaFluent<T> {
  const MediaRecordFluent(
    super.original,
    super.$query,
  );
}

class FeedRecordFluent<T> extends _i1.PrismaFluent<T> {
  const FeedRecordFluent(
    super.original,
    super.$query,
  );
}

extension UserRecordModelDelegateExtension on _i1.ModelDelegate<UserRecord> {
  UserRecordFluent<UserRecord?> findUnique(
      {required UserRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return UserRecordFluent<UserRecord?>(
      future,
      query,
    );
  }

  UserRecordFluent<UserRecord> findUniqueOrThrow(
      {required UserRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUserRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUserRecordOrThrow',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: UserRecord)'));
    return UserRecordFluent<UserRecord>(
      future,
      query,
    );
  }

  UserRecordFluent<UserRecord?> findFirst({
    UserRecordWhereInput? where,
    Iterable<UserRecordOrderByWithRelationInput>? orderBy,
    UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return UserRecordFluent<UserRecord?>(
      future,
      query,
    );
  }

  UserRecordFluent<UserRecord> findFirstOrThrow({
    UserRecordWhereInput? where,
    Iterable<UserRecordOrderByWithRelationInput>? orderBy,
    UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUserRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUserRecordOrThrow',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: UserRecord)'));
    return UserRecordFluent<UserRecord>(
      future,
      query,
    );
  }

  Future<Iterable<UserRecord>> findMany({
    UserRecordWhereInput? where,
    Iterable<UserRecordOrderByWithRelationInput>? orderBy,
    UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyUserRecord',
    );
    final fields = UserRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyUserRecord) =>
        findManyUserRecord.map((Map findManyUserRecord) =>
            UserRecord.fromJson(findManyUserRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  UserRecordFluent<UserRecord> create({required UserRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: UserRecord)'));
    return UserRecordFluent<UserRecord>(
      future,
      query,
    );
  }

  UserRecordFluent<UserRecord?> update({
    required UserRecordUpdateInput data,
    required UserRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return UserRecordFluent<UserRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required UserRecordUpdateManyMutationInput data,
    UserRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyUserRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyUserRecord) =>
        AffectedRowsOutput.fromJson(updateManyUserRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  UserRecordFluent<UserRecord> upsert({
    required UserRecordWhereUniqueInput where,
    required UserRecordCreateInput create,
    required UserRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: UserRecord)'));
    return UserRecordFluent<UserRecord>(
      future,
      query,
    );
  }

  UserRecordFluent<UserRecord?> delete(
      {required UserRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneUserRecord',
    );
    final future = query(UserRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? UserRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return UserRecordFluent<UserRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({UserRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyUserRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyUserRecord) =>
        AffectedRowsOutput.fromJson(deleteManyUserRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateUserRecord aggregate({
    UserRecordWhereInput? where,
    Iterable<UserRecordOrderByWithRelationInput>? orderBy,
    UserRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateUserRecord',
    );
    return AggregateUserRecord(query);
  }

  Future<Iterable<UserRecordGroupByOutputType>> groupBy({
    UserRecordWhereInput? where,
    Iterable<UserRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<UserRecordScalarFieldEnum> by,
    UserRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByUserRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByUserRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByUserRecord) =>
        groupByUserRecord.map((Map groupByUserRecord) =>
            UserRecordGroupByOutputType.fromJson(groupByUserRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension PostRecordModelDelegateExtension on _i1.ModelDelegate<PostRecord> {
  PostRecordFluent<PostRecord?> findUnique(
      {required PostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniquePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniquePostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return PostRecordFluent<PostRecord?>(
      future,
      query,
    );
  }

  PostRecordFluent<PostRecord> findUniqueOrThrow(
      {required PostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniquePostRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniquePostRecordOrThrow',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: PostRecord)'));
    return PostRecordFluent<PostRecord>(
      future,
      query,
    );
  }

  PostRecordFluent<PostRecord?> findFirst({
    PostRecordWhereInput? where,
    Iterable<PostRecordOrderByWithRelationInput>? orderBy,
    PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstPostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstPostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return PostRecordFluent<PostRecord?>(
      future,
      query,
    );
  }

  PostRecordFluent<PostRecord> findFirstOrThrow({
    PostRecordWhereInput? where,
    Iterable<PostRecordOrderByWithRelationInput>? orderBy,
    PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstPostRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstPostRecordOrThrow',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: PostRecord)'));
    return PostRecordFluent<PostRecord>(
      future,
      query,
    );
  }

  Future<Iterable<PostRecord>> findMany({
    PostRecordWhereInput? where,
    Iterable<PostRecordOrderByWithRelationInput>? orderBy,
    PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<PostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyPostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyPostRecord',
    );
    final fields = PostRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyPostRecord) =>
        findManyPostRecord.map((Map findManyPostRecord) =>
            PostRecord.fromJson(findManyPostRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  PostRecordFluent<PostRecord> create({required PostRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOnePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOnePostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: PostRecord)'));
    return PostRecordFluent<PostRecord>(
      future,
      query,
    );
  }

  PostRecordFluent<PostRecord?> update({
    required PostRecordUpdateInput data,
    required PostRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOnePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOnePostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return PostRecordFluent<PostRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required PostRecordUpdateManyMutationInput data,
    PostRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyPostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyPostRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyPostRecord) =>
        AffectedRowsOutput.fromJson(updateManyPostRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  PostRecordFluent<PostRecord> upsert({
    required PostRecordWhereUniqueInput where,
    required PostRecordCreateInput create,
    required PostRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOnePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOnePostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: PostRecord)'));
    return PostRecordFluent<PostRecord>(
      future,
      query,
    );
  }

  PostRecordFluent<PostRecord?> delete(
      {required PostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOnePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOnePostRecord',
    );
    final future = query(PostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? PostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return PostRecordFluent<PostRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({PostRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyPostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyPostRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyPostRecord) =>
        AffectedRowsOutput.fromJson(deleteManyPostRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregatePostRecord aggregate({
    PostRecordWhereInput? where,
    Iterable<PostRecordOrderByWithRelationInput>? orderBy,
    PostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregatePostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregatePostRecord',
    );
    return AggregatePostRecord(query);
  }

  Future<Iterable<PostRecordGroupByOutputType>> groupBy({
    PostRecordWhereInput? where,
    Iterable<PostRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<PostRecordScalarFieldEnum> by,
    PostRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByPostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByPostRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByPostRecord) =>
        groupByPostRecord.map((Map groupByPostRecord) =>
            PostRecordGroupByOutputType.fromJson(groupByPostRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension RepostRecordModelDelegateExtension
    on _i1.ModelDelegate<RepostRecord> {
  RepostRecordFluent<RepostRecord?> findUnique(
      {required RepostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return RepostRecordFluent<RepostRecord?>(
      future,
      query,
    );
  }

  RepostRecordFluent<RepostRecord> findUniqueOrThrow(
      {required RepostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueRepostRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueRepostRecordOrThrow',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: RepostRecord)'));
    return RepostRecordFluent<RepostRecord>(
      future,
      query,
    );
  }

  RepostRecordFluent<RepostRecord?> findFirst({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithRelationInput>? orderBy,
    RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<RepostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return RepostRecordFluent<RepostRecord?>(
      future,
      query,
    );
  }

  RepostRecordFluent<RepostRecord> findFirstOrThrow({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithRelationInput>? orderBy,
    RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<RepostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstRepostRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstRepostRecordOrThrow',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: RepostRecord)'));
    return RepostRecordFluent<RepostRecord>(
      future,
      query,
    );
  }

  Future<Iterable<RepostRecord>> findMany({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithRelationInput>? orderBy,
    RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<RepostRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyRepostRecord',
    );
    final fields = RepostRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyRepostRecord) =>
        findManyRepostRecord.map((Map findManyRepostRecord) =>
            RepostRecord.fromJson(findManyRepostRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  RepostRecordFluent<RepostRecord> create(
      {required RepostRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: RepostRecord)'));
    return RepostRecordFluent<RepostRecord>(
      future,
      query,
    );
  }

  RepostRecordFluent<RepostRecord?> update({
    required RepostRecordUpdateInput data,
    required RepostRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return RepostRecordFluent<RepostRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required RepostRecordUpdateManyMutationInput data,
    RepostRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyRepostRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyRepostRecord) =>
        AffectedRowsOutput.fromJson(updateManyRepostRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  RepostRecordFluent<RepostRecord> upsert({
    required RepostRecordWhereUniqueInput where,
    required RepostRecordCreateInput create,
    required RepostRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: RepostRecord)'));
    return RepostRecordFluent<RepostRecord>(
      future,
      query,
    );
  }

  RepostRecordFluent<RepostRecord?> delete(
      {required RepostRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneRepostRecord',
    );
    final future = query(RepostRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? RepostRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return RepostRecordFluent<RepostRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({RepostRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyRepostRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyRepostRecord) =>
        AffectedRowsOutput.fromJson(deleteManyRepostRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateRepostRecord aggregate({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithRelationInput>? orderBy,
    RepostRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateRepostRecord',
    );
    return AggregateRepostRecord(query);
  }

  Future<Iterable<RepostRecordGroupByOutputType>> groupBy({
    RepostRecordWhereInput? where,
    Iterable<RepostRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<RepostRecordScalarFieldEnum> by,
    RepostRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByRepostRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByRepostRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByRepostRecord) =>
        groupByRepostRecord.map((Map groupByRepostRecord) =>
            RepostRecordGroupByOutputType.fromJson(groupByRepostRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension NotificationRecordModelDelegateExtension
    on _i1.ModelDelegate<NotificationRecord> {
  NotificationRecordFluent<NotificationRecord?> findUnique(
      {required NotificationRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueNotificationRecord',
    );
    final future =
        query(NotificationRecordScalarFieldEnum.values.toGraphQLFields()).then(
            (json) => json is Map
                ? NotificationRecord.fromJson(json.cast<String, dynamic>())
                : null);
    return NotificationRecordFluent<NotificationRecord?>(
      future,
      query,
    );
  }

  NotificationRecordFluent<NotificationRecord> findUniqueOrThrow(
      {required NotificationRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueNotificationRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueNotificationRecordOrThrow',
    );
    final future = query(
            NotificationRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? NotificationRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: NotificationRecord)'));
    return NotificationRecordFluent<NotificationRecord>(
      future,
      query,
    );
  }

  NotificationRecordFluent<NotificationRecord?> findFirst({
    NotificationRecordWhereInput? where,
    Iterable<NotificationRecordOrderByWithRelationInput>? orderBy,
    NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<NotificationRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstNotificationRecord',
    );
    final future =
        query(NotificationRecordScalarFieldEnum.values.toGraphQLFields()).then(
            (json) => json is Map
                ? NotificationRecord.fromJson(json.cast<String, dynamic>())
                : null);
    return NotificationRecordFluent<NotificationRecord?>(
      future,
      query,
    );
  }

  NotificationRecordFluent<NotificationRecord> findFirstOrThrow({
    NotificationRecordWhereInput? where,
    Iterable<NotificationRecordOrderByWithRelationInput>? orderBy,
    NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<NotificationRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstNotificationRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstNotificationRecordOrThrow',
    );
    final future = query(
            NotificationRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? NotificationRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: NotificationRecord)'));
    return NotificationRecordFluent<NotificationRecord>(
      future,
      query,
    );
  }

  Future<Iterable<NotificationRecord>> findMany({
    NotificationRecordWhereInput? where,
    Iterable<NotificationRecordOrderByWithRelationInput>? orderBy,
    NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<NotificationRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyNotificationRecord',
    );
    final fields = NotificationRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyNotificationRecord) =>
        findManyNotificationRecord.map((Map findManyNotificationRecord) =>
            NotificationRecord.fromJson(findManyNotificationRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  NotificationRecordFluent<NotificationRecord> create(
      {required NotificationRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneNotificationRecord',
    );
    final future = query(
            NotificationRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? NotificationRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: NotificationRecord)'));
    return NotificationRecordFluent<NotificationRecord>(
      future,
      query,
    );
  }

  NotificationRecordFluent<NotificationRecord?> update({
    required NotificationRecordUpdateInput data,
    required NotificationRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneNotificationRecord',
    );
    final future =
        query(NotificationRecordScalarFieldEnum.values.toGraphQLFields()).then(
            (json) => json is Map
                ? NotificationRecord.fromJson(json.cast<String, dynamic>())
                : null);
    return NotificationRecordFluent<NotificationRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required NotificationRecordUpdateManyMutationInput data,
    NotificationRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyNotificationRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyNotificationRecord) =>
        AffectedRowsOutput.fromJson(updateManyNotificationRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  NotificationRecordFluent<NotificationRecord> upsert({
    required NotificationRecordWhereUniqueInput where,
    required NotificationRecordCreateInput create,
    required NotificationRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneNotificationRecord',
    );
    final future = query(
            NotificationRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? NotificationRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: NotificationRecord)'));
    return NotificationRecordFluent<NotificationRecord>(
      future,
      query,
    );
  }

  NotificationRecordFluent<NotificationRecord?> delete(
      {required NotificationRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneNotificationRecord',
    );
    final future =
        query(NotificationRecordScalarFieldEnum.values.toGraphQLFields()).then(
            (json) => json is Map
                ? NotificationRecord.fromJson(json.cast<String, dynamic>())
                : null);
    return NotificationRecordFluent<NotificationRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({NotificationRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyNotificationRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyNotificationRecord) =>
        AffectedRowsOutput.fromJson(deleteManyNotificationRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateNotificationRecord aggregate({
    NotificationRecordWhereInput? where,
    Iterable<NotificationRecordOrderByWithRelationInput>? orderBy,
    NotificationRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateNotificationRecord',
    );
    return AggregateNotificationRecord(query);
  }

  Future<Iterable<NotificationRecordGroupByOutputType>> groupBy({
    NotificationRecordWhereInput? where,
    Iterable<NotificationRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<NotificationRecordScalarFieldEnum> by,
    NotificationRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByNotificationRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByNotificationRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByNotificationRecord) =>
        groupByNotificationRecord.map((Map groupByNotificationRecord) =>
            NotificationRecordGroupByOutputType.fromJson(
                groupByNotificationRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension MediaRecordModelDelegateExtension on _i1.ModelDelegate<MediaRecord> {
  MediaRecordFluent<MediaRecord?> findUnique(
      {required MediaRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return MediaRecordFluent<MediaRecord?>(
      future,
      query,
    );
  }

  MediaRecordFluent<MediaRecord> findUniqueOrThrow(
      {required MediaRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueMediaRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueMediaRecordOrThrow',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: MediaRecord)'));
    return MediaRecordFluent<MediaRecord>(
      future,
      query,
    );
  }

  MediaRecordFluent<MediaRecord?> findFirst({
    MediaRecordWhereInput? where,
    Iterable<MediaRecordOrderByWithRelationInput>? orderBy,
    MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<MediaRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return MediaRecordFluent<MediaRecord?>(
      future,
      query,
    );
  }

  MediaRecordFluent<MediaRecord> findFirstOrThrow({
    MediaRecordWhereInput? where,
    Iterable<MediaRecordOrderByWithRelationInput>? orderBy,
    MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<MediaRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstMediaRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstMediaRecordOrThrow',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: MediaRecord)'));
    return MediaRecordFluent<MediaRecord>(
      future,
      query,
    );
  }

  Future<Iterable<MediaRecord>> findMany({
    MediaRecordWhereInput? where,
    Iterable<MediaRecordOrderByWithRelationInput>? orderBy,
    MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<MediaRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyMediaRecord',
    );
    final fields = MediaRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyMediaRecord) =>
        findManyMediaRecord.map((Map findManyMediaRecord) =>
            MediaRecord.fromJson(findManyMediaRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  MediaRecordFluent<MediaRecord> create(
      {required MediaRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: MediaRecord)'));
    return MediaRecordFluent<MediaRecord>(
      future,
      query,
    );
  }

  MediaRecordFluent<MediaRecord?> update({
    required MediaRecordUpdateInput data,
    required MediaRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return MediaRecordFluent<MediaRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required MediaRecordUpdateManyMutationInput data,
    MediaRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyMediaRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyMediaRecord) =>
        AffectedRowsOutput.fromJson(updateManyMediaRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  MediaRecordFluent<MediaRecord> upsert({
    required MediaRecordWhereUniqueInput where,
    required MediaRecordCreateInput create,
    required MediaRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: MediaRecord)'));
    return MediaRecordFluent<MediaRecord>(
      future,
      query,
    );
  }

  MediaRecordFluent<MediaRecord?> delete(
      {required MediaRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneMediaRecord',
    );
    final future = query(MediaRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? MediaRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return MediaRecordFluent<MediaRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({MediaRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyMediaRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyMediaRecord) =>
        AffectedRowsOutput.fromJson(deleteManyMediaRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateMediaRecord aggregate({
    MediaRecordWhereInput? where,
    Iterable<MediaRecordOrderByWithRelationInput>? orderBy,
    MediaRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateMediaRecord',
    );
    return AggregateMediaRecord(query);
  }

  Future<Iterable<MediaRecordGroupByOutputType>> groupBy({
    MediaRecordWhereInput? where,
    Iterable<MediaRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<MediaRecordScalarFieldEnum> by,
    MediaRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByMediaRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByMediaRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByMediaRecord) =>
        groupByMediaRecord.map((Map groupByMediaRecord) =>
            MediaRecordGroupByOutputType.fromJson(groupByMediaRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension FeedRecordModelDelegateExtension on _i1.ModelDelegate<FeedRecord> {
  FeedRecordFluent<FeedRecord?> findUnique(
      {required FeedRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return FeedRecordFluent<FeedRecord?>(
      future,
      query,
    );
  }

  FeedRecordFluent<FeedRecord> findUniqueOrThrow(
      {required FeedRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueFeedRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueFeedRecordOrThrow',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: FeedRecord)'));
    return FeedRecordFluent<FeedRecord>(
      future,
      query,
    );
  }

  FeedRecordFluent<FeedRecord?> findFirst({
    FeedRecordWhereInput? where,
    Iterable<FeedRecordOrderByWithRelationInput>? orderBy,
    FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<FeedRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return FeedRecordFluent<FeedRecord?>(
      future,
      query,
    );
  }

  FeedRecordFluent<FeedRecord> findFirstOrThrow({
    FeedRecordWhereInput? where,
    Iterable<FeedRecordOrderByWithRelationInput>? orderBy,
    FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<FeedRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstFeedRecordOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstFeedRecordOrThrow',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: FeedRecord)'));
    return FeedRecordFluent<FeedRecord>(
      future,
      query,
    );
  }

  Future<Iterable<FeedRecord>> findMany({
    FeedRecordWhereInput? where,
    Iterable<FeedRecordOrderByWithRelationInput>? orderBy,
    FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<FeedRecordScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyFeedRecord',
    );
    final fields = FeedRecordScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyFeedRecord) =>
        findManyFeedRecord.map((Map findManyFeedRecord) =>
            FeedRecord.fromJson(findManyFeedRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  FeedRecordFluent<FeedRecord> create({required FeedRecordCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: FeedRecord)'));
    return FeedRecordFluent<FeedRecord>(
      future,
      query,
    );
  }

  FeedRecordFluent<FeedRecord?> update({
    required FeedRecordUpdateInput data,
    required FeedRecordWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return FeedRecordFluent<FeedRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required FeedRecordUpdateManyMutationInput data,
    FeedRecordWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyFeedRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyFeedRecord) =>
        AffectedRowsOutput.fromJson(updateManyFeedRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  FeedRecordFluent<FeedRecord> upsert({
    required FeedRecordWhereUniqueInput where,
    required FeedRecordCreateInput create,
    required FeedRecordUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: FeedRecord)'));
    return FeedRecordFluent<FeedRecord>(
      future,
      query,
    );
  }

  FeedRecordFluent<FeedRecord?> delete(
      {required FeedRecordWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneFeedRecord',
    );
    final future = query(FeedRecordScalarFieldEnum.values.toGraphQLFields())
        .then((json) => json is Map
            ? FeedRecord.fromJson(json.cast<String, dynamic>())
            : null);
    return FeedRecordFluent<FeedRecord?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({FeedRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyFeedRecord',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyFeedRecord) =>
        AffectedRowsOutput.fromJson(deleteManyFeedRecord.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateFeedRecord aggregate({
    FeedRecordWhereInput? where,
    Iterable<FeedRecordOrderByWithRelationInput>? orderBy,
    FeedRecordWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateFeedRecord',
    );
    return AggregateFeedRecord(query);
  }

  Future<Iterable<FeedRecordGroupByOutputType>> groupBy({
    FeedRecordWhereInput? where,
    Iterable<FeedRecordOrderByWithAggregationInput>? orderBy,
    required Iterable<FeedRecordScalarFieldEnum> by,
    FeedRecordScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByFeedRecord',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByFeedRecord',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByFeedRecord) =>
        groupByFeedRecord.map((Map groupByFeedRecord) =>
            FeedRecordGroupByOutputType.fromJson(groupByFeedRecord.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

@_i1.jsonSerializable
class UserRecordGroupByOutputType implements _i1.JsonSerializable {
  const UserRecordGroupByOutputType({
    this.id,
    this.did,
    this.banner,
    this.followersCount,
    this.followsCount,
    this.postsCount,
    this.description,
  });

  factory UserRecordGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$UserRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  final String? did;

  final String? banner;

  @JsonKey(name: r'followers_count')
  final int? followersCount;

  @JsonKey(name: r'follows_count')
  final int? followsCount;

  @JsonKey(name: r'posts_count')
  final int? postsCount;

  final String? description;

  @override
  Map<String, dynamic> toJson() => _$UserRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class PostRecordGroupByOutputType implements _i1.JsonSerializable {
  const PostRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory PostRecordGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$PostRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  final String? cid;

  final String? uri;

  @JsonKey(name: r'author_did')
  final String? authorDid;

  @override
  Map<String, dynamic> toJson() => _$PostRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class RepostRecordGroupByOutputType implements _i1.JsonSerializable {
  const RepostRecordGroupByOutputType({
    this.id,
    this.hashId,
    this.originalPostId,
  });

  factory RepostRecordGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$RepostRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  @JsonKey(name: r'hash_id')
  final String? hashId;

  @JsonKey(name: r'original_post_id')
  final BigInt? originalPostId;

  @override
  Map<String, dynamic> toJson() => _$RepostRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class NotificationRecordGroupByOutputType implements _i1.JsonSerializable {
  const NotificationRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
  });

  factory NotificationRecordGroupByOutputType.fromJson(
          Map<String, dynamic> json) =>
      _$NotificationRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  final String? cid;

  final String? uri;

  @override
  Map<String, dynamic> toJson() =>
      _$NotificationRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class MediaRecordGroupByOutputType implements _i1.JsonSerializable {
  const MediaRecordGroupByOutputType({
    this.id,
    this.type,
    this.mimeType,
    this.size,
    this.link,
    this.description,
  });

  factory MediaRecordGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  final String? type;

  @JsonKey(name: r'mime_type')
  final String? mimeType;

  final int? size;

  final String? link;

  final String? description;

  @override
  Map<String, dynamic> toJson() => _$MediaRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class FeedRecordGroupByOutputType implements _i1.JsonSerializable {
  const FeedRecordGroupByOutputType({
    this.id,
    this.cid,
    this.uri,
    this.authorDid,
  });

  factory FeedRecordGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$FeedRecordGroupByOutputTypeFromJson(json);

  final BigInt? id;

  final String? cid;

  final String? uri;

  @JsonKey(name: r'author_did')
  final String? authorDid;

  @override
  Map<String, dynamic> toJson() => _$FeedRecordGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AffectedRowsOutput implements _i1.JsonSerializable {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map<String, dynamic> json) =>
      _$AffectedRowsOutputFromJson(json);

  final int? count;

  @override
  Map<String, dynamic> toJson() => _$AffectedRowsOutputToJson(this);
}

class AggregateUserRecord {
  const AggregateUserRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  UserRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return UserRecordCountAggregateOutputType(query);
  }

  UserRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return UserRecordAvgAggregateOutputType(query);
  }

  UserRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return UserRecordSumAggregateOutputType(query);
  }

  UserRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return UserRecordMinAggregateOutputType(query);
  }

  UserRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return UserRecordMaxAggregateOutputType(query);
  }
}

class AggregatePostRecord {
  const AggregatePostRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  PostRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return PostRecordCountAggregateOutputType(query);
  }

  PostRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return PostRecordAvgAggregateOutputType(query);
  }

  PostRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return PostRecordSumAggregateOutputType(query);
  }

  PostRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return PostRecordMinAggregateOutputType(query);
  }

  PostRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return PostRecordMaxAggregateOutputType(query);
  }
}

class AggregateRepostRecord {
  const AggregateRepostRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  RepostRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return RepostRecordCountAggregateOutputType(query);
  }

  RepostRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return RepostRecordAvgAggregateOutputType(query);
  }

  RepostRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return RepostRecordSumAggregateOutputType(query);
  }

  RepostRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return RepostRecordMinAggregateOutputType(query);
  }

  RepostRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return RepostRecordMaxAggregateOutputType(query);
  }
}

class AggregateNotificationRecord {
  const AggregateNotificationRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  NotificationRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return NotificationRecordCountAggregateOutputType(query);
  }

  NotificationRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return NotificationRecordAvgAggregateOutputType(query);
  }

  NotificationRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return NotificationRecordSumAggregateOutputType(query);
  }

  NotificationRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return NotificationRecordMinAggregateOutputType(query);
  }

  NotificationRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return NotificationRecordMaxAggregateOutputType(query);
  }
}

class AggregateMediaRecord {
  const AggregateMediaRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  MediaRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return MediaRecordCountAggregateOutputType(query);
  }

  MediaRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return MediaRecordAvgAggregateOutputType(query);
  }

  MediaRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return MediaRecordSumAggregateOutputType(query);
  }

  MediaRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return MediaRecordMinAggregateOutputType(query);
  }

  MediaRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return MediaRecordMaxAggregateOutputType(query);
  }
}

class AggregateFeedRecord {
  const AggregateFeedRecord(this.$query);

  final _i1.PrismaFluentQuery $query;

  FeedRecordCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return FeedRecordCountAggregateOutputType(query);
  }

  FeedRecordAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return FeedRecordAvgAggregateOutputType(query);
  }

  FeedRecordSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return FeedRecordSumAggregateOutputType(query);
  }

  FeedRecordMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return FeedRecordMinAggregateOutputType(query);
  }

  FeedRecordMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return FeedRecordMaxAggregateOutputType(query);
  }
}

class UserRecordCountAggregateOutputType {
  const UserRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> did() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'did',
          fields: fields,
        )
      ]),
      key: r'did',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> banner() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'banner',
          fields: fields,
        )
      ]),
      key: r'banner',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> followersCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'followers_count',
          fields: fields,
        )
      ]),
      key: r'followers_count',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> followsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'follows_count',
          fields: fields,
        )
      ]),
      key: r'follows_count',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> postsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'posts_count',
          fields: fields,
        )
      ]),
      key: r'posts_count',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class UserRecordAvgAggregateOutputType {
  const UserRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> followersCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'followers_count',
          fields: fields,
        )
      ]),
      key: r'followers_count',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> followsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'follows_count',
          fields: fields,
        )
      ]),
      key: r'follows_count',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> postsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'posts_count',
          fields: fields,
        )
      ]),
      key: r'posts_count',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class UserRecordSumAggregateOutputType {
  const UserRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<int?> followersCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'followers_count',
          fields: fields,
        )
      ]),
      key: r'followers_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> followsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'follows_count',
          fields: fields,
        )
      ]),
      key: r'follows_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> postsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'posts_count',
          fields: fields,
        )
      ]),
      key: r'posts_count',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class UserRecordMinAggregateOutputType {
  const UserRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> did() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'did',
          fields: fields,
        )
      ]),
      key: r'did',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> banner() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'banner',
          fields: fields,
        )
      ]),
      key: r'banner',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> followersCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'followers_count',
          fields: fields,
        )
      ]),
      key: r'followers_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> followsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'follows_count',
          fields: fields,
        )
      ]),
      key: r'follows_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> postsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'posts_count',
          fields: fields,
        )
      ]),
      key: r'posts_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class UserRecordMaxAggregateOutputType {
  const UserRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> did() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'did',
          fields: fields,
        )
      ]),
      key: r'did',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> banner() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'banner',
          fields: fields,
        )
      ]),
      key: r'banner',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> followersCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'followers_count',
          fields: fields,
        )
      ]),
      key: r'followers_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> followsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'follows_count',
          fields: fields,
        )
      ]),
      key: r'follows_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> postsCount() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'posts_count',
          fields: fields,
        )
      ]),
      key: r'posts_count',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class PostRecordCountOutputType {
  const PostRecordCountOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> reposts({RepostRecordWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'reposts',
          fields: fields,
          args: args,
        )
      ]),
      key: r'reposts',
    );
    return query(const []).then((value) => (value as int));
  }
}

class PostRecordCountAggregateOutputType {
  const PostRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class PostRecordAvgAggregateOutputType {
  const PostRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class PostRecordSumAggregateOutputType {
  const PostRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class PostRecordMinAggregateOutputType {
  const PostRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class PostRecordMaxAggregateOutputType {
  const PostRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class RepostRecordCountAggregateOutputType {
  const RepostRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> hashId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'hash_id',
          fields: fields,
        )
      ]),
      key: r'hash_id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> originalPostId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post_id',
          fields: fields,
        )
      ]),
      key: r'original_post_id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class RepostRecordAvgAggregateOutputType {
  const RepostRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> originalPostId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post_id',
          fields: fields,
        )
      ]),
      key: r'original_post_id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class RepostRecordSumAggregateOutputType {
  const RepostRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<BigInt?> originalPostId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post_id',
          fields: fields,
        )
      ]),
      key: r'original_post_id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class RepostRecordMinAggregateOutputType {
  const RepostRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> hashId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'hash_id',
          fields: fields,
        )
      ]),
      key: r'hash_id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<BigInt?> originalPostId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post_id',
          fields: fields,
        )
      ]),
      key: r'original_post_id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class RepostRecordMaxAggregateOutputType {
  const RepostRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> hashId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'hash_id',
          fields: fields,
        )
      ]),
      key: r'hash_id',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<BigInt?> originalPostId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'original_post_id',
          fields: fields,
        )
      ]),
      key: r'original_post_id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class NotificationRecordCountAggregateOutputType {
  const NotificationRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class NotificationRecordAvgAggregateOutputType {
  const NotificationRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class NotificationRecordSumAggregateOutputType {
  const NotificationRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class NotificationRecordMinAggregateOutputType {
  const NotificationRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class NotificationRecordMaxAggregateOutputType {
  const NotificationRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class MediaRecordCountAggregateOutputType {
  const MediaRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> type() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'type',
          fields: fields,
        )
      ]),
      key: r'type',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> mimeType() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'mime_type',
          fields: fields,
        )
      ]),
      key: r'mime_type',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> size() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'size',
          fields: fields,
        )
      ]),
      key: r'size',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> link() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'link',
          fields: fields,
        )
      ]),
      key: r'link',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class MediaRecordAvgAggregateOutputType {
  const MediaRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> size() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'size',
          fields: fields,
        )
      ]),
      key: r'size',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class MediaRecordSumAggregateOutputType {
  const MediaRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<int?> size() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'size',
          fields: fields,
        )
      ]),
      key: r'size',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class MediaRecordMinAggregateOutputType {
  const MediaRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> type() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'type',
          fields: fields,
        )
      ]),
      key: r'type',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> mimeType() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'mime_type',
          fields: fields,
        )
      ]),
      key: r'mime_type',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> size() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'size',
          fields: fields,
        )
      ]),
      key: r'size',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> link() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'link',
          fields: fields,
        )
      ]),
      key: r'link',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class MediaRecordMaxAggregateOutputType {
  const MediaRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> type() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'type',
          fields: fields,
        )
      ]),
      key: r'type',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> mimeType() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'mime_type',
          fields: fields,
        )
      ]),
      key: r'mime_type',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<int?> size() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'size',
          fields: fields,
        )
      ]),
      key: r'size',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> link() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'link',
          fields: fields,
        )
      ]),
      key: r'link',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> description() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'description',
          fields: fields,
        )
      ]),
      key: r'description',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class FeedRecordCountAggregateOutputType {
  const FeedRecordCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class FeedRecordAvgAggregateOutputType {
  const FeedRecordAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class FeedRecordSumAggregateOutputType {
  const FeedRecordSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }
}

class FeedRecordMinAggregateOutputType {
  const FeedRecordMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class FeedRecordMaxAggregateOutputType {
  const FeedRecordMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<BigInt?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as BigInt?));
  }

  Future<String?> cid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'cid',
          fields: fields,
        )
      ]),
      key: r'cid',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> uri() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'uri',
          fields: fields,
        )
      ]),
      key: r'uri',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> authorDid() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'author_did',
          fields: fields,
        )
      ]),
      key: r'author_did',
    );
    return query(const []).then((value) => (value as String?));
  }
}

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class Datasources implements _i1.JsonSerializable {
  const Datasources({this.db = r'file:../database/skybridge.db'});

  final String? db;

  @override
  Map<String, dynamic> toJson() => _$DatasourcesToJson(this);
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient._internal(
    _i3.Engine engine, {
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  })  : _engine = engine,
        _headers = headers,
        _transaction = transaction,
        super(
          engine,
          headers: headers,
          transaction: transaction,
        );

  factory PrismaClient({
    Datasources? datasources,
    Iterable<_i4.Event>? stdout,
    Iterable<_i4.Event>? event,
  }) {
    final logger = _i4.Logger(
      stdout: stdout,
      event: event,
    );
    final engine = _i5.BinaryEngine(
      logger: logger,
      schema:
          r'Ly8gVGhpcyBpcyB5b3VyIFByaXNtYSBzY2hlbWEgZmlsZSwKLy8gbGVhcm4gbW9yZSBhYm91dCBpdCBpbiB0aGUgZG9jczogaHR0cHM6Ly9wcmlzLmx5L2QvcHJpc21hLXNjaGVtYQoKZ2VuZXJhdG9yIGNsaWVudCB7CiAgcHJvdmlkZXIgPSAiZGFydCBydW4gb3JtIgogIGVuZ2luZVR5cGUgPSAiYmluYXJ5Igp9CgpkYXRhc291cmNlIGRiIHsKICBwcm92aWRlciA9ICJzcWxpdGUiCiAgdXJsICAgICAgPSAiZmlsZTouLi9kYXRhYmFzZS9za3licmlkZ2UuZGIiCn0KCm1vZGVsIFVzZXJSZWNvcmQgewogIGlkICAgICAgICAgICAgICBCaWdJbnQgICAgIEBpZAogIGRpZCAgICAgICAgICAgICBTdHJpbmcgIEB1bmlxdWUKICBiYW5uZXIgICAgICAgICAgU3RyaW5nIEBkZWZhdWx0KCIiKQogIGZvbGxvd2Vyc19jb3VudCBJbnQgQGRlZmF1bHQoMCkKICBmb2xsb3dzX2NvdW50ICAgSW50IEBkZWZhdWx0KDApCiAgcG9zdHNfY291bnQgICAgIEludCBAZGVmYXVsdCgwKQogIGRlc2NyaXB0aW9uICAgICBTdHJpbmcgQGRlZmF1bHQoIiIpCn0KCm1vZGVsIFBvc3RSZWNvcmQgewogIGlkICAgICAgICAgICBCaWdJbnQgICAgICAgICAgICBAaWQKICBjaWQgICAgICAgICAgU3RyaW5nICAgICAgICAgQHVuaXF1ZQogIHVyaSAgICAgICAgICBTdHJpbmcKICBhdXRob3JfZGlkICAgU3RyaW5nCiAgcmVwb3N0cyBSZXBvc3RSZWNvcmRbXQp9Cgptb2RlbCBSZXBvc3RSZWNvcmQgewogIGlkICAgICAgICAgICAgICAgQmlnSW50ICAgICAgICBAaWQKICBoYXNoX2lkICAgICAgICAgIFN0cmluZyAgICAgQHVuaXF1ZQogIG9yaWdpbmFsX3Bvc3QgICAgUG9zdFJlY29yZCBAcmVsYXRpb24oZmllbGRzOiBbb3JpZ2luYWxfcG9zdF9pZF0sIHJlZmVyZW5jZXM6IFtpZF0pCiAgb3JpZ2luYWxfcG9zdF9pZCBCaWdJbnQKfQoKbW9kZWwgTm90aWZpY2F0aW9uUmVjb3JkIHsKICBpZCAgQmlnSW50ICAgIEBpZAogIGNpZCBTdHJpbmcKICB1cmkgU3RyaW5nCn0KCm1vZGVsIE1lZGlhUmVjb3JkIHsKICBpZCAgICAgICAgICBCaWdJbnQgICAgQGlkCiAgdHlwZSAgICAgICAgU3RyaW5nCiAgbWltZV90eXBlICAgU3RyaW5nCiAgc2l6ZSAgICAgICAgSW50CiAgbGluayAgICAgICAgU3RyaW5nCiAgZGVzY3JpcHRpb24gU3RyaW5nCn0KCm1vZGVsIEZlZWRSZWNvcmQgewogIGlkICAgICAgICAgQmlnSW50ICAgICBAaWQKICBjaWQgICAgICAgIFN0cmluZwogIHVyaSAgICAgICAgU3RyaW5nCiAgYXV0aG9yX2RpZCBTdHJpbmc/Cn0K',
      datasources: datasources?.toJson().cast() ?? const {},
      executable:
          r'/Users/videah/.npm/_npx/2778af9cee32ff87/node_modules/prisma/query-engine-darwin-arm64',
    );
    return PrismaClient._internal(engine);
  }

  final _i3.Engine _engine;

  final _i3.QueryEngineRequestHeaders? _headers;

  final _i3.TransactionInfo? _transaction;

  @override
  PrismaClient copyWith({
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  }) =>
      PrismaClient._internal(
        _engine,
        headers: headers ?? _headers,
        transaction: transaction ?? _transaction,
      );
  _i1.ModelDelegate<UserRecord> get userRecord => _i1.ModelDelegate<UserRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<PostRecord> get postRecord => _i1.ModelDelegate<PostRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<RepostRecord> get repostRecord =>
      _i1.ModelDelegate<RepostRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<NotificationRecord> get notificationRecord =>
      _i1.ModelDelegate<NotificationRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<MediaRecord> get mediaRecord =>
      _i1.ModelDelegate<MediaRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
  _i1.ModelDelegate<FeedRecord> get feedRecord => _i1.ModelDelegate<FeedRecord>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
}
