
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/managers/i_saved_movies_manager.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

@LazySingleton(as: ISavedMoviesManager)
class SavedMoviesManager implements ISavedMoviesManager {
  final HiveBoxHolder _boxHolder;

  const SavedMoviesManager(this._boxHolder);

  @override
  Future<void> saveMoviePosition(MoviePosition position) async {
    await _boxHolder.continueWatching.put(position.movieId, position);
  }

  @override
  Future<Option<MoviePosition>> getSavedMovie(int movieId) async {
    final MoviePosition moviePosition = _boxHolder.continueWatching.get(movieId);
    return optionOf(moviePosition);
  }

  @override
  Future<List<MoviePosition>> getSavedMovies() async {
    final List<MoviePosition> savedMovies = _boxHolder.continueWatching.values.toList();
    savedMovies.sort((MoviePosition a, MoviePosition b) => a.timestamp.compareTo(b.timestamp) * -1);

    return savedMovies;
  }
}