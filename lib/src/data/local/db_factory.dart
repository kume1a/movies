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
        ${TableSeasons.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableSeasons.columnMovieId} INTEGER NOT NULL,
        ${TableSeasons.columnNumber} INTEGER NOT NULL,
        ${TableSeasons.columnName} TEXT NOT NULL,
        ${TableSeasons.columnEpisodesCount} INTEGER NOT NULL,
        FOREIGN KEY (${TableSeasons.columnMovieId}) REFERENCES ${TableMoviesData.name} (${TableMoviesData.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieCovers.name}
      (
        ${TableMovieCovers.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableMovieCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieCovers.columnImageSize} TEXT NOT NULL,
        ${TableMovieCovers.columnCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieCovers.columnMovieId}) REFERENCES ${TableMoviesData.name} (${TableMoviesData.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieSecondaryCovers.name}
      (
        ${TableMovieSecondaryCovers.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableMovieSecondaryCovers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieSecondaryCovers.columnResolution} TEXT NOT NULL,
        ${TableMovieSecondaryCovers.columnSecondaryCover} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieSecondaryCovers.columnMovieId}) REFERENCES ${TableMoviesData.name} (${TableMoviesData.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieTrailers.name}
      (
        ${TableMovieTrailers.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableMovieTrailers.columnMovieId} INTEGER NOT NULL,
        ${TableMovieTrailers.columnLanguage} TEXT NOT NULL,
        ${TableMovieTrailers.columnTrailerUrl} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableMoviesData.name} (${TableMoviesData.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMovieGenres.name}
      (
        ${TableMovieGenres.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableMovieGenres.columnMovieId} INTEGER NOT NULL,
        ${TableMovieGenres.columnGenre} TEXT NOT NULL,
        FOREIGN KEY (${TableMovieTrailers.columnMovieId}) REFERENCES ${TableMoviesData.name} (${TableMoviesData.columnId})
      );
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS ${TableMoviesData.name}
      (
        ${TableMoviesData.columnId} INTEGER PRIMARY KEY NOT NULL,
        ${TableMoviesData.columnMovieId} INTEGER NOT NULL,
        ${TableMoviesData.columnName} TEXT NOT NULL,
        ${TableMoviesData.columnYear} INTEGER NOT NULL,
        ${TableMoviesData.columnImdbUrl} TEXT NOT NULL,
        ${TableMoviesData.columnIsTvShow} INTEGER NOT NULL CHECK (${TableMoviesData.columnIsTvShow} IN (0, 1)),
        ${TableMoviesData.columnDuration} INTEGER NOT NULL,
        ${TableMoviesData.columnCanBePlayed} INTEGER NOT NULL CHECK (${TableMoviesData.columnCanBePlayed} IN (0, 1)),
        ${TableMoviesData.columnPoster} TEXT NOT NULL,
        ${TableMoviesData.columnImdbRating} REAL NOT NULL,
        ${TableMoviesData.columnVoterCount} INTEGER NOT NULL,
        ${TableMoviesData.columnPlot} TEXT NOT NULL,
        ${TableMoviesData.columnFavorite} INTEGER NOT NULL CHECK (${TableMoviesData.columnFavorite} IN (0, 1))
      );
    ''');
  }
}
