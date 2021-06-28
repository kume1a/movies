import 'package:freezed_annotation/freezed_annotation.dart';

import '../../schemas/movie/movie_data_schema.dart';
import '../../schemas/movie/movies_schema.dart';
import 'movie_data.dart';

part 'movies.freezed.dart';

@freezed
class Movies with _$Movies {
  const factory Movies({
    required List<MovieData> data,
    required int totalCount,
    required int totalPages,
  }) = _Movies;

  factory Movies.fromSchema(MoviesSchema schema) {
    return Movies(
      data: schema.data?.map((MovieDataSchema e) => MovieData.fromSchema(e)).toList() ?? List<MovieData>.empty(),
      totalCount: schema.meta?.pagination?.total ?? 0,
      totalPages: schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory Movies.empty() {
    return Movies(
      data: List<MovieData>.empty(growable: true),
      totalCount: 0,
      totalPages: 0,
    );
  }
}
