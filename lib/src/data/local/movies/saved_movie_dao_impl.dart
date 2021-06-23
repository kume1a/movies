import 'package:injectable/injectable.dart';

import '../../model/core/option.dart';
import '../../model/models/movies/movie_position.dart';
import '../hive_box_holder.dart';
import 'saved_movie_dao.dart';

@LazySingleton(as: SavedMovieDao)
class SavedMovieDaoImpl implements SavedMovieDao {
  const SavedMovieDaoImpl(this._boxHolder);

  final HiveBoxHolder _boxHolder;

  @override
  Future<void> saveMoviePosition(MoviePosition position) async {
    await _boxHolder.continueWatching.put(position.movieId, position);
  }

  @override
  Future<Option<MoviePosition>> getSavedMovie(int movieId) async {
    final MoviePosition? moviePosition = _boxHolder.continueWatching.get(movieId);
    return optionOf(moviePosition);
  }

  @override
  Future<List<MoviePosition>> getSavedMovies() async {
    final List<MoviePosition> savedMovies = _boxHolder.continueWatching.values.toList();
    savedMovies.sort((MoviePosition a, MoviePosition b) => a.timestamp.compareTo(b.timestamp) * -1);

    return savedMovies;
  }
}