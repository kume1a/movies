import 'package:injectable/injectable.dart';

import '../../model/models/movie_groups/movie_group.dart';
import '../favorite_movie/favorite_movie_dao.dart';
import 'db_movie_group/db_movie_group.dart';
import 'db_movie_group/db_movie_group_dao.dart';

@lazySingleton
class MovieGroupDao {
  MovieGroupDao(
    this._movieGroupDao,
    this._favoriteMovieDao,
  );

  final DBMovieGroupDao _movieGroupDao;
  final FavoriteMovieDao _favoriteMovieDao;

  Future<void> saveMovieGroup(String groupName) async {
    await _movieGroupDao.insertMovieGroup(DBMovieGroup(
      name: groupName,
      timestamp: 0,
    ));
  }

  Future<List<MovieGroup>> getMovieGroups() async {
    final List<DBMovieGroup> dbMovieGroups = await _movieGroupDao.getMovieGroups();
    final List<MovieGroup> movieGroups = List<MovieGroup>.empty(growable: true);
    for (final DBMovieGroup dbMovieGroup in dbMovieGroups) {
      final List<String> movieNames = await _favoriteMovieDao.getMovieNamesForGroup(dbMovieGroup.id!);
      movieGroups.add(MovieGroup(
        name: dbMovieGroup.name,
        movieNames: movieNames,
      ));
    }
    return movieGroups;
  }
}
