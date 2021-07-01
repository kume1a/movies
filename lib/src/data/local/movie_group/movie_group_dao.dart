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

  Future<int> saveMovieGroup(String groupName) async {
    return _movieGroupDao.insertMovieGroup(DBMovieGroup(
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
        groupId: dbMovieGroup.id ?? -1,
        name: dbMovieGroup.name,
        movieNames: movieNames,
      ));
    }
    return movieGroups;
  }

  Future<MovieGroup?> getMovieGroup(int id) async {
    final DBMovieGroup? movieGroup = await _movieGroupDao.getMovieGroup(id);
    if (movieGroup == null) return null;

    final List<String> movieNames = await _favoriteMovieDao.getMovieNamesForGroup(movieGroup.id!);
    return MovieGroup(
      groupId: movieGroup.id,
      movieNames: movieNames,
      name: movieGroup.name,
    );
  }

  Future<MovieGroup?> getMovieGroupWithMovieId(int movieId) async {
    final int? selectedGroupId = await _favoriteMovieDao.getFavoriteMovieGroupId(movieId);
    if (selectedGroupId == null) return null;

    final DBMovieGroup? movieGroup = await _movieGroupDao.getMovieGroup(selectedGroupId);
    if (movieGroup == null) return null;

    final List<String> movieNames = await _favoriteMovieDao.getMovieNamesForGroup(movieGroup.id!);
    return MovieGroup(
      groupId: movieGroup.id,
      movieNames: movieNames,
      name: movieGroup.name,
    );
  }

  Future<int> count() async => _movieGroupDao.count();

  Future<bool> belongsToMovieGroup(int movieId) async {
    final int? groupId = await _favoriteMovieDao.getFavoriteMovieGroupId(movieId);
    return groupId != null;
  }
}
