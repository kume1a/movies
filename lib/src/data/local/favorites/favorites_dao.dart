import '../../model/schemas/movie/movie_data_model.dart';

abstract class FavoritesDao {
  Future<bool> getMovieFavoriteStatus(int movieId);
  Future<void> updateMovieFavoriteStatus(int movieId, {required bool isFavorite});
  Future<List<MovieData>> getFavoriteMovies();
}