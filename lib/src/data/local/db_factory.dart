import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'tables.dart';

class DbFactory {
  static const String _databaseName = 'movo.db';

  static Future<Database> create() async {
    final Database database = await openDatabase(
      _databaseName,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
    return database;
  }

  static FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableSeasons.name} 
      (
        ${TableSeasons.columnId} INTEGER PRIMARY KEY,
        ${TableSeasons.columnMovieId} INTEGER NOT NULL,
        ${TableSeasons.columnNumber} INTEGER NOT NULL,
        ${TableSeasons.columnName} TEXT NOT NULL,
        ${TableSeasons.columnEpisodesCount} INTEGER NOT NULL,
        FOREIGN KEY (${TableSeasons.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieCovers.name}
      (
        ${TableMovieCovers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieCovers.columnImageSize} TEXT NOT NULL,
        ${TableMovieCovers.columnCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieCovers.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieSecondaryCovers.name}
      (
        ${TableMovieSecondaryCovers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieSecondaryCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieSecondaryCovers.columnResolution} TEXT NOT NULL,
        ${TableMovieSecondaryCovers.columnSecondaryCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieSecondaryCovers.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieTrailers.name}
      (
        ${TableMovieTrailers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieTrailers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieTrailers.columnLanguage} TEXT NOT NULL,
        ${TableMovieTrailers.columnTrailerUrl} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieGenres.name}
      (
        ${TableMovieGenres.columnId} INTEGER PRIMARY KEY,
        ${TableMovieGenres.columnMovieId} INTEGER NOT NULL,
        ${TableMovieGenres.columnGenre} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieLanguages.name}
      (
        ${TableMovieLanguages.columnId} INTEGER PRIMARY KEY,
        ${TableMovieLanguages.columnMovieId} INTEGER NOT NULL,
        ${TableMovieLanguages.columnLanguage} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieLanguages.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovies.name}
      (
        ${TableMovies.columnId} INTEGER PRIMARY KEY,
        ${TableMovies.columnMovieId} INTEGER NOT NULL UNIQUE ON CONFLICT IGNORE,
        ${TableMovies.columnName} TEXT NOT NULL,
        ${TableMovies.columnYear} INTEGER NOT NULL,
        ${TableMovies.columnImdbUrl} TEXT NOT NULL,
        ${TableMovies.columnIsTvShow} INTEGER NOT NULL CHECK (${TableMovies.columnIsTvShow} IN (0, 1)),
        ${TableMovies.columnDuration} INTEGER NOT NULL,
        ${TableMovies.columnCanBePlayed} INTEGER NOT NULL CHECK (${TableMovies.columnCanBePlayed} IN (0, 1)),
        ${TableMovies.columnPoster} TEXT NOT NULL,
        ${TableMovies.columnImdbRating} REAL NOT NULL,
        ${TableMovies.columnVoterCount} INTEGER NOT NULL,
        ${TableMovies.columnPlot} TEXT NOT NULL
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableSeasonFiles.name}
      (
        ${TableSeasonFiles.columnId} INTEGER PRIMARY KEY,
        ${TableSeasonFiles.columnMovieId} INTEGER NOT NULL,
        ${TableSeasonFiles.columnSeason} INTEGER NOT NULL,
        FOREIGN KEY (${TableSeasonFiles.columnMovieId}) REFERENCES ${TableMovies.name} (${TableMovies.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableEpisodes.name}
      (
        ${TableEpisodes.columnId} INTEGER PRIMARY KEY,
        ${TableEpisodes.columnSeasonFilesId} INTEGER NOT NULL,
        ${TableEpisodes.columnEpisode} INTEGER NOT NULL,
        ${TableEpisodes.columnTitle} TEXT NOT NULL,
        ${TableEpisodes.columnDescription} TEXT NOT NULL,
        ${TableEpisodes.columnRating} TEXT NOT NULL,
        ${TableEpisodes.columnPoster} TEXT NOT NULL,
        FOREIGN KEY (${TableEpisodes.columnSeasonFilesId}) REFERENCES ${TableSeasonFiles.name} (${TableSeasonFiles.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableEpisodeCovers.name}
      (
        ${TableEpisodeCovers.columnId} INTEGER PRIMARY KEY,
        ${TableEpisodeCovers.columnEpisodeId} INTEGER NOT NULL,
        ${TableEpisodeCovers.columnResolution} TEXT NOT NULL,
        ${TableEpisodeCovers.columnCover} TEXT NOT NULL,
        FOREIGN KEY (${TableEpisodeCovers.columnEpisodeId}) REFERENCES ${TableEpisodes.name} (${TableEpisodes.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableEpisodeFiles.name}
      (
        ${TableEpisodeFiles.columnId} INTEGER PRIMARY KEY,
        ${TableEpisodeFiles.columnEpisodeId} INTEGER NOT NULL,
        ${TableEpisodeFiles.columnLanguage} TEXT NOT NULL,
        ${TableEpisodeFiles.columnEpisodeFileId} INTEGER NOT NULL,
        ${TableEpisodeFiles.columnQuality} TEXT NOT NULL,
        ${TableEpisodeFiles.columnSrc} TEXT NOT NULL,
        ${TableEpisodeFiles.columnDuration} INTEGER NOT NULL,
        FOREIGN KEY (${TableEpisodeFiles.columnEpisodeId}) REFERENCES ${TableEpisodes.name} (${TableEpisodes.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableSearchResults.name}
      (
        ${TableSearchResults.columnId} INTEGER PRIMARY KEY ON CONFLICT REPLACE,
        ${TableSearchResults.columnMovieId} INTEGER NOT NULL,
        ${TableSearchResults.columnSearchType} TEXT NOT NULL,
        ${TableSearchResults.columnName} TEXT NOT NULL,
        ${TableSearchResults.columnDescription} TEXT NOT NULL,
        ${TableSearchResults.columnPoster} TEXT NOT NULL,
        ${TableSearchResults.columnSecondaryPoster} TEXT NOT NULL,
        ${TableSearchResults.columnIsTvShow} INTEGER NOT NULL CHECK (${TableSearchResults.columnIsTvShow} IN (0, 1)),
        ${TableSearchResults.columnTimestamp} INTEGER NOT NULl 
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMoviePositions.name}
      (
        ${TableMoviePositions.columnId} INTEGER PRIMARY KEY,
        ${TableMoviePositions.columnMovieId} INTEGER NOT NULL UNIQUE ON CONFLICT REPLACE,
        ${TableMoviePositions.columnDurationInMillis} INTEGER NOT NULL,
        ${TableMoviePositions.columnLeftAt} INTEGER NOT NULL,
        ${TableMoviePositions.columnIsTvShow} INTEGER NOT NULL CHECK (${TableMoviePositions.columnIsTvShow} IN (0, 1)),
        ${TableMoviePositions.columnSeason} INTEGER NOT NULL,
        ${TableMoviePositions.columnEpisode} INTEGER NOT NULL,
        ${TableMoviePositions.columnSaveTimestamp} INTEGER NOT NULL
      ); 
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableFavoriteMovies.name}
      (
        ${TableFavoriteMovies.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableFavoriteMovies.columnMovieId} INTEGER NOT NULL UNIQUE ON CONFLICT REPLACE,
        ${TableFavoriteMovies.columnGroupId} INTEGER,
        ${TableFavoriteMovies.columnMovieName} STRING NOT NULL,
        ${TableFavoriteMovies.columnTimestamp} INTEGER NOT NULL,
        FOREIGN KEY (${TableFavoriteMovies.columnGroupId}) REFERENCES ${TableMovieGroups.name}(${TableMovieGroups.columnId}) ON DELETE SET NULL
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieGroups.name}
      (
        ${TableMovieGroups.columnId} INTEGER PRIMARY KEY,
        ${TableMovieGroups.columnName} STRING NOT NULL,
        ${TableMovieGroups.columnTimestamp} INTEGER NOT NULL
      );
    ''');
  }
}
