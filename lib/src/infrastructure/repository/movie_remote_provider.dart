import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http show get;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../domain/actors/actors_model.dart';
import '../../domain/actors/actors_schema.dart';
import '../../domain/actors/season_files/season_files_model.dart';
import '../../domain/actors/season_files/season_files_schema.dart';
import '../../domain/core/enums.dart';
import '../../domain/movie/movie_data_model.dart';
import '../../domain/movie/movie_data_schema.dart';
import '../../domain/movies/movies_model.dart';
import '../../domain/movies/movies_schema.dart';
import '../../domain/search/search_results_model.dart';
import '../../domain/search/search_results_schema.dart';

const String authority = 'https://api.adjaranet.com';
const String base = 'api.adjaranet.com';
const String apiBase = '/api/v1';
const Map<String, String> headers = <String, String>{
  'User-Agent':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36',
  'x-source': 'adjaranet',
  'origin': authority,
  'referer': authority
};

const int moviesPageSize = 20;
const int topMoviesPageSize = 20;
const int actorsPageSize = 12;
const int relatedMoviesPageSize = 10;
const int searchPerPage = 20;

@lazySingleton
class MovieRemoteProvider {
  MovieRemoteProvider();

  Future<String> _get(String path, Map<String, String> queryParams) async {
    log('MovieRepository._get: path = $path');
    final Uri uri = Uri.https(base, path, queryParams);
    final Response response = await http.get(uri, headers: headers);

    return utf8.decode(response.bodyBytes);
  }

  Future<Option<Movies>> fetchMovies(int page, Genre genre) async {
    // 'filters[imdb_rating_range]': '0,10',
    // 'filters[language]': 'GEO',
    // 'filters[type]': 'movie',
    final Map<String, String> params = <String, String>{
      'page': page.toString(),
      'per_page': moviesPageSize.toString(),
      'filters[year_range]': '1900,2020',
      'filters[init]': 'true',
      'filters[sort]': '-upload_date',
      'filters[with_actors]': '3',
      'filters[with_directors]': '1',
      'filters[with_files]': 'yes',
      'sort': ' -upload_date',
      'source': 'adjaranet'
    };
    final int genreId = _mapGenreToId(genre);
    if (genreId != null) {
      params['filters[genre]'] = genreId.toString();
    }

    try {
      final String json = await _get('$apiBase/movies', params);
      final MoviesSchema schema = MoviesSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final Movies movies = Movies.fromSchema(schema);
      return some(movies);
    } on Exception catch (e) {
      log('MovieRepository.fetchMovies: failure', error: e);
    }
    return none();
  }

  Future<Option<Movies>> fetchPopularMovies() async {
    const Map<String, String> params = <String, String>{'source': 'adjaranet'};

    try {
      final String json = await _get('$apiBase/movies/featured', params);
      final MoviesSchema schema = MoviesSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final Movies movies = Movies.fromSchema(schema);
      return some(movies);
    } on Exception catch (e) {
      log('MovieRepository.fetchPopularMovies: failure', error: e);
    }
    return none();
  }

  Future<Option<Movies>> fetchTopMovies(
    MovieType type,
    int page,
    Period period,
  ) async {
    final Map<String, String> params = <String, String>{
      'type': type.toString().split('.').last,
      'period': period.toString().split('.').last,
      'page': page.toString(),
      'per_page': topMoviesPageSize.toString(),
      'filters[with_actors]': '3',
      'filters[with_directors]': '1',
      'source': 'adjaranet'
    };

    try {
      final String json = await _get('$apiBase/movies/top', params);
      final MoviesSchema schema = MoviesSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final Movies movies = Movies.fromSchema(schema);
      return some(movies);
    } on Exception catch (e) {
      log('MovieRepository.fetchTopMovies: failure', error: e);
    }
    return none();
  }

