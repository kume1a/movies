// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_files_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonFilesSchema _$SeasonFilesSchemaFromJson(Map<String, dynamic> json) =>
    SeasonFilesSchema(
      (json['data'] as List<dynamic>?)
          ?.map(
              (e) => SeasonFilesDataSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

SeasonFilesDataSchema _$SeasonFilesDataSchemaFromJson(
        Map<String, dynamic> json) =>
    SeasonFilesDataSchema(
      json['episode'] as int?,
      json['episodes_include'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['rating'],
      json['poster'] as String?,
      json['covers'] == null
          ? null
          : CoversSchema.fromJson(json['covers'] as Map<String, dynamic>),
      (json['files'] as List<dynamic>?)
          ?.map((e) => FilesSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
