// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSchema _$MovieSchemaFromJson(Map<String, dynamic> json) {
  return MovieSchema(
    json['data'] == null
        ? null
        : MovieDataSchema.fromJson(json['data'] as Map<String, dynamic>),
  );
}

MovieDataSchema _$MovieDataSchemaFromJson(Map<String, dynamic> json) {
  return MovieDataSchema(
    json['id'] as int,
    json['adjaraId'] as int,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['originalName'] as String,
    json['year'] as int,
    json['releaseDate'] as String,
    json['imdbUrl'] as String,
    json['isTvShow'] as bool,
    json['budget'] as String,
    json['income'] as String,
    json['duration'] as int,
    json['adult'] as bool,
    json['parentalControlRate'] as String,
    json['watchCount'] as int,
    json['canBePlayed'] as bool,
    json['regionAllowed'] as bool,
    json['cover'] == null
        ? null
        : CoverSchema.fromJson(json['cover'] as Map<String, dynamic>),
    json['poster'] as String,
    json['rating'] == null
        ? null
        : RatingSchema.fromJson(json['rating'] as Map<String, dynamic>),
    json['hasSubtitles'] as bool,
    json['languages'] == null
        ? null
        : LanguagesSchema.fromJson(json['languages'] as Map<String, dynamic>),
    json['lastSeries'] == null
        ? null
        : LastSeriesSchema.fromJson(json['lastSeries'] as Map<String, dynamic>),
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
}

CoverSchema _$CoverSchemaFromJson(Map<String, dynamic> json) {
  return CoverSchema(
    json['small'] as String,
    json['large'] as String,
  );
}

LanguagesSchema _$LanguagesSchemaFromJson(Map<String, dynamic> json) {
  return LanguagesSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : LanguagesDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

LanguagesDataSchema _$LanguagesDataSchemaFromJson(Map<String, dynamic> json) {
  return LanguagesDataSchema(
    json['code'] as String,
    json['primaryName'] as String,
    json['primaryNameTurned'] as String,
    json['tertiaryName'] as String,
    json['secondaryName'] as String,
  );
}

LastSeriesSchema _$LastSeriesSchemaFromJson(Map<String, dynamic> json) {
  return LastSeriesSchema(
    json['data'] == null
        ? null
        : LastSeriesDataSchema.fromJson(json['data'] as Map<String, dynamic>),
  );
}

LastSeriesDataSchema _$LastSeriesDataSchemaFromJson(Map<String, dynamic> json) {
  return LastSeriesDataSchema(
    json['season'] as int,
    json['episode'] as int,
  );
}

MovieActorsSchema _$MovieActorsSchemaFromJson(Map<String, dynamic> json) {
  return MovieActorsSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ActorsDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ActorsDataSchema _$ActorsDataSchemaFromJson(Map<String, dynamic> json) {
  return ActorsDataSchema(
    json['id'] as int,
    json['originalName'] as String,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['poster'] as String,
    json['birthDate'] as String,
    json['birthPlace'] as String,
    json['deathDate'] as String,
    json['deathPlace'] as String,
    json['height'] as int,
    json['slogan'] as String,
    json['zodiacSign'] as String,
  );
}

PlotSchema _$PlotSchemaFromJson(Map<String, dynamic> json) {
  return PlotSchema(
    json['data'] == null
        ? null
        : PlotDataSchema.fromJson(json['data'] as Map<String, dynamic>),
  );
}

PlotsSchema _$PlotsSchemaFromJson(Map<String, dynamic> json) {
  return PlotsSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : PlotDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

PlotDataSchema _$PlotDataSchemaFromJson(Map<String, dynamic> json) {
  return PlotDataSchema(
    json['description'] as String,
    json['language'] as String,
  );
}

GenresSchema _$GenresSchemaFromJson(Map<String, dynamic> json) {
  return GenresSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : GenresDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GenresDataSchema _$GenresDataSchemaFromJson(Map<String, dynamic> json) {
  return GenresDataSchema(
    json['id'] as int,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['backgroundImage'] as String,
  );
}

TrailersSchema _$TrailersSchemaFromJson(Map<String, dynamic> json) {
  return TrailersSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : TrailersDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

TrailersDataSchema _$TrailersDataSchemaFromJson(Map<String, dynamic> json) {
  return TrailersDataSchema(
    json['id'] as int,
    json['name'] as String,
    json['fileUrl'] as String,
    json['language'] as String,
  );
}

CountriesSchema _$CountriesSchemaFromJson(Map<String, dynamic> json) {
  return CountriesSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : CountriesDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

CountriesDataSchema _$CountriesDataSchemaFromJson(Map<String, dynamic> json) {
  return CountriesDataSchema(
    json['id'] as int,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
  );
}

DirectorsSchema _$DirectorsSchemaFromJson(Map<String, dynamic> json) {
  return DirectorsSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : DirectorsDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SeasonsSchema _$SeasonsSchemaFromJson(Map<String, dynamic> json) {
  return SeasonsSchema(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : SeasonsDataSchema.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

SeasonsDataSchema _$SeasonsDataSchemaFromJson(Map<String, dynamic> json) {
  return SeasonsDataSchema(
    json['movieId'] as int,
    json['number'] as int,
    json['name'] as String,
    json['episodesCount'] as int,
  );
}

DirectorsDataSchema _$DirectorsDataSchemaFromJson(Map<String, dynamic> json) {
  return DirectorsDataSchema(
    json['id'] as int,
    json['originalName'] as String,
    json['primaryName'] as String,
    json['secondaryName'] as String,
    json['tertiaryName'] as String,
    json['poster'] as String,
    json['birthDate'] as String,
    json['birthPlace'] as String,
    json['deathDate'] as String,
    json['deathPlace'] as String,
    json['height'] as int,
    json['slogan'] as String,
    json['zodiacSign'] as String,
  );
}
