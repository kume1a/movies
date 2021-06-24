import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'movie_trailer.dart';

@lazySingleton
class MovieTrailerDao {
  MovieTrailerDao(this._db);

  final Database _db;

  Future<void> insertMovieTrailer(MovieTrailer movieTrailer) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieTrailers.name}
      (
        ${TableMovieTrailers.columnId},
        ${TableMovieTrailers.columnMovieId},
        ${TableMovieTrailers.columnLanguage},
        ${TableMovieTrailers.columnTrailerUrl}
      ) VALUES (?, ?, ?, ?);
    ''', <Object?>[
      movieTrailer.id,
      movieTrailer.movieId,
      EnumToString.convertToString(movieTrailer.language),
      movieTrailer.trailerUrl,
    ]);
  }

  Future<List<MovieTrailer>> getMovieTrailers(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieTrailers.name}
        WHERE ${TableMovieTrailers.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => MovieTrailer.fromMap(e)).toList();
  }
}
