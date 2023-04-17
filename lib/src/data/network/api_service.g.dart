// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.adjaranet.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MoviesSchema> getMovies({
    page,
    perPage,
    filterYearRange,
    filterInit,
    filterSort,
    filterWithActors,
    filterWithDirectors,
    filterWithFiles,
    filterImdbRatingRange,
    filterLanguage,
    filterType,
    filterGenre,
    sort,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage,
      r'filters[year_range]': filterYearRange,
      r'filters[init]': filterInit,
      r'filters[sort]': filterSort,
      r'filters[with_actors]': filterWithActors,
      r'filters[with_directors]': filterWithDirectors,
      r'filters[with_files]': filterWithFiles,
      r'filters[imdb_rating_range]': filterImdbRatingRange,
      r'filters[language]': filterLanguage,
      r'filters[type]': filterType,
      r'filters[genre]': filterGenre,
      r'sort': sort,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MoviesSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MoviesSchema> getPopularMovies({source}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'source': source};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/featured',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MoviesSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MoviesSchema> getTopMovies({
    type,
    period,
    page,
    perPage,
    filterWithActors,
    filterWithDirectors,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'period': period,
      r'page': page,
      r'per_page': perPage,
      r'filters[with_actors]': filterWithActors,
      r'filters[with_directors]': filterWithDirectors,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/top',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MoviesSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieSchema> getMovie({
    required movieId,
    filterWithDirectors,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'filters[with_directors]': filterWithDirectors,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MovieSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/${movieId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SeasonFilesSchema> getSeasonFiles({
    required movieId,
    required season,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'source': source};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SeasonFilesSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/${movieId}/season-files/${season}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SeasonFilesSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ActorsSchema> getActors({
    required movieId,
    page,
    perPage,
    filterRole,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage,
      r'filters[role]': filterRole,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ActorsSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/${movieId}/persons',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ActorsSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MoviesSchema> getRelatedMovies({
    required movieId,
    page,
    perPage,
    filterWithActors,
    filterWithDirectors,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage,
      r'filters[with_actors]': filterWithActors,
      r'filters[with_directors]': filterWithDirectors,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MoviesSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies/${movieId}/related',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MoviesSchema.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchResultsSchema> search({
    filterKeyword,
    filterInit,
    filterWithActors,
    filterWithDirectors,
    filterType,
    keywords,
    page,
    perPage,
    source,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'movie_filters[keyword]': filterKeyword,
      r'movie_filters[init]': filterInit,
      r'movie_filters[with_actors]': filterWithActors,
      r'movie_filters[with_directors]': filterWithDirectors,
      r'filters[type]': filterType,
      r'keywords': keywords,
      r'page': page,
      r'per_page': perPage,
      r'source': source,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SearchResultsSchema>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/search',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchResultsSchema.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
