import 'package:json_annotation/json_annotation.dart';

import '../actors/actors_schema.dart';
import '../movie/movie_data_schema.dart';

part 'movies_schema.g.dart';

@JsonSerializable(createToJson: false)
class MoviesSchema {
  MoviesSchema(this.data, this.meta);

  factory MoviesSchema.fromJson(Map<String, dynamic> json) => _$MoviesSchemaFromJson(json);

  final List<MovieDataSchema>? data;
  final MetaSchema? meta;
}