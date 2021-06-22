import 'package:json_annotation/json_annotation.dart';

import '../../core/covers_schema.dart';

part 'season_files_schema.g.dart';

@JsonSerializable(createToJson: false)
class SeasonFilesSchema {
  SeasonFilesSchema(this.data);

  factory SeasonFilesSchema.fromJson(Map<String, dynamic> json) =>
      _$SeasonFilesSchemaFromJson(json);

  final List<SeasonFilesDataSchema> data;
}

@JsonSerializable(createToJson: false)
class SeasonFilesDataSchema {
  SeasonFilesDataSchema(
    this.episode,
    this.episodesInclude,
    this.title,
    this.description,
    this.rating,
    this.poster,
    this.covers,
    this.files,
  );

  factory SeasonFilesDataSchema.fromJson(Map<String, dynamic> json) =>
      _$SeasonFilesDataSchemaFromJson(json);

  final int episode;

  @JsonKey(name: 'episodes_include')
  final String episodesInclude;

  final String title;
  final String description;
  final dynamic rating;
  final String poster;
  final CoversSchema covers;
  final List<FilesSchema> files;
}

@JsonSerializable(createToJson: false)
class FilesSchema {
  FilesSchema(this.lang, this.files);

  factory FilesSchema.fromJson(Map<String, dynamic> json) => _$FilesSchemaFromJson(json);

  final String lang;
  final List<FileSchema> files;
}

@JsonSerializable(createToJson: false)
class FileSchema {
  FileSchema(this.id, this.quality, this.src, this.duration, this.thumbnails);

  factory FileSchema.fromJson(Map<String, dynamic> json) => _$FileSchemaFromJson(json);

  final int id;
  final String quality;
  final String src;
  final int duration;
  final List<ThumbnailSchema> thumbnails;
}

@JsonSerializable(createToJson: false)
class ThumbnailSchema {
  ThumbnailSchema(
    this.id,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.interval,
    this.width,
    this.height,
    this.columns,
  );

  factory ThumbnailSchema.fromJson(Map<String, dynamic> json) => _$ThumbnailSchemaFromJson(json);

  final int id;
  final String url;
  @JsonKey(name: 'start_time')
  final int startTime;
  @JsonKey(name: 'end_time')
  final int endTime;
  final int duration;
  final int interval;
  final int width;
  final int height;
  final int columns;
}
