// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorsSchema _$ActorsSchemaFromJson(Map<String, dynamic> json) {
  return ActorsSchema(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ActorSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['meta'] == null
        ? null
        : MetaSchema.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

ActorSchema _$ActorSchemaFromJson(Map<String, dynamic> json) {
  return ActorSchema(
    json['id'] as int,
    json['originalName'] as String,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['poster'] as String,
    json['birthDate'] as String,
    json['birthPlace'] as String,
    json['deathDate'] as String,
    json['deathPlace'] as String,
    json['height'] as int,
    json['slogan'] as String,
    json['zodiacSign'] as String,
  );
}

MetaSchema _$MetaSchemaFromJson(Map<String, dynamic> json) {
  return MetaSchema(
    json['pagination'] == null
        ? null
        : PaginationSchema.fromJson(json['pagination'] as Map<String, dynamic>),
  );
}

PaginationSchema _$PaginationSchemaFromJson(Map<String, dynamic> json) {
  return PaginationSchema(
    json['total'] as int,
    json['count'] as int,
    json['per_page'] as int,
    json['current_page'] as int,
    json['total_pages'] as int,
    json['links'] == null
        ? null
        : LinksSchema.fromJson(json['links'] as Map<String, dynamic>),
  );
}

LinksSchema _$LinksSchemaFromJson(Map<String, dynamic> json) {
  return LinksSchema(
    json['next'] as String,
    json['previous'] as String,
  );
}
