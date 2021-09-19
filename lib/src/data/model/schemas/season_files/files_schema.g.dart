// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilesSchema _$FilesSchemaFromJson(Map<String, dynamic> json) => FilesSchema(
      json['lang'] as String?,
      (json['files'] as List<dynamic>?)
          ?.map((e) => FileSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

FileSchema _$FileSchemaFromJson(Map<String, dynamic> json) => FileSchema(
      json['id'] as int?,
      json['quality'] as String?,
      json['src'] as String?,
      json['duration'] as int?,
      (json['thumbnails'] as List<dynamic>?)
          ?.map((e) => ThumbnailSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
