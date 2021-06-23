import 'package:json_annotation/json_annotation.dart';

import '../core/covers_schema.dart';
import 'files_schema.dart';

part 'season_files_schema.g.dart';

@JsonSerializable(createToJson: false)
class SeasonFilesSchema {
  SeasonFilesSchema(this.data);

  factory SeasonFilesSchema.fromJson(Map<String, dynamic> json) =>
      _$SeasonFilesSchemaFromJson(json);

  final List<SeasonFilesDataSchema>? data;
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

  final int? episode;

  @JsonKey(name: 'episodes_include')
  final String? episodesInclude;

  final String? title;
  final String? description;
  final dynamic rating;
  final String? poster;
  final CoversSchema? covers;
  final List<FilesSchema>? files;
}
