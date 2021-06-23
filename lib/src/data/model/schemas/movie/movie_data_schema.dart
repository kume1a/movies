import 'package:json_annotation/json_annotation.dart';

import '../core/covers_schema.dart';
import '../core/posters_schema.dart';
import '../core/rating_schema.dart';

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

@JsonSerializable(createToJson: false)
class CoverSchema {
  CoverSchema(this.small, this.large);

  factory CoverSchema.fromJson(Map<String, dynamic> json) => _$CoverSchemaFromJson(json);

  final String? small;
  final String? large;
}

@JsonSerializable(createToJson: false)
class LanguagesSchema {
  LanguagesSchema(this.data);

  factory LanguagesSchema.fromJson(Map<String, dynamic> json) => _$LanguagesSchemaFromJson(json);

  final List<LanguagesDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class LanguagesDataSchema {
  LanguagesDataSchema(
    this.code,
    this.primaryName,
    this.primaryNameTurned,
    this.tertiaryName,
    this.secondaryName,
  );

  factory LanguagesDataSchema.fromJson(Map<String, dynamic> json) =>
      _$LanguagesDataSchemaFromJson(json);

  final String? code;
  final String? primaryName;
  final String? primaryNameTurned;
  final String? tertiaryName;
  final String? secondaryName;
}

@JsonSerializable(createToJson: false)
class LastSeriesSchema {
  LastSeriesSchema(this.data);

  factory LastSeriesSchema.fromJson(Map<String, dynamic> json) => _$LastSeriesSchemaFromJson(json);

  final LastSeriesDataSchema? data;
}

@JsonSerializable(createToJson: false)
class LastSeriesDataSchema {
  LastSeriesDataSchema(this.season, this.episode);

  factory LastSeriesDataSchema.fromJson(Map<String, dynamic> json) =>
      _$LastSeriesDataSchemaFromJson(json);

  final int? season;
  final int? episode;
}

@JsonSerializable(createToJson: false)
class MovieActorsSchema {
  MovieActorsSchema(this.data);

  factory MovieActorsSchema.fromJson(Map<String, dynamic> json) => _$MovieActorsSchemaFromJson(json);

  final List<ActorsDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class ActorsDataSchema {
  ActorsDataSchema(
    this.id,
    this.originalName,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.poster,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.deathPlace,
    this.height,
    this.slogan,
    this.zodiacSign,
  );

  factory ActorsDataSchema.fromJson(Map<String, dynamic> json) => _$ActorsDataSchemaFromJson(json);

  final int? id;
  final String? originalName;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? poster;
  final String? birthDate;
  final String? birthPlace;
  final String? deathDate;
  final String? deathPlace;
  final int? height;
  final String? slogan;
  final String? zodiacSign;
}

@JsonSerializable(createToJson: false)
class PlotSchema {
  PlotSchema(this.data);

  factory PlotSchema.fromJson(Map<String, dynamic> json) => _$PlotSchemaFromJson(json);

  final PlotDataSchema? data;
}

@JsonSerializable(createToJson: false)
class PlotsSchema {
  PlotsSchema(this.data);

  factory PlotsSchema.fromJson(Map<String, dynamic> json) => _$PlotsSchemaFromJson(json);

  final List<PlotDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class PlotDataSchema {
  PlotDataSchema(this.description, this.language);

  factory PlotDataSchema.fromJson(Map<String, dynamic> json) => _$PlotDataSchemaFromJson(json);

  final String? description;
  final String? language;
}

@JsonSerializable(createToJson: false)
class GenresSchema {
  GenresSchema(this.data);

  factory GenresSchema.fromJson(Map<String, dynamic> json) => _$GenresSchemaFromJson(json);

  final List<GenresDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class GenresDataSchema {
  GenresDataSchema(
    this.id,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.backgroundImage,
  );

  factory GenresDataSchema.fromJson(Map<String, dynamic> json) => _$GenresDataSchemaFromJson(json);

  final int? id;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? backgroundImage;
}

@JsonSerializable(createToJson: false)
class TrailersSchema {
  TrailersSchema(this.data);

  factory TrailersSchema.fromJson(Map<String, dynamic> json) => _$TrailersSchemaFromJson(json);

  final List<TrailersDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class TrailersDataSchema {
  TrailersDataSchema(this.id, this.name, this.fileUrl, this.language);

  factory TrailersDataSchema.fromJson(Map<String, dynamic> json) =>
      _$TrailersDataSchemaFromJson(json);

  final int? id;
  final String? name;
  final String? fileUrl;
  final String? language;
}

@JsonSerializable(createToJson: false)
class CountriesSchema {
  CountriesSchema(this.data);

  factory CountriesSchema.fromJson(Map<String, dynamic> json) => _$CountriesSchemaFromJson(json);

  final List<CountriesDataSchema>? data;
}

@JsonSerializable(createToJson: false)
class CountriesDataSchema {
  CountriesDataSchema(this.id, this.primaryName, this.secondaryName, this.tertiaryName);

  factory CountriesDataSchema.fromJson(Map<String, dynamic> json) =>
      _$CountriesDataSchemaFromJson(json);

  final int? id;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
}

@JsonSerializable(createToJson: false)
class DirectorsSchema {
  DirectorsSchema(this.data);

  factory DirectorsSchema.fromJson(Map<String, dynamic> json) => _$DirectorsSchemaFromJson(json);

  final List<DirectorsDataSchema>? data;
}

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

@JsonSerializable(createToJson: false)
class DirectorsDataSchema {
  DirectorsDataSchema(
    this.id,
    this.originalName,
    this.primaryName,
    this.secondaryName,
    this.tertiaryName,
    this.poster,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.deathPlace,
    this.height,
    this.slogan,
    this.zodiacSign,
  );

  factory DirectorsDataSchema.fromJson(Map<String, dynamic> json) =>
      _$DirectorsDataSchemaFromJson(json);

  final int? id;
  final String? originalName;
  final String? primaryName;
  final String? secondaryName;
  final String? tertiaryName;
  final String? poster;
  final String? birthDate;
  final String? birthPlace;
  final String? deathDate;
  final String? deathPlace;
  final int? height;
  final String? slogan;
  final String? zodiacSign;
}
