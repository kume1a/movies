import 'package:json_annotation/json_annotation.dart';
import 'package:movo/src/domain/actors/actors_schema.dart';
import 'package:movo/src/domain/movie/movie_data_schema.dart';

part 'movies_schema.g.dart';

@JsonSerializable(createToJson: false)
class MoviesSchema {
  final List<MovieDataSchema> data;
  final MetaSchema meta;

  MoviesSchema(this.data, this.meta);

  factory MoviesSchema.fromJson(Map<String, dynamic> json) => _$MoviesSchemaFromJson(json);
}