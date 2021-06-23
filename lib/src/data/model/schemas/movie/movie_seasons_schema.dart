import 'package:json_annotation/json_annotation.dart';

part 'movie_seasons_schema.g.dart';

@JsonSerializable(createToJson: false)
class SeasonsSchema {
  SeasonsSchema(this.data);

  factory SeasonsSchema.fromJson(Map<String, dynamic> json) => _$SeasonsSchemaFromJson(json);

  final List<SeasonsDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class SeasonsDataSchema {
  SeasonsDataSchema(this.movieId, this.number, this.name, this.episodesCount);

  factory SeasonsDataSchema.fromJson(Map<String, dynamic> json) => _$SeasonsDataSchemaFromJson(json);

  final int? movieId;
  final int? number;
  final String? name;
  final int? episodesCount;
}
