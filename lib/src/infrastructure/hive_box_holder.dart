import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movo/src/domain/actors/season_files/season_files_model.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';
import 'package:movo/src/domain/search/search_results_model.dart';

class HiveTypeIdHolder {
  static const int movieDataId = 0;
  static const int seasonId = 1;
  static const int resolutionId = 2;
  static const int imageSizeId = 3;
  static const int languageId = 4;
  static const int moviePositionId = 5;
  static const int searchResultId = 6;
  static const int searchTypeId = 7;
  static const int seasonFilesId = 8;
  static const int episodeId = 9;
  static const int episodeFileId = 10;
  static const int qualityId = 11;
}

@lazySingleton
class HiveBoxHolder {
  static const String _movies = 'movies';
  static const String _seasonFiles = 'season_files';
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
    Hive.registerAdapter<SeasonFiles>(SeasonFilesAdapter());
    Hive.registerAdapter<Episode>(EpisodeAdapter());
    Hive.registerAdapter<EpisodeFile>(EpisodeFileAdapter());
    Hive.registerAdapter<Quality>(QualityAdapter());
  }

  Future<void> init() async {
    await Hive.initFlutter();

    await Future.wait(<Future<dynamic>>[
      Hive.openBox<MovieData>(_movies),
      Hive.openBox<SeasonFiles>(_seasonFiles),
      Hive.openBox<MoviePosition>(_moviePositions),
      Hive.openBox<bool>(_enabledOptions),
      Hive.openBox<int>(_valueOptions),
      Hive.openBox<SearchResult>(_searchHistory),
    ]);
  }

  Box<MovieData> get movieData => Hive.box<MovieData>(_movies);
  Box<SeasonFiles> get seasonFiles => Hive.box<SeasonFiles>(_seasonFiles);
  Box<MoviePosition> get continueWatching => Hive.box<MoviePosition>(_moviePositions);
  Box<bool> get enabledOptions => Hive.box<bool>(_enabledOptions);
  Box<int> get valueOptions => Hive.box<int>(_valueOptions);
  Box<SearchResult> get searchHistory => Hive.box<SearchResult>(_searchHistory);
}
