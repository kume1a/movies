import '../../schemas/movie/movie_data_schema.dart';
import '../../schemas/movie/movies_schema.dart';
import 'movie_data.dart';

class Movies {
  const Movies._(this.data, this.totalCount, this.totalPages);

  factory Movies.fromSchema(MoviesSchema schema) {
    return Movies._(
      schema.data?.map((MovieDataSchema e) => MovieData.fromSchema(e)).toList() ?? List<MovieData>.empty(),
      schema.meta?.pagination?.total ?? 0,
      schema.meta?.pagination?.totalPages ?? 0,
    );
  }

  factory Movies.empty() {
    return Movies._(List<MovieData>.empty(growable: true), 0, 0);
  }

  final List<MovieData> data;
  final int totalCount;
  final int totalPages;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movies && runtimeType == other.runtimeType && data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() {
    return 'Movies{data: $data}';
  }
}
