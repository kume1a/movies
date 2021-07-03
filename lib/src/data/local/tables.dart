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

class TableMovies {
  TableMovies._();

  static const String name = 'movies';

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
}

class TableSeasonFiles {
  TableSeasonFiles._();

  static const String name = 'season_files';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnSeason = 'season';
}

class TableEpisodes {
  TableEpisodes._();

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

class TableEpisodeFiles {
  TableEpisodeFiles._();

  static const String name = 'episode_files';

  static const String columnId = 'id';
  static const String columnEpisodeId = 'episode_id';
  static const String columnLanguage = 'language';
  static const String columnEpisodeFileId = 'episode_file_id';
  static const String columnQuality = 'quality';
  static const String columnSrc = 'src';
  static const String columnDuration = 'duration';
}

class TableSearchResults {
  TableSearchResults._();

  static const String name = 'search_results';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnSearchType = 'search_type';
  static const String columnName = 'name';
  static const String columnDescription = 'description';
  static const String columnPoster = 'poster';
  static const String columnSecondaryPoster = 'secondary_poster';
  static const String columnIsTvShow = 'is_tv_show';
  static const String columnTimestamp = 'timestamp';
}

class TableMoviePositions {
  TableMoviePositions._();

  static const String name = 'movie_positions';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnDurationInMillis = 'duration_in_millis';
  static const String columnLeftAt = 'left_at';
  static const String columnIsTvShow = 'is_tv_show';
  static const String columnSeason = 'season';
  static const String columnEpisode = 'episode';
  static const String columnSaveTimestamp = 'save_timestamp';
}

class TableFavoriteMovies {
  TableFavoriteMovies._();

  static const String name = 'favorite_movies';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnGroupId = 'group_id';
  static const String columnMovieName = 'movie_name';
  static const String columnTimestamp = 'timestamp';
}

class TableMovieGroups {
  TableMovieGroups._();

  static const String name = 'movie_groups';

  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnTimestamp = 'timestamp';
}

class TableWatchedMovies {
  TableWatchedMovies._();

  static const String name = 'watched_movies';

  static const String columnId = 'id';
  static const String columnMovieId = 'movie_id';
  static const String columnWatchedDurationInMillis = 'watched_duration_in_millis';
  static const String columnDurationInMillis = 'duration_in_millis';
  static const String columnIsTvShow = 'is_tv_show';
  static const String columnSeason = 'season';
  static const String columnEpisode = 'episode';
}
