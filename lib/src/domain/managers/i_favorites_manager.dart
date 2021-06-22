import 'package:meta/meta.dart';

import '../movie/movie_data_model.dart';

abstract class IFavoritesManager {
  Future<bool> getMovieFavoriteStatus(int movieId);
  Future<void> updateMovieFavoriteStatus(int movieId, {@required bool isFavorite});
  Future<List<MovieData>> getFavoriteMovies();
}