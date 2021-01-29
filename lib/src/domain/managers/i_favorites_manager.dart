import 'package:meta/meta.dart';

abstract class IFavoritesManager {
  Future<bool> getMovieFavoriteStatus(int movieId);
  Future<void> updateMovieFavoriteStatus(int movieId, {@required bool isFavorite});
}