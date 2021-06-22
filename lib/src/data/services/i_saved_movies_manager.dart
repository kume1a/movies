import 'package:dartz/dartz.dart';

import '../models/movie_position/movie_position_model.dart';

abstract class ISavedMoviesManager {
  Future<void> saveMoviePosition(MoviePosition position);
  Future<Option<MoviePosition>> getSavedMovie(int movieId);
  Future<List<MoviePosition>> getSavedMovies();
}