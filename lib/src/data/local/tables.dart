class TableSeasons {
  TableSeasons._();

  static const String name = 'seasons';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnNumber = 'number';
  static const String columnName = 'name';
  static const String columnEpisodesCount = 'episode_count';
}

class TableMovieCovers {
  TableMovieCovers._();

  static const String name = 'movie_covers';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnImageSize = 'image_size';
  static const String columnCover = 'cover';
}

class TableMovieSecondaryCovers {
  TableMovieSecondaryCovers._();

  static const String name = 'movie_secondary_covers';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnResolution = 'resolution';
  static const String columnSecondaryCover = 'secondary_cover';
}

class TableMovieTrailers {
  TableMovieTrailers._();

  static const String name = 'movie_trailers';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnLanguage = 'language';
  static const String columnTrailerUrl = 'trailer_url';
}

class TableMovieGenres {
  TableMovieGenres._();

  static const String name = 'movie_genres';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnGenre = 'genre';
}


class TableMoviesData {
  TableMoviesData._();

  static const String name = 'movies_data';

  static const String columnId = 'id';
  static const String columnMovieId = 'movieId';
  static const String columnName = 'name';
  static const String columnYear = 'year';
  static const String columnImdbUrl = 'imdbUrl';
  static const String columnIsTvShow = 'isTvShow';
  static const String columnDuration = 'duration';
  static const String columnCanBePlayed = 'canBePlayed';
  static const String columnPoster = 'poster';
  static const String columnImdbRating = 'imdbRating';
  static const String columnVoterCount = 'voterCount';
  static const String columnCovers = 'covers';
  static const String columnSecondaryCovers = 'secondaryCovers';
  static const String columnPlot = 'plot';
  static const String columnGenres = 'genres';
  static const String columnTrailers = 'trailers';
  static const String columnLanguages = 'languages';
  static const String columnSeasons = 'seasons';
  static const String columnFavorite = 'favorite';
  static const String columnSaveTimestamp = 'saveTimestamp';
}
