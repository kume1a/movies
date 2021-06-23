import '../../model/core/option.dart';
import '../../model/models/movies/movie_position.dart';

abstract class SavedMovieDao {
  Future<void> saveMoviePosition(MoviePosition position);
  Future<Option<MoviePosition>> getSavedMovie(int movieId);
  Future<List<MoviePosition>> getSavedMovies();
}