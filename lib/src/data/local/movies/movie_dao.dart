import 'package:injectable/injectable.dart';

import '../../model/core/option.dart';
import '../../model/models/movies/movie_data.dart';
import '../../model/models/seasons/season.dart';
import '../../model/schemas/core/enums.dart';
import 'db_movie/db_movie.dart';
import 'db_movie/db_movie_dao.dart';
import 'movie_cover/movie_cover.dart';
import 'movie_cover/movie_cover_dao.dart';
import 'movie_genre/movie_genre.dart';
import 'movie_genre/movie_genre_dao.dart';
import 'movie_language/movie_language.dart';
import 'movie_language/movie_language_dao.dart';
import 'movie_season/movie_season_dao.dart';
import 'movie_secondary_cover/movie_secondary_cover.dart';
import 'movie_secondary_cover/movie_secondary_cover_dao.dart';
import 'movie_trailer/movie_trailer.dart';
import 'movie_trailer/movie_trailer_dao.dart';

@lazySingleton
class MovieDao {
  MovieDao(
    this._dbMovieDao,
    this._movieCoverDao,
    this._movieSecondaryCoverDao,
    this._movieGenreDao,
    this._movieLanguageDao,
    this._movieTrailerDao,
    this._movieSeasonDao,
  );

  final DBMovieDao _dbMovieDao;
  final MovieCoverDao _movieCoverDao;
  final MovieSecondaryCoverDao _movieSecondaryCoverDao;
  final MovieGenreDao _movieGenreDao;
  final MovieLanguageDao _movieLanguageDao;
  final MovieTrailerDao _movieTrailerDao;
  final MovieSeasonDao _movieSeasonDao;

  Future<Option<MovieData>> getMovieData(int movieId) async {
    final DBMovie? dbMovie = await _dbMovieDao.getDBMovie(movieId);
    if (dbMovie == null) return none();

    final List<MovieCover> movieCovers = await _movieCoverDao.getMovieCovers(movieId);
    final Map<ImageSize, String> covers = <ImageSize, String>{for (MovieCover e in movieCovers) e.imageSize: e.cover};

    final List<MovieSecondaryCover> movieSecondaryCovers =
        await _movieSecondaryCoverDao.getMovieSecondaryCovers(movieId);
    final Map<Resolution, String> secondaryCovers = <Resolution, String>{
      for (MovieSecondaryCover e in movieSecondaryCovers) e.resolution: e.secondaryCover
    };

    final List<MovieGenre> movieGenres = await _movieGenreDao.getMovieGenres(movieId);
    final List<String> genres = movieGenres.map((MovieGenre e) => e.genre).toList();

    final List<MovieLanguage> movieLanguages = await _movieLanguageDao.getMovieLanguages(movieId);
    final List<Language> languages = movieLanguages.map((MovieLanguage e) => e.language).toList();

    final List<MovieTrailer> movieTrailers = await _movieTrailerDao.getMovieTrailers(movieId);
    final Map<Language, String> trailers = <Language, String>{
      for (MovieTrailer e in movieTrailers) e.language: e.trailerUrl
    };

    final List<Season> seasons = await _movieSeasonDao.getMovieSeasons(dbMovie.id!);

    return some(MovieData(
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
      favorite: dbMovie.isFavorite,
    ));
  }

  Future<void> writeMovieData(MovieData movieData) async {
    await _dbMovieDao.insertDBMovie(DBMovie(
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
      isFavorite: movieData.favorite,
      saveTimestamp: movieData.saveTimestamp,
    ));

    movieData.covers.entries.map((MapEntry<ImageSize, String> entry) {
      return MovieCover(
        movieId: movieData.movieId,
        imageSize: entry.key,
        cover: entry.value,
      );
    }).forEach((MovieCover e) => _movieCoverDao.insertMovieCover(e));

    movieData.secondaryCovers.entries.map((MapEntry<Resolution, String> e) {
      return MovieSecondaryCover(
        movieId: movieData.movieId,
        resolution: e.key,
        secondaryCover: e.value,
      );
    }).forEach((MovieSecondaryCover e) => _movieSecondaryCoverDao.insertMovieSecondaryCover(e));

    movieData.genres.map((String e) {
      return MovieGenre(
        movieId: movieData.movieId,
        genre: e,
      );
    }).forEach((MovieGenre e) => _movieGenreDao.insertMovieGenre(e));

    movieData.languages.map((Language e) {
      return MovieLanguage(
        movieId: movieData.movieId,
        language: e,
      );
    }).forEach((MovieLanguage e) => _movieLanguageDao.insertMovieLanguage(e));

    movieData.trailers.entries.map((MapEntry<Language, String> e) {
      return MovieTrailer(
        movieId: movieData.movieId,
        language: e.key,
        trailerUrl: e.value,
      );
    }).forEach((MovieTrailer e) => _movieTrailerDao.insertMovieTrailer(e));

    for (final Season e in movieData.seasons) {
      _movieSeasonDao.insertMovieSeason(e);
    }
  }
}
