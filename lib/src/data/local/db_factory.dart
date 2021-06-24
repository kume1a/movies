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
        FOREIGN KEY (${TableSeasons.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieCovers.name}
      (
        ${TableMovieCovers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieCovers.columnImageSize} TEXT NOT NULL,
        ${TableMovieCovers.columnCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieCovers.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieSecondaryCovers.name}
      (
        ${TableMovieSecondaryCovers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieSecondaryCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieSecondaryCovers.columnResolution} TEXT NOT NULL,
        ${TableMovieSecondaryCovers.columnSecondaryCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieSecondaryCovers.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieTrailers.name}
      (
        ${TableMovieTrailers.columnId} INTEGER PRIMARY KEY,
        ${TableMovieTrailers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieTrailers.columnLanguage} TEXT NOT NULL,
        ${TableMovieTrailers.columnTrailerUrl} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieGenres.name}
      (
        ${TableMovieGenres.columnId} INTEGER PRIMARY KEY,
        ${TableMovieGenres.columnMovieId} INTEGER NOT NULL,
        ${TableMovieGenres.columnGenre} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieLanguages.name}
      (
        ${TableMovieLanguages.columnId} INTEGER PRIMARY KEY,
        ${TableMovieLanguages.columnMovieId} INTEGER NOT NULL,
        ${TableMovieLanguages.columnLanguage} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieLanguages.columnMovieId}) REFERENCES ${TableDBMovies.name} (${TableDBMovies.columnMovieId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableDBMovies.name}
      (
        ${TableDBMovies.columnId} INTEGER PRIMARY KEY,
        ${TableDBMovies.columnMovieId} INTEGER NOT NULL UNIQUE ON CONFLICT IGNORE,
        ${TableDBMovies.columnName} TEXT NOT NULL,
        ${TableDBMovies.columnYear} INTEGER NOT NULL,
        ${TableDBMovies.columnImdbUrl} TEXT NOT NULL,
        ${TableDBMovies.columnIsTvShow} INTEGER NOT NULL CHECK (${TableDBMovies.columnIsTvShow} IN (0, 1)),
        ${TableDBMovies.columnDuration} INTEGER NOT NULL,
        ${TableDBMovies.columnCanBePlayed} INTEGER NOT NULL CHECK (${TableDBMovies.columnCanBePlayed} IN (0, 1)),
        ${TableDBMovies.columnPoster} TEXT NOT NULL,
        ${TableDBMovies.columnImdbRating} REAL NOT NULL,
        ${TableDBMovies.columnVoterCount} INTEGER NOT NULL,
        ${TableDBMovies.columnPlot} TEXT NOT NULL,
        ${TableDBMovies.columnIsFavorite} INTEGER NOT NULL CHECK (${TableDBMovies.columnIsFavorite} IN (0, 1)),
        ${TableDBMovies.columnSaveTimestamp} INTEGER NOT NULL
      );
    ''');
  }
}
