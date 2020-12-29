import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/domain/search/search_results_model.dart';

@lazySingleton
class HiveBoxHolder {
  static const String _movies = 'movies';
  static const String _moviePositions = 'movie_positions';

  static const String _enabledOptions = 'enabled_options';
  static const String _valueOptions = 'value_options';

  static const String _searchHistory = 'search_history';

  HiveBoxHolder() {
    Hive.registerAdapter<MovieData>(MovieDataAdapter());
    Hive.registerAdapter<Season>(SeasonAdapter());
    Hive.registerAdapter<Resolution>(ResolutionAdapter());
    Hive.registerAdapter<ImageSize>(ImageSizeAdapter());
    Hive.registerAdapter<Language>(LanguageAdapter());
    Hive.registerAdapter<MoviePosition>(MoviePositionAdapter());
    Hive.registerAdapter<SearchResult>(SearchResultAdapter());
    Hive.registerAdapter<SearchType>(SearchTypeAdapter());
  }

  Future<void> init() async {
    await Hive.initFlutter();

    await Future.wait(<Future<dynamic>>[
      Hive.openBox<MovieData>(_movies),
      Hive.openBox<MoviePosition>(_moviePositions),
      Hive.openBox<bool>(_enabledOptions),
      Hive.openBox<int>(_valueOptions),
      Hive.openBox<SearchResult>(_searchHistory),
    ]);
  }

  Box<MovieData> get movieData => Hive.box<MovieData>(_movies);

  Box<MoviePosition> get continueWatching => Hive.box<MoviePosition>(_moviePositions);

  Box<bool> get enabledOptions => Hive.box<bool>(_enabledOptions);

  Box<int> get valueOptions => Hive.box<int>(_valueOptions);

  Box<SearchResult> get searchHistory => Hive.box<SearchResult>(_searchHistory);
}
