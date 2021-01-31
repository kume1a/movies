import 'package:dartz/dartz.dart';
import 'package:movo/src/domain/actors/actors_model.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movies/movies_model.dart';

import 'search/search_results_model.dart';

abstract class IMovieRepository {
  Future<Option<Movies>> fetchMovies(int page, Genre genre);
  Future<Option<Movies>> fetchTopMovies(MovieType type, int page, Period period);
  Future<Option<Movies>> fetchPopularMovies();
  Future<Option<MovieData>> fetchMovie(int movieId);
  Future<Option<SeasonFiles>> fetchSeasonFiles(int id, int season);
  Future<Option<Actors>> fetchActors(int movieId, int page);
  Future<Option<Movies>> fetchRelated(int movieId, int page);
  Future<Option<SearchResults>> search(String keyword, int page);
}
