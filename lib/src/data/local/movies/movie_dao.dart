import 'package:injectable/injectable.dart';

import '../../model/core/option.dart';
import '../../model/models/movies/movie_data.dart';
import '../../model/models/seasons/season_files.dart';
import '../hive_box_holder.dart';

@lazySingleton
class MovieDao {
  MovieDao(this._boxHolder);

  final HiveBoxHolder _boxHolder;

  Future<Option<MovieData>> getMovieData(int movieId) async {
    return optionOf(_boxHolder.movieData.get(movieId));
  }

  Future<void> writeMovieData(MovieData movieData) async {
    await _boxHolder.movieData.put(movieData.movieId, movieData);
  }

  Future<Option<SeasonFiles>> getSeasonFiles(int id, int season) async {
    return optionOf(_boxHolder.seasonFiles.get('${id}_$season'));
  }

  Future<void> writeSeasonFiles(int id, SeasonFiles seasonFiles) async {
    await _boxHolder.seasonFiles.put('${id}_${seasonFiles.season}', seasonFiles);
  }
}
