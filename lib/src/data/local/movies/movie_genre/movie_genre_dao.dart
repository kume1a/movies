import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../tables.dart';
import 'movie_genre.dart';

@lazySingleton
class MovieGenreDao {
  MovieGenreDao(this._db);

  final Database _db;

  Future<void> insertMovieGenre(MovieGenre movieGenre) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieGenres.name}
      (
        ${TableMovieGenres.columnId},
        ${TableMovieGenres.columnMovieId},
        ${TableMovieGenres.columnGenre}
      ) VALUES (?, ?, ?);
    ''', <Object?>[
      movieGenre.id,
      movieGenre.movieId,
      movieGenre.genre,
    ]);
  }

  Future<List<MovieGenre>> getMovieGenres(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieGenres.name} 
        WHERE ${TableMovieGenres.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => MovieGenre.fromMap(e)).toList();
  }
}
