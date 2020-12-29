import 'package:json_annotation/json_annotation.dart';

part 'rating_schema.g.dart';

@JsonSerializable(createToJson: false)
class RatingSchema {
  final RatingItemSchema imovies;
  final RatingItemSchema imdb;
  final RatingItemSchema rotten;
  final RatingItemSchema metacritic;

  RatingSchema(this.imovies, this.imdb, this.rotten, this.metacritic);

  factory RatingSchema.fromJson(Map<String, dynamic> json) => _$RatingSchemaFromJson(json);
}

@JsonSerializable(createToJson: false)
class RatingItemSchema {
  final double score;
  final int voters;

  RatingItemSchema(this.score, this.voters);

  factory RatingItemSchema.fromJson(Map<String, dynamic> json) => _$RatingItemSchemaFromJson(json);
}