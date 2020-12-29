// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_files_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonFilesSchema _$SeasonFilesSchemaFromJson(Map<String, dynamic> json) {
  return SeasonFilesSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SeasonFilesDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SeasonFilesDataSchema _$SeasonFilesDataSchemaFromJson(
    Map<String, dynamic> json) {
  return SeasonFilesDataSchema(
    json['episode'] as int,
    json['episodes_include'] as String,
    json['title'] as String,
    json['description'] as String,
    json['rating'],
    json['poster'] as String,
    json['covers'] == null
        ? null
        : CoversSchema.fromJson(json['covers'] as Map<String, dynamic>),
    (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FilesSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FilesSchema _$FilesSchemaFromJson(Map<String, dynamic> json) {
  return FilesSchema(
    json['lang'] as String,
    (json['files'] as List)
        ?.map((e) =>
            e == null ? null : FileSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

FileSchema _$FileSchemaFromJson(Map<String, dynamic> json) {
  return FileSchema(
    json['id'] as int,
    json['quality'] as String,
    json['src'] as String,
    json['duration'] as int,
    (json['thumbnails'] as List)
        ?.map((e) => e == null
            ? null
            : ThumbnailSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ThumbnailSchema _$ThumbnailSchemaFromJson(Map<String, dynamic> json) {
  return ThumbnailSchema(
    json['id'] as int,
    json['url'] as String,
    json['start_time'] as int,
    json['end_time'] as int,
    json['duration'] as int,
    json['interval'] as int,
    json['width'] as int,
    json['height'] as int,
    json['columns'] as int,
  );
}
