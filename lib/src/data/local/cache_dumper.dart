import 'package:injectable/injectable.dart';

import 'movies/movie_dao.dart';
import 'season_files/season_files_dao.dart';

@injectable
class CacheDumper {
  const CacheDumper(
    this._movieDao,
    this._seasonFileDao,
  );

  final MovieDao _movieDao;
  final SeasonFileDao _seasonFileDao;

  Future<void> dumpCache() async {
    await _seasonFileDao.deleteSeasonFiles();
    await _movieDao.deleteMovies();
  }

  Future<void> dumpSeasonFiles() async => _seasonFileDao.deleteSeasonFiles();
}
