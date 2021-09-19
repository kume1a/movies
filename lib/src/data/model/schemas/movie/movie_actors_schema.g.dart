// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_actors_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieActorsSchema _$MovieActorsSchemaFromJson(Map<String, dynamic> json) =>
    MovieActorsSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ActorsDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ActorsDataSchema _$ActorsDataSchemaFromJson(Map<String, dynamic> json) =>
    ActorsDataSchema(
      json['id'] as int?,
      json['originalName'] as String?,
      json['primaryName'] as String?,
      json['secondaryName'] as String?,
      json['tertiaryName'] as String?,
      json['poster'] as String?,
      json['birthDate'] as String?,
      json['birthPlace'] as String?,
      json['deathDate'] as String?,
      json['deathPlace'] as String?,
      json['height'] as int?,
      json['slogan'] as String?,
      json['zodiacSign'] as String?,
    );
