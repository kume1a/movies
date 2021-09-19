// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_seasons_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonsSchema _$SeasonsSchemaFromJson(Map<String, dynamic> json) =>
    SeasonsSchema(
      (json['data'] as List<dynamic>?)
          ?.map((e) => SeasonsDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SeasonsDataSchema _$SeasonsDataSchemaFromJson(Map<String, dynamic> json) =>
    SeasonsDataSchema(
      json['movieId'] as int?,
      json['number'] as int?,
      json['name'] as String?,
      json['episodesCount'] as int?,
    );
