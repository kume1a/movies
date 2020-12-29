// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultsSchema _$SearchResultsSchemaFromJson(Map<String, dynamic> json) {
  return SearchResultsSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SearchResultSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['meta'] == null
        ? null
        : MetaSchema.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

SearchResultSchema _$SearchResultSchemaFromJson(Map<String, dynamic> json) {
  return SearchResultSchema(
    json['id'] as int,
    json['type'] as String,
    json['adjaraId'] as int,
    json['originalName'] as String,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['primaryDescription'] as String,
    json['secondaryDescription'] as String,
    json['tertiaryDescription'] as String,
    json['poster'] as String,
    json['isTvShow'] as bool,
    json['isAdult'] as bool,
    json['year'] as int,
    (json['weight'] as num)?.toDouble(),
    json['rating'] == null
        ? null
        : RatingSchema.fromJson(json['rating'] as Map<String, dynamic>),
    json['posters'] == null
        ? null
        : PostersSchema.fromJson(json['posters'] as Map<String, dynamic>),
    json['covers'] == null
        ? null
        : CoverSchema.fromJson(json['covers'] as Map<String, dynamic>),
  );
}
