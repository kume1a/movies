import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants.dart';
import '../model/schemas/actors/actors_schema.dart';
import '../model/schemas/actors/season_files/season_files_schema.dart';
import '../model/schemas/movie/movie_data_schema.dart';
import '../model/schemas/movies/movies_schema.dart';
import '../model/schemas/search/search_results_schema.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.apiUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/movies')
  Future<MoviesSchema> getMovies({
    @Query('page') String? page,
    @Query('per_page') String? perPage,
    @Query('filters[year_range]') String? filterYearRange,
    @Query('filters[init]') String? filterInit,
    @Query('filters[sort]') String? filterSort,
    @Query('filters[with_actors]') String? filterWithActors,
    @Query('filters[with_directors]') String? filterWithDirectors,
    @Query('filters[with_files]') String? filterWithFiles,
    @Query('filters[imdb_rating_range]') String? filterImdbRatingRange,
    @Query('filters[language]') String? filterLanguage,
    @Query('filters[type]') String? filterType,
    @Query('filters[genre]') String? filterGenre,
    @Query('sort') String? sort,
    @Query('source') String? source,
  });

  @GET('/movies/featured')
  Future<MoviesSchema> getPopularMovies({
    @Query('source') String? source,
  });

  @GET('/movies/top')
  Future<MoviesSchema> getTopMovies({
    @Query('type') String? type,
    @Query('period') String? period,
    @Query('page') String? page,
    @Query('per_page') String? perPage,
    @Query('filters[with_actors]') String? filterWithActors,
    @Query('filters[with_directors]') String? filterWithDirectors,
    @Query('source') String? source,
  });

  @GET('/movies/{movieId}')
  Future<MovieSchema> getMovie({
    @Path('movieId') required int movieId,
    @Query('filters[with_directors]') String? filterWithDirectors,
    @Query('source') String? source,
  });

  @GET('/movies/{movieId}/season-files/{season}')
  Future<SeasonFilesSchema> getSeasonFiles({
    @Path('movieId') required int movieId,
    @Path('season') required int season,
    @Query('source') String? source,
  });

  @GET('/movies/{movieId}/persons')
  Future<ActorsSchema> getActors({
    @Path('movieId') required int movieId,
    @Query('page') String? page,
    @Query('per_page') String? perPage,
    @Query('filters[role]') String? filterRole,
    @Query('source') String? source,
  });

  @GET('/movies/{movieId}/related')
  Future<MoviesSchema> getRelatedMovies({
    @Path('movieId') required int movieId,
    @Query('page') String? page,
    @Query('per_page') String? perPage,
    @Query('filters[with_actors]') String? filterWithActors,
    @Query('filters[with_directors]') String? filterWithDirectors,
    @Query('source') String? source,
  });

  @GET('/search')
  Future<SearchResultsSchema> search({
    @Query('movie_filters[keyword]') String? filterKeyword,
    @Query('movie_filters[init]') String? filterInit,
    @Query('movie_filters[with_actors]') String? filterWithActors,
    @Query('movie_filters[with_directors]') String? filterWithDirectors,
    @Query('filters[type]') String? filterType,
    @Query('keywords') String? keywords,
    @Query('page') String? page,
    @Query('per_page') String? perPage,
    @Query('source') String? source,
  });
}
