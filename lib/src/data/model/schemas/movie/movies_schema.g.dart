// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesSchema _$MoviesSchemaFromJson(Map<String, dynamic> json) => MoviesSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => MovieDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : MetaSchema.fromJson(json['meta'] as Map<String, dynamic>),
    );
