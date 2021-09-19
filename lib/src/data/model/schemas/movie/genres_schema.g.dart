// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresSchema _$GenresSchemaFromJson(Map<String, dynamic> json) => GenresSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GenresDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

GenresDataSchema _$GenresDataSchemaFromJson(Map<String, dynamic> json) =>
    GenresDataSchema(
      json['id'] as int?,
      json['primaryName'] as String?,
      json['secondaryName'] as String?,
      json['tertiaryName'] as String?,
      json['backgroundImage'] as String?,
    );
