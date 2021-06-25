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

class TableMovieLanguages {
  TableMovieLanguages._();

  static const String name = 'movie_languages';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnLanguage = 'language';
}

class TableDBMovies {
  TableDBMovies._();

  static const String name = 'db_movies';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnName = 'name';
  static const String columnYear = 'year';
  static const String columnImdbUrl = 'imdb_url';
  static const String columnIsTvShow = 'is_tv_show';
  static const String columnDuration = 'duration';
  static const String columnCanBePlayed = 'can_be_played';
  static const String columnPoster = 'poster';
  static const String columnImdbRating = 'imdb_rating';
  static const String columnVoterCount = 'voter_count';
  static const String columnPlot = 'plot';
  static const String columnIsFavorite = 'is_favorite';
  static const String columnSaveTimestamp = 'save_timestamp';
}

class TableDBSeasonFiles {
  TableDBSeasonFiles._();

  static const String name = 'season_files';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnSeason = 'season';
}

class TableDBEpisodes {
  TableDBEpisodes._();

  static const String name = 'episodes';

  static const String columnId = 'id';
  static const String columnSeasonFilesId = 'season_files_id';
  static const String columnEpisode = 'episode';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';
  static const String columnRating = 'rating';
  static const String columnPoster = 'poster';
}

class TableEpisodeCovers {
  TableEpisodeCovers._();

  static const String name = 'episode_covers';

  static const String columnId = 'id';
  static const String columnEpisodeId = 'episode_id';
  static const String columnResolution = 'resolution';
  static const String columnCover = 'cover';
}

class TableDBEpisodeFiles {
  TableDBEpisodeFiles._();

  static const String name = 'episode_files';

  static const String columnId = 'id';
  static const String columnEpisodeId = 'episode_id';
  static const String columnLanguage = 'language';
  static const String columnEpisodeFileId = 'episode_file_id';
  static const String columnQuality = 'quality';
  static const String columnSrc = 'src';
  static const String columnDuration = 'duration';
}