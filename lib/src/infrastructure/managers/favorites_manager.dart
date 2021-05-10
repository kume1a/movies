import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/managers/i_favorites_manager.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';
import 'package:movo/src/utils.dart';

@LazySingleton(as: IFavoritesManager)
class FavoritesManager implements IFavoritesManager {
  final HiveBoxHolder _boxHolder;

  const FavoritesManager(this._boxHolder);

  @override
  Future<bool> getMovieFavoriteStatus(int movieId) async {
    final MovieData movieData = _boxHolder.movieData.get(movieId);
    return movieData?.favorite ?? false;
  }

  @override
  Future<void> updateMovieFavoriteStatus(int movieId, {@required bool isFavorite}) async {
    final Option<MovieData> curr = optionOf(_boxHolder.movieData.get(movieId));
    curr.foldSome(
      (MovieData movie) => _boxHolder.movieData.put(
        movieId,
        movie
          ..favorite = isFavorite
          ..saveTimestamp = isFavorite ? DateTime.now().millisecondsSinceEpoch : -1,
      ),
    );
  }

  @override
  Future<List<MovieData>> getFavoriteMovies() async {
    return _boxHolder.movieData.values.toList()
      ..removeWhere((MovieData e) => !e.favorite)
      ..sort((MovieData a, MovieData b) => a.saveTimestamp.compareTo(b.saveTimestamp) * -1);
  }
}