  Future<Option<MovieData>> fetchMovie(int movieId) async {
    const Map<String, String> params = <String, String>{
      'filters[with_directors]': '3',
      'source': 'adjaranet'
    };

    try {
      final String json = await _get('$apiBase/movies/$movieId', params);
      final MovieSchema schema = MovieSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final MovieData movie = MovieData.fromSchema(schema.data);
      return some(movie);
    } on Exception catch (e) {
      log('MovieRepository.fetchMovie: failure', error: e);
    }
    return none();
  }

  Future<Option<SeasonFiles>> fetchSeasonFiles(int id, int season) async {
    const Map<String, String> params = <String, String>{'source': 'adjaranet'};

    try {
      final String json = await _get('$apiBase/movies/$id/season-files/$season', params);
      final SeasonFilesSchema schema =
          SeasonFilesSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final SeasonFiles seasonFiles = SeasonFiles.fromSchema(season, schema);
      return some(seasonFiles);
    } on Exception catch (e) {
      log('MovieRepository.fetchSeasonFiles: failure', error: e);
    }
    return none();
  }

  Future<Option<Actors>> fetchActors(int movieId, int page) async {
    final Map<String, String> params = <String, String>{
      'page': page.toString(),
      'per_page': actorsPageSize.toString(),
      'filters[role]': 'cast',
      'source': 'adjaranet'
    };

    try {
      final String json = await _get('$apiBase/movies/$movieId/persons', params);
      final ActorsSchema schema = ActorsSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final Actors actors = Actors.fromSchema(schema);
      return some(actors);
    } on Exception catch (e) {
      log('MovieRepository.fetchActors: failure', error: e);
    }
    return none();
  }

  Future<Option<Movies>> fetchRelated(int movieId, int page) async {
    final Map<String, String> params = <String, String>{
      'page': page.toString(),
      'per_page': relatedMoviesPageSize.toString(),
      'filters[with_actors]': '3',
      'filters[with_directors]': '1',
      'source': 'adjaranet'
    };

    try {
      final String json = await _get('$apiBase/movies/$movieId/related', params);
      final MoviesSchema schema = MoviesSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final Movies movies = Movies.fromSchema(schema);
      return some(movies);
    } on Exception catch (e) {
      log('MovieRepository.fetchRelated: failure', error: e);
    }
    return none();
  }

  Future<Option<SearchResults>> search(String keyword, int page) async {
    final Map<String, String> params = <String, String>{
      'movie_filters[keyword]': keyword,
      'movie_filters[init]': 'true',
      'movie_filters[with_actors]': '3',
      'movie_filters[with_directors]': '1',
      'filters[type]': 'movie',
      'keywords': keyword,
      'page': page.toString(),
      'per_page': searchPerPage.toString(),
      'source': 'adjaranet',
    };

    try {
      final String json = await _get('$apiBase/search', params);
      final SearchResultsSchema schema =
          SearchResultsSchema.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final SearchResults searchResults = SearchResults.fromSchema(schema);
      return some(searchResults);
    } on Exception catch (e) {
      log('MovieRepository.search: failure', error: e);
    }
    return none();
  }

  int _mapGenreToId(Genre genre) {
    switch (genre) {
      case Genre.all:
        return null;
      case Genre.animated:
        return 265;
      case Genre.biographical:
        return 253;
      case Genre.detective:
        return 259;
      case Genre.documentary:
        return 252;
      case Genre.drama:
        return 249;
      case Genre.erotic:
        return 269;
      case Genre.western:
        return 267;
      case Genre.historical:
        return 264;
      case Genre.comedy:
        return 258;
      case Genre.melodrama:
        return 260;
      case Genre.musical:
        return 268;
      case Genre.short:
        return 273;
      case Genre.mysticism:
        return 256;
      case Genre.theatreMusical:
        return 262;
      case Genre.sharpStory:
        return 248;
      case Genre.adventure:
        return 266;
      case Genre.fantastic:
        return 257;
      case Genre.military:
        return 251;
      case Genre.family:
        return 263;
      case Genre.horror:
        return 255;
      case Genre.sports:
        return 254;
      case Genre.thriller:
        return 250;
      case Genre.fabulous:
        return 261;
      case Genre.anime:
        return 318;
    }
    return 0;
  }
}
