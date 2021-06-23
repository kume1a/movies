import 'package:json_annotation/json_annotation.dart';

import '../core/cover_schema.dart';
import '../core/covers_schema.dart';
import '../core/posters_schema.dart';
import '../core/rating_schema.dart';
import 'countries_schema.dart';
import 'directors_schema.dart';
import 'genres_schema.dart';
import 'languages_schema.dart';
import 'last_series_schema.dart';
import 'movie_actors_schema.dart';
import 'movie_seasons_schema.dart';
import 'plot_schema.dart';
import 'trailers_schema.dart';

part 'movie_data_schema.g.dart';

@JsonSerializable(createToJson: false)
class MovieSchema {
  MovieSchema(this.data);

  factory MovieSchema.fromJson(Map<String, dynamic> json) => _$MovieSchemaFromJson(json);

  final MovieDataSchema? data;

  @override
  String toString() {
    return 'MovieSchema{data: $data}';
  }
}

@JsonSerializable(createToJson: false)
class MovieDataSchema {
  MovieDataSchema(
      this.id,
      this.adjaraId,
      this.primaryName,
      this.secondaryName,
      this.tertiaryName,
      this.originalName,
      this.year,
      this.releaseDate,
      this.imdbUrl,
      this.isTvShow, // ignore: avoid_positional_boolean_parameters
      this.budget,
      this.income,
      this.duration,
      this.adult,
      this.parentalControlRate,
      this.watchCount,
      this.canBePlayed,
      this.regionAllowed,
      this.cover,
      this.poster,
      this.rating,
      this.hasSubtitles,
      this.languages,
      this.lastSeries,
      this.posters,
      this.covers,
      this.actors,
      this.plot,
      this.plots,
      this.genres,
      this.trailers,
      this.countries,
      this.seasons,
      this.directors);

  factory MovieDataSchema.fromJson(Map<String, dynamic> json) => _$MovieDataSchemaFromJson(json);

  final int? id;
  final int? adjaraId;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? originalName;
  final int? year;
  final String? releaseDate;
  final String? imdbUrl;
  final bool? isTvShow;
  final String? budget;
  final String? income;
  final int? duration;
  final bool? adult;
  final String? parentalControlRate;
  final int? watchCount;
  final bool? canBePlayed;
  final bool? regionAllowed;
  final CoverSchema? cover;
  final String? poster;
  final RatingSchema? rating;
  final bool? hasSubtitles;
  final LanguagesSchema? languages;
  final LastSeriesSchema? lastSeries;
  final PostersSchema? posters;
  final CoversSchema? covers;
  final MovieActorsSchema? actors;
  final PlotSchema? plot;
  final PlotsSchema? plots;
  final GenresSchema? genres;
  final TrailersSchema? trailers;
  final CountriesSchema? countries;
  final SeasonsSchema? seasons;
  final DirectorsSchema? directors;

  @override
  String toString() {
    return 'MovieSchema{id: $id, adjaraId: $adjaraId, primaryName: $primaryName, secondaryName: $secondaryName, tertiaryName: $tertiaryName, originalName: $originalName, year: $year, releaseDate: $releaseDate, imdbUrl: $imdbUrl, isTvShow: $isTvShow, budget: $budget, income: $income, duration: $duration, adult: $adult, parentalControlRate: $parentalControlRate, watchCount: $watchCount, canBePlayed: $canBePlayed, regionAllowed: $regionAllowed, cover: $cover, poster: $poster, rating: $rating, hasSubtitles: $hasSubtitles, languages: $languages, lastSeries: $lastSeries, posters: $posters, covers: $covers, actors: $actors, plot: $plot, plots: $plots, genres: $genres, trailers: $trailers, countries: $countries, directors: $directors}';
  }
}
