import 'package:injectable/injectable.dart';

import '../../model/core/either.dart';
import '../../model/core/fetch_failure.dart';
import '../../model/schemas/actors/actors_model.dart';
import '../../model/schemas/actors/actors_schema.dart';
import '../../model/schemas/actors/season_files/season_files_model.dart';
import '../../model/schemas/actors/season_files/season_files_schema.dart';
import '../../model/schemas/core/enums.dart';
import '../../model/schemas/movie/movie_data_model.dart';
import '../../model/schemas/movie/movie_data_schema.dart';
import '../../model/schemas/movies/movies_model.dart';
import '../../model/schemas/movies/movies_schema.dart';
import '../api_service.dart';
import 'core/base_service.dart';

@lazySingleton
class MovieService extends BaseService {
  MovieService(this._apiService);

  final ApiService _apiService;

  Future<Either<FetchFailure, Movies>> getMovies(int page, Genre genre) async {
    int? genreId;
    switch (genre) {
      case Genre.all:
        genreId = null;
        break;
      case Genre.animated:
        genreId = 265;
        break;
      case Genre.biographical:
        genreId = 253;
        break;
      case Genre.detective:
        genreId = 259;
        break;
      case Genre.documentary:
        genreId = 252;
        break;
      case Genre.drama:
        genreId = 249;
        break;
      case Genre.erotic:
        genreId = 269;
        break;
      case Genre.western:
        genreId = 267;
        break;
      case Genre.historical:
        genreId = 264;
        break;
      case Genre.comedy:
        genreId = 258;
        break;
      case Genre.melodrama:
        genreId = 260;
        break;
      case Genre.musical:
        genreId = 268;
        break;
      case Genre.short:
        genreId = 273;
        break;
      case Genre.mysticism:
        genreId = 256;
        break;
      case Genre.theatreMusical:
        genreId = 262;
        break;
      case Genre.sharpStory:
        genreId = 248;
        break;
      case Genre.adventure:
        genreId = 266;
        break;
      case Genre.fantastic:
        genreId = 257;
        break;
      case Genre.military:
        genreId = 251;
        break;
      case Genre.family:
        genreId = 263;
        break;
      case Genre.horror:
        genreId = 255;
        break;
      case Genre.sports:
        genreId = 254;
        break;
      case Genre.thriller:
        genreId = 250;
        break;
      case Genre.fabulous:
        genreId = 261;
        break;
      case Genre.anime:
        genreId = 318;
        break;
    }

    final Either<FetchFailure, MoviesSchema> result = await safeFetch(
      () => _apiService.getMovies(
        page: page.toString(),
        perPage: 20.toString(),
        filterInit: true.toString(),
        filterSort: '-upload_date',
        filterWithActors: 3.toString(),
        filterWithDirectors: 1.toString(),
        filterWithFiles: 'yes',
        sort: '-upload_date',
        source: 'adjaranet',
        filterGenre: genreId?.toString(),
      ),
    );

    return result.map((MoviesSchema r) => Movies.fromSchema(r));
  }

  Future<Either<FetchFailure, Movies>> getPopularMovies() async {
    final Either<FetchFailure, MoviesSchema> result = await safeFetch(
      () => _apiService.getPopularMovies(
        source: 'adjaranet',
      ),
    );

    return result.map((MoviesSchema r) => Movies.fromSchema(r));
  }

  Future<Either<FetchFailure, Movies>> getTopMovies(int page) async {
    final Either<FetchFailure, MoviesSchema> result = await safeFetch(
      () => _apiService.getTopMovies(
        type: 'movie',
        period: 'month',
        page: page.toString(),
        perPage: 20.toString(),
        filterWithActors: 3.toString(),
        filterWithDirectors: 1.toString(),
        source: 'adjaranet',
      ),
    );

    return result.map((MoviesSchema r) => Movies.fromSchema(r));
  }

  Future<Either<FetchFailure, MovieData>> getMovie(int movieId) async {
    final Either<FetchFailure, MovieSchema> result = await safeFetch(
      () => _apiService.getMovie(
        movieId: movieId,
        filterWithDirectors: 3.toString(),
        source: 'adjaranet',
      ),
    );

    return result.fold(
      (FetchFailure l) => left(l),
      (MovieSchema r) =>
          r.data != null ? right(MovieData.fromSchema(r.data!)) : left(const FetchFailure.unknownError()),
    );
  }

  Future<Either<FetchFailure, SeasonFiles>> getSeasonFiles(int id, int season) async {
    final Either<FetchFailure, SeasonFilesSchema> result = await safeFetch(
      () => _apiService.getSeasonFiles(
        movieId: id,
        season: season,
        source: 'adjaranet',
      ),
    );

    return result.map((SeasonFilesSchema r) => SeasonFiles.fromSchema(season, r));
  }

  Future<Either<FetchFailure, Actors>> getActors(int movieId, int page) async {
    final Either<FetchFailure, ActorsSchema> result = await safeFetch(
      () => _apiService.getActors(
        movieId: movieId,
        page: page.toString(),
        perPage: 12.toString(),
        filterRole: 'cast',
        source: 'adjaranet',
      ),
    );

    return result.map((ActorsSchema r) => Actors.fromSchema(r));
  }

  Future<Either<FetchFailure, Movies>> getRelatedMovies(int movieId, int page) async {
    final Either<FetchFailure, MoviesSchema> result = await safeFetch(
      () => _apiService.getRelatedMovies(
        movieId: movieId,
        page: page.toString(),
        perPage: 10.toString(),
        filterWithActors: 3.toString(),
        filterWithDirectors: 1.toString(),
        source: 'adjaranet',
      ),
    );

    return result.map((MoviesSchema r) => Movies.fromSchema(r));
  }
}
