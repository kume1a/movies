import 'package:dartz/dartz.dart';

import 'actors/actors_model.dart';
import 'actors/season_files/season_files_model.dart';
import 'core/enums.dart';
import 'movie/movie_data_model.dart';
import 'movies/movies_model.dart';
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
