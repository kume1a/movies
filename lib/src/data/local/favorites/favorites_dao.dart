import '../../model/models/movies/movie_data.dart';

abstract class FavoritesDao {
  Future<bool> getMovieFavoriteStatus(int movieId);
  Future<void> updateMovieFavoriteStatus(int movieId, {required bool isFavorite});
  Future<List<MovieData>> getFavoriteMovies();
}