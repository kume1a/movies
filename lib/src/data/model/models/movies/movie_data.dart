import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';
import '../../schemas/core/enums.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/core/utils.dart';
import '../../schemas/movie/genres_schema.dart';
import '../../schemas/movie/languages_schema.dart';
import '../../schemas/movie/movie_data_schema.dart';
import '../../schemas/movie/movie_seasons_schema.dart';
import '../../schemas/movie/plot_schema.dart';
import '../../schemas/movie/trailers_schema.dart';
import '../seasons/season.dart';

part 'movie_data.g.dart';

@HiveType(typeId: HiveTypeIdHolder.movieDataId)
class MovieData {
  MovieData({
    required this.id,
    required this.movieId,
    required this.name,
    required this.year,
    required this.imdbUrl,
    required this.isTvShow,
    required this.duration,
    required this.canBePlayed,
    required this.poster,
    required this.imdbRating,
    required this.voterCount,
    required this.covers,
    required this.secondaryCovers,
    required this.plot,
    required this.genres,
    required this.trailers,
    required this.languages,
    required this.seasons,
    required this.favorite,
    this.saveTimestamp = -1,
  });

  factory MovieData.fromSchema(MovieDataSchema schema) {
    final int id = schema.id ?? 0;
    final int movieId = schema.adjaraId ?? 0;
    final String name = schema.secondaryName ?? schema.originalName ?? '';
    final int year = schema.year ?? 0;
    final String imdbUrl = schema.imdbUrl ?? '';
    final bool isTvShow = schema.isTvShow ?? false;
    final int duration = schema.duration ?? 0;
    final bool canBePlayed = schema.canBePlayed ?? true;

    String? poster = schema.posters?.data?.s240;
    if (poster == null || poster.isEmpty) poster = schema.poster ?? '';

    final double imdbRating = schema.rating?.imdb?.score ?? 0;
    final int voterCount = schema.rating?.imdb?.voters ?? 0;
    final Map<ImageSize, String> primaryCovers = <ImageSize, String>{
      ImageSize.small: schema.cover?.small ?? '',
      ImageSize.large: schema.cover?.large ?? ''
    };
    final Map<Resolution, String> secondaryCovers = <Resolution, String>{
      Resolution.fhd: schema.covers?.data?.s1920 ?? '',
      Resolution.hd: schema.covers?.data?.s1050 ?? '',
      Resolution.vga: schema.covers?.data?.s510 ?? '',
    };

    String plot = '';
    if (schema.plots != null) {
      for (final PlotDataSchema plotDataSchema in schema.plots?.data ?? List<PlotDataSchema>.empty()) {
        plot = plotDataSchema.description ?? '';
        if (plotDataSchema.language == eng) break;
      }
    }

    final List<String> genres =
        schema.genres?.data?.map((GenresDataSchema e) => e.secondaryName ?? e.primaryName ?? '').toList() ??
            List<String>.empty();

    final Map<Language, String> trailers = <Language, String>{
      for (TrailersDataSchema e in schema.trailers?.data ?? List<TrailersDataSchema>.empty())
        getLanguage(e.language): e.fileUrl ?? ''
    };

    final List<Language> languages =
        schema.languages?.data?.map((LanguagesDataSchema e) => getLanguage(e.code)).toList() ?? List<Language>.empty();

    final List<Season> seasons =
        schema.seasons?.data?.map((SeasonsDataSchema e) => Season.fromSchema(e)).toList() ?? List<Season>.empty();

    return MovieData(
      id: id,
      movieId: movieId,
      name: name,
      year: year,
      imdbUrl: imdbUrl,
      isTvShow: isTvShow,
      duration: duration,
      canBePlayed: canBePlayed,
      poster: poster,
      imdbRating: imdbRating,
      voterCount: voterCount,
      covers: primaryCovers,
      secondaryCovers: secondaryCovers,
      plot: plot,
      genres: genres,
      trailers: trailers,
      languages: languages,
      seasons: seasons,
      favorite: false,
    );
  }

  @HiveField(0)
  final int id;

  @HiveField(1)
  final int movieId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final int year;

  @HiveField(4)
  final String imdbUrl;

  @HiveField(5)
  final bool isTvShow;

  @HiveField(6)
  final int duration;

  @HiveField(7)
  final bool canBePlayed;

  @HiveField(8)
  final String poster;

  @HiveField(9)
  final double imdbRating;

  @HiveField(10)
  final int voterCount;

  @HiveField(11)
  final Map<ImageSize, String> covers;

  @HiveField(12)
  final Map<Resolution, String> secondaryCovers;

  @HiveField(13)
  final String plot;

  @HiveField(14)
  final List<String> genres;

  @HiveField(15)
  final Map<Language, String> trailers;

  @HiveField(16)
  final List<Language> languages;

  @HiveField(17)
  final List<Season> seasons;

  @HiveField(18)
  bool favorite;

  /// timestamp in millis from epoch when user saves movie in favorites list
  /// field equals -1 if it isn't saved
  @HiveField(19)
  int saveTimestamp;

  String? get availableImage => <String?>[
        covers[ImageSize.large],
        secondaryCovers[Resolution.fhd],
        secondaryCovers[Resolution.hd],
        covers[ImageSize.small],
        secondaryCovers[Resolution.vga],
      ].firstValid;

  @override
  String toString() {
    return 'MovieData{id: $id, movieId: $movieId, name: $name, year: $year, imdbUrl: $imdbUrl, isTvShow: $isTvShow, duration: $duration, canBePlayed: $canBePlayed, poster: $poster, imdbRating: $imdbRating, voterCount: $voterCount, covers: $covers, secondaryCovers: $secondaryCovers, plot: $plot, genres: $genres, trailers: $trailers, languages: $languages, seasons: $seasons, favorite: $favorite}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          movieId == other.movieId &&
          name == other.name &&
          year == other.year &&
          imdbUrl == other.imdbUrl &&
          isTvShow == other.isTvShow &&
          duration == other.duration &&
          canBePlayed == other.canBePlayed &&
          poster == other.poster &&
          imdbRating == other.imdbRating &&
          voterCount == other.voterCount &&
          plot == other.plot &&
          languages == other.languages &&
          favorite == other.favorite;

  @override
  int get hashCode =>
      id.hashCode ^
      movieId.hashCode ^
      name.hashCode ^
      year.hashCode ^
      imdbUrl.hashCode ^
      isTvShow.hashCode ^
      duration.hashCode ^
      canBePlayed.hashCode ^
      poster.hashCode ^
      imdbRating.hashCode ^
      voterCount.hashCode ^
      plot.hashCode ^
      languages.hashCode ^
      favorite.hashCode;
}
