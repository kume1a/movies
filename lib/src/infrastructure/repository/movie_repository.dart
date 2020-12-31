import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movo/src/domain/actors/actors_model.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/i_movie_repository.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/domain/movies/movies_model.dart';
import 'package:movo/src/domain/search/search_results_model.dart';
import 'package:movo/src/infrastructure/repository/movie_local_interactor.dart';
import 'package:movo/src/infrastructure/repository/movie_remote_provider.dart';

@LazySingleton(as: IMovieRepository)
class MovieRepository implements IMovieRepository {
  final MovieRemoteProvider _remoteProvider;
  final MovieLocalInteractor _localProvider;

  MovieRepository(this._remoteProvider, this._localProvider);

  @override
  Future<Option<Movies>> fetchMovies(int page, Genre genre) {
    return _remoteProvider.fetchMovies(page, genre);
  }

  @override
  Future<Option<SearchResults>> search(String keyword, int page) {
    return _remoteProvider.search(keyword, page);
  }

  @override
  Future<Option<Movies>> fetchRelated(int movieId, int page) {
    return _remoteProvider.fetchRelated(movieId, page);
  }

  @override
  Future<Option<Actors>> fetchActors(int movieId, int page) {
    return _remoteProvider.fetchActors(movieId, page);
  }

  @override
  Future<Option<SeasonFiles>> fetchSeasonFiles(int id, int season) async {
    return fetchAndCache<SeasonFiles>(
      localFetcher: () => _localProvider.getSeasonFiles(id, season),
      remoteFetcher: () => _remoteProvider.fetchSeasonFiles(id, season),
      cacheWriter: (SeasonFiles t) => _localProvider.writeSeasonFiles(id, t),
    );
  }

  @override
  Future<Option<MovieData>> fetchMovie(int movieId) async {
    return fetchAndCache<MovieData>(
      localFetcher: () => _localProvider.getMovieData(movieId),
      remoteFetcher: () => _remoteProvider.fetchMovie(movieId),
      cacheWriter: (MovieData t) => _localProvider.writeMovieData(t),
    );
  }

  @override
  Future<Option<Movies>> fetchPopularMovies() {
    return _remoteProvider.fetchPopularMovies();
  }

  @override
  Future<Option<Movies>> fetchTopMovies(MovieType type, int page, Period period) {
    return _remoteProvider.fetchTopMovies(type, page, period);
  }

  @override
  Future<bool> getMovieFavoriteStatus({@required int movieId}) {
    return _localProvider.getMovieFavoriteStatus(movieId: movieId);
  }

  @override
  Future<void> setMovieFavoriteStatus({@required int movieId, @required bool favorite}) {
    return _localProvider.setMovieFavoriteStatus(movieId: movieId, favorite: favorite);
  }

  @override
  Future<void> saveMoviePosition(MoviePosition position) {
    return _localProvider.saveMoviePosition(position);
  }

  @override
  Future<List<MoviePosition>> getSavedMovies() {
    return _localProvider.getSavedMovies();
  }

  @override
  Future<List<MovieData>> getMovies() {
    return _localProvider.getMovies();
  }

  Future<Option<T>> fetchAndCache<T>({
    @required Future<Option<T>> Function() localFetcher,
    @required Future<Option<T>> Function() remoteFetcher,
    @required Future<void> Function(T t) cacheWriter,
  }) async {
    final Option<T> localOption = await localFetcher.call();
    return await localOption.fold(
      () async {
        final Option<T> remoteOption = await remoteFetcher.call();
        remoteOption.fold(
          () {},
          (T data) => cacheWriter.call(data),
        );

        return remoteOption;
      },
      (T a) => some(a),
    );
  }
}
