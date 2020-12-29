// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesSchema _$MoviesSchemaFromJson(Map<String, dynamic> json) {
  return MoviesSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : MovieDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['meta'] == null
        ? null
        : MetaSchema.fromJson(json['meta'] as Map<String, dynamic>),
  );
}
