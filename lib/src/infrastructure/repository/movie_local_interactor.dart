import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

@lazySingleton
class MovieLocalInteractor {
  final HiveBoxHolder _boxHolder;

  MovieLocalInteractor(this._boxHolder);

  Future<Option<MovieData>> getMovieData(int movieId) async {
    return optionOf(await _boxHolder.movieData.get(movieId));
  }

  Future<void> writeMovieData(MovieData movieData) async {
    await _boxHolder.movieData.put(movieData.movieId, movieData);
  }

  Future<Option<SeasonFiles>> getSeasonFiles(int id, int season) async {
    return optionOf(await _boxHolder.seasonFiles.get('${id}_${season}'));
  }

  Future<void> writeSeasonFiles(int id, SeasonFiles seasonFiles) async {
    await _boxHolder.seasonFiles.put('${id}_${seasonFiles.season}', seasonFiles);
  }

  Future<List<MovieData>> getMovies() async {
    final List<MovieData> movies = _boxHolder.movieData.values.toList();
    movies.sort((MovieData a, MovieData b) => a.name.compareTo(b.name));

    return movies;
  }

  Future<void> setMovieFavoriteStatus({@required int movieId, @required bool favorite}) async {
    final Option<MovieData> curr = await getMovieData(movieId);
    curr.fold(
      () {},
      (MovieData a) => _boxHolder.movieData.put(movieId, a..favorite = favorite),
    );
  }

  Future<bool> getMovieFavoriteStatus({@required int movieId}) async {
    final MovieData movieData = await _boxHolder.movieData.get(movieId);
    return movieData?.favorite ?? false;
  }

  Future<void> saveMoviePosition(MoviePosition position) async {
    await _boxHolder.continueWatching.put(position.movieId, position);
  }

  Future<List<MoviePosition>> getSavedMovies() async {
    List<MoviePosition> savedMovies = _boxHolder.continueWatching.values.toList();
    savedMovies.sort((MoviePosition a, MoviePosition b) => a.timestamp.compareTo(b.timestamp) * -1);

    return savedMovies;
  }
}
