// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSchema _$MovieSchemaFromJson(Map<String, dynamic> json) => MovieSchema(
      json['data'] == null
          ? null
          : MovieDataSchema.fromJson(json['data'] as Map<String, dynamic>),
    );

MovieDataSchema _$MovieDataSchemaFromJson(Map<String, dynamic> json) =>
    MovieDataSchema(
      json['id'] as int?,
      json['adjaraId'] as int?,
      json['primaryName'] as String?,
      json['secondaryName'] as String?,
      json['tertiaryName'] as String?,
      json['originalName'] as String?,
      json['year'] as int?,
      json['releaseDate'] as String?,
      json['imdbUrl'] as String?,
      json['isTvShow'] as bool?,
      json['budget'] as String?,
      json['income'] as String?,
      json['duration'] as int?,
      json['adult'] as bool?,
      json['parentalControlRate'] as String?,
      json['watchCount'] as int?,
      json['canBePlayed'] as bool?,
      json['regionAllowed'] as bool?,
      json['cover'] == null
          ? null
          : CoverSchema.fromJson(json['cover'] as Map<String, dynamic>),
      json['poster'] as String?,
      json['rating'] == null
          ? null
          : RatingSchema.fromJson(json['rating'] as Map<String, dynamic>),
      json['hasSubtitles'] as bool?,
      json['languages'] == null
          ? null
          : LanguagesSchema.fromJson(json['languages'] as Map<String, dynamic>),
      json['lastSeries'] == null
          ? null
          : LastSeriesSchema.fromJson(
              json['lastSeries'] as Map<String, dynamic>),
      json['posters'] == null
          ? null
          : PostersSchema.fromJson(json['posters'] as Map<String, dynamic>),
      json['covers'] == null
          ? null
          : CoversSchema.fromJson(json['covers'] as Map<String, dynamic>),
      json['actors'] == null
          ? null
          : MovieActorsSchema.fromJson(json['actors'] as Map<String, dynamic>),
      json['plot'] == null
          ? null
          : PlotSchema.fromJson(json['plot'] as Map<String, dynamic>),
      json['plots'] == null
          ? null
          : PlotsSchema.fromJson(json['plots'] as Map<String, dynamic>),
      json['genres'] == null
          ? null
          : GenresSchema.fromJson(json['genres'] as Map<String, dynamic>),
      json['trailers'] == null
          ? null
          : TrailersSchema.fromJson(json['trailers'] as Map<String, dynamic>),
      json['countries'] == null
          ? null
          : CountriesSchema.fromJson(json['countries'] as Map<String, dynamic>),
      json['seasons'] == null
          ? null
          : SeasonsSchema.fromJson(json['seasons'] as Map<String, dynamic>),
      json['directors'] == null
          ? null
          : DirectorsSchema.fromJson(json['directors'] as Map<String, dynamic>),
    );
