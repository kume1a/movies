import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/image_size.dart';
import '../../../../core/enums/language.dart';
import '../../../../core/enums/resolution.dart';
import '../../schemas/core/type_mappers.dart';
import '../../schemas/core/utils.dart';
import '../../schemas/movie/genres_schema.dart';
import '../../schemas/movie/languages_schema.dart';
import '../../schemas/movie/movie_data_schema.dart';
import '../../schemas/movie/movie_seasons_schema.dart';
import '../../schemas/movie/plot_schema.dart';
import '../../schemas/movie/trailers_schema.dart';
import '../seasons/season.dart';

part 'movie_data.freezed.dart';

@freezed
class MovieData with _$MovieData {
  const factory MovieData({
    required int id,
    required int movieId,
    required String name,
    required int year,
    required String imdbUrl,
    required bool isTvShow,
    required int duration,
    required bool canBePlayed,
    required String poster,
    required double imdbRating,
    required int voterCount,
    required Map<ImageSize, String> covers,
    required Map<Resolution, String> secondaryCovers,
    required String plot,
    required List<String> genres,
    required Map<Language, String> trailers,
    required List<Language> languages,
    required List<Season> seasons,
  }) = _MovieData;

  const MovieData._();

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
    );
  }

  String? get availableImage => <String?>[
        covers[ImageSize.large],
        secondaryCovers[Resolution.fhd],
        secondaryCovers[Resolution.hd],
        covers[ImageSize.small],
        secondaryCovers[Resolution.vga],
      ].firstValid;
}
