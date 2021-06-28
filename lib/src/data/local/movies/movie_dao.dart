import 'package:injectable/injectable.dart';

import '../../model/models/movies/movie_data.dart';
import '../../model/models/seasons/season.dart';
import '../../model/schemas/core/enums.dart';
import 'db_movie/db_movie.dart';
import 'db_movie/db_movie_dao.dart';
import 'db_movie_cover/db_movie_cover.dart';
import 'db_movie_cover/db_movie_cover_dao.dart';
import 'db_movie_genre/db_movie_genre.dart';
import 'db_movie_genre/db_movie_genre_dao.dart';
import 'db_movie_language/db_movie_language.dart';
import 'db_movie_language/db_movie_language_dao.dart';
import 'db_movie_season/db_movie_season_dao.dart';
import 'db_movie_secondary_cover/db_movie_secondary_cover.dart';
import 'db_movie_secondary_cover/db_movie_secondary_cover_dao.dart';
import 'db_movie_trailer/db_movie_trailer.dart';
import 'db_movie_trailer/db_movie_trailer_dao.dart';

@lazySingleton
class MovieDao {
  MovieDao(
    this._movieDao,
    this._movieCoverDao,
    this._movieSecondaryCoverDao,
    this._movieGenreDao,
    this._movieLanguageDao,
    this._movieTrailerDao,
    this._movieSeasonDao,
  );

  final DBMovieDao _movieDao;
  final DBMovieCoverDao _movieCoverDao;
  final DBMovieSecondaryCoverDao _movieSecondaryCoverDao;
  final DBMovieGenreDao _movieGenreDao;
  final DBMovieLanguageDao _movieLanguageDao;
  final DBMovieTrailerDao _movieTrailerDao;
  final DBMovieSeasonDao _movieSeasonDao;

  Future<MovieData?> getMovieData(int movieId) async {
    final DBMovie? dbMovie = await _movieDao.getDBMovie(movieId);
    if (dbMovie == null) return null;

    final List<DBMovieCover> movieCovers = await _movieCoverDao.getMovieCovers(movieId);
    final Map<ImageSize, String> covers = <ImageSize, String>{for (DBMovieCover e in movieCovers) e.imageSize: e.cover};

    final List<DBMovieSecondaryCover> movieSecondaryCovers =
        await _movieSecondaryCoverDao.getMovieSecondaryCovers(movieId);
    final Map<Resolution, String> secondaryCovers = <Resolution, String>{
      for (DBMovieSecondaryCover e in movieSecondaryCovers) e.resolution: e.secondaryCover
    };

    final List<DBMovieGenre> movieGenres = await _movieGenreDao.getMovieGenres(movieId);
    final List<String> genres = movieGenres.map((DBMovieGenre e) => e.genre).toList();

    final List<DBMovieLanguage> movieLanguages = await _movieLanguageDao.getMovieLanguages(movieId);
    final List<Language> languages = movieLanguages.map((DBMovieLanguage e) => e.language).toList();

    final List<DBMovieTrailer> movieTrailers = await _movieTrailerDao.getMovieTrailers(movieId);
    final Map<Language, String> trailers = <Language, String>{
      for (DBMovieTrailer e in movieTrailers) e.language: e.trailerUrl
    };

    final List<Season> seasons = await _movieSeasonDao.getMovieSeasons(dbMovie.id!);

    return MovieData(
      id: dbMovie.id ?? -1,
      movieId: dbMovie.movieId,
      name: dbMovie.name,
      year: dbMovie.year,
      imdbUrl: dbMovie.imdbUrl,
      isTvShow: dbMovie.isTvShow,
      duration: dbMovie.duration,
      canBePlayed: dbMovie.canBePlayed,
      poster: dbMovie.poster,
      imdbRating: dbMovie.imdbRating,
      voterCount: dbMovie.voterCount,
      covers: covers,
      secondaryCovers: secondaryCovers,
      plot: dbMovie.plot,
      genres: genres,
      trailers: trailers,
      languages: languages,
      seasons: seasons,
    );
  }

  Future<void> writeMovieData(MovieData movieData) async {
    await _movieDao.insertDBMovie(DBMovie(
      id: movieData.id,
      movieId: movieData.movieId,
      name: movieData.name,
      year: movieData.year,
      imdbUrl: movieData.imdbUrl,
      isTvShow: movieData.isTvShow,
      duration: movieData.duration,
      canBePlayed: movieData.canBePlayed,
      poster: movieData.poster,
      imdbRating: movieData.imdbRating,
      voterCount: movieData.voterCount,
      plot: movieData.plot,
    ));

    for (final MapEntry<ImageSize, String> e in movieData.covers.entries) {
      await _movieCoverDao.insertMovieCover(DBMovieCover(
        movieId: movieData.movieId,
        imageSize: e.key,
        cover: e.value,
      ));
    }

    for (final MapEntry<Resolution, String> e in movieData.secondaryCovers.entries) {
      await _movieSecondaryCoverDao.insertMovieSecondaryCover(DBMovieSecondaryCover(
        movieId: movieData.movieId,
        resolution: e.key,
        secondaryCover: e.value,
      ));
    }

    for (final String genre in movieData.genres) {
      await _movieGenreDao.insertMovieGenre(DBMovieGenre(
        movieId: movieData.movieId,
        genre: genre,
      ));
    }

    for (final Language language in movieData.languages) {
      await _movieLanguageDao.insertMovieLanguage(DBMovieLanguage(
        movieId: movieData.movieId,
        language: language,
      ));
    }

    for (final MapEntry<Language, String> e in movieData.trailers.entries) {
      await _movieTrailerDao.insertMovieTrailer(DBMovieTrailer(
        movieId: movieData.movieId,
        language: e.key,
        trailerUrl: e.value,
      ));
    }

    for (final Season e in movieData.seasons) {
      await _movieSeasonDao.insertMovieSeason(e);
    }
  }

  Future<void> deleteMovies() async {
    await _movieSeasonDao.deleteAll();
    await _movieCoverDao.deleteAll();
    await _movieSecondaryCoverDao.deleteAll();
    await _movieTrailerDao.deleteAll();
    await _movieGenreDao.deleteAll();
    await _movieLanguageDao.deleteAll();
    await _movieDao.deleteAll();
  }
}
