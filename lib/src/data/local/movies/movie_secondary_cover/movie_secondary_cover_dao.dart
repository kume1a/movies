import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/helpers/enum_to_string.dart';
import '../../tables.dart';
import 'movie_secondary_cover.dart';

@lazySingleton
class MovieSecondaryCoverDao {
  MovieSecondaryCoverDao(this._db);

  final Database _db;

  Future<void> insertMovieSecondaryCover(MovieSecondaryCover movieSecondaryCover) async {
    await _db.rawInsert('''
      INSERT INTO ${TableMovieSecondaryCovers.name} 
      (
        ${TableMovieSecondaryCovers.columnId},
        ${TableMovieSecondaryCovers.columnMovieId},
        ${TableMovieSecondaryCovers.columnResolution},
        ${TableMovieSecondaryCovers.columnSecondaryCover}
      ) VALUES (?, ?, ?, ?);
    ''', <Object?>[
      movieSecondaryCover.id,
      movieSecondaryCover.movieId,
      EnumToString.convertToString(movieSecondaryCover.resolution),
      movieSecondaryCover.secondaryCover,
    ]);
  }

  Future<List<MovieSecondaryCover>> getMovieSecondaryCovers(int movieId) async {
    final List<Map<String, Object?>> result = await _db.rawQuery('''
      SELECT * FROM ${TableMovieSecondaryCovers.name}
        WHERE ${TableMovieSecondaryCovers.columnMovieId} = ?;
    ''', <Object?>[
      movieId,
    ]);

    return result.map((Map<String, Object?> e) => MovieSecondaryCover.fromMap(e)).toList();
  }
}
