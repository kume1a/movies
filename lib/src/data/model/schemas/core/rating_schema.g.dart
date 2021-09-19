// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingSchema _$RatingSchemaFromJson(Map<String, dynamic> json) => RatingSchema(
      json['imovies'] == null
          ? null
          : RatingItemSchema.fromJson(json['imovies'] as Map<String, dynamic>),
      json['imdb'] == null
          ? null
          : RatingItemSchema.fromJson(json['imdb'] as Map<String, dynamic>),
      json['rotten'] == null
          ? null
          : RatingItemSchema.fromJson(json['rotten'] as Map<String, dynamic>),
      json['metacritic'] == null
          ? null
          : RatingItemSchema.fromJson(
              json['metacritic'] as Map<String, dynamic>),
    );

RatingItemSchema _$RatingItemSchemaFromJson(Map<String, dynamic> json) =>
    RatingItemSchema(
      (json['score'] as num?)?.toDouble(),
      json['voters'] as int?,
    );
