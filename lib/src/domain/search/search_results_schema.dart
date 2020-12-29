import 'package:json_annotation/json_annotation.dart';
import 'package:movo/src/domain/actors/actors_schema.dart';
import 'package:movo/src/domain/core/posters_schema.dart';
import 'package:movo/src/domain/core/rating_schema.dart';
import 'package:movo/src/domain/movie/movie_data_schema.dart';

part 'search_results_schema.g.dart';

@JsonSerializable(createToJson: false)
class SearchResultsSchema {
  final List<SearchResultSchema> data;
  final MetaSchema meta;

  SearchResultsSchema(this.data, this.meta);

  factory SearchResultsSchema.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class SearchResultSchema {
  final int id;
  final String type;
  final int adjaraId;
  final String originalName;
  final String primaryName;
  final String secondaryName;
  final String tertiaryName;
  final String primaryDescription;
  final String secondaryDescription;
  final String tertiaryDescription;
  final String poster;
  final bool isTvShow;
  final bool isAdult;
  final int year;
  final double weight;
  final RatingSchema rating;
  final PostersSchema posters;
  final CoverSchema covers;

  SearchResultSchema(
    this.id,
    this.type,
    this.adjaraId,
    this.originalName,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.primaryDescription,
    this.secondaryDescription,
    this.tertiaryDescription,
    this.poster,
    this.isTvShow, // ignore: avoid_positional_boolean_parameters
    this.isAdult,
    this.year,
    this.weight,
    this.rating,
    this.posters,
    this.covers,
  );

  factory SearchResultSchema.fromJson(Map<String, dynamic> json) =>
      _$SearchResultSchemaFromJson(json);
}
