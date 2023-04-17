// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:device_info_plus/device_info_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i43;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movo/src/controllers/home/authorization_prompt_controller.dart'
    as _i41;
import 'package:movo/src/controllers/home/home_controller.dart' as _i51;
import 'package:movo/src/controllers/main/favorites_controller.dart' as _i50;
import 'package:movo/src/controllers/main/main_screen_controller.dart' as _i55;
import 'package:movo/src/controllers/main/statistics_controller.dart' as _i48;
import 'package:movo/src/controllers/movie_group/movie_group_controller.dart'
    as _i52;
import 'package:movo/src/controllers/stream/player_controls_controller.dart'
    as _i11;
import 'package:movo/src/controllers/stream/subtitle_controller.dart' as _i18;
import 'package:movo/src/core/helpers/device_uuid_provider.dart' as _i7;
import 'package:movo/src/core/helpers/subtitle_decoder.dart' as _i15;
import 'package:movo/src/core/managers/permission_manager.dart' as _i10;
import 'package:movo/src/data/local/cache_dumper.dart' as _i42;
import 'package:movo/src/data/local/favorite_movie/db_favorite_movie/db_favorite_movie_dao.dart'
    as _i23;
import 'package:movo/src/data/local/favorite_movie/favorite_movie_dao.dart'
    as _i49;
import 'package:movo/src/data/local/movie_group/db_movie_group/db_movie_group_dao.dart'
    as _i27;
import 'package:movo/src/data/local/movie_group/movie_group_dao.dart' as _i53;
import 'package:movo/src/data/local/movies/db_movie/db_movie_dao.dart' as _i25;
import 'package:movo/src/data/local/movies/db_movie_cover/db_movie_cover_dao.dart'
    as _i24;
import 'package:movo/src/data/local/movies/db_movie_genre/db_movie_genre_dao.dart'
    as _i26;
import 'package:movo/src/data/local/movies/db_movie_language/db_movie_language_dao.dart'
    as _i28;
import 'package:movo/src/data/local/movies/db_movie_season/db_movie_season_dao.dart'
    as _i30;
import 'package:movo/src/data/local/movies/db_movie_secondary_cover/db_movie_secondary_cover_dao.dart'
    as _i31;
import 'package:movo/src/data/local/movies/db_movie_trailer/db_movie_trailer_dao.dart'
    as _i32;
import 'package:movo/src/data/local/movies/movie_dao.dart' as _i36;
import 'package:movo/src/data/local/preferences/preferences_helper.dart'
    as _i37;
import 'package:movo/src/data/local/preferences/settings_helper.dart' as _i54;
import 'package:movo/src/data/local/saved_movies/db_movie_position/db_movie_position_dao.dart'
    as _i29;
import 'package:movo/src/data/local/saved_movies/db_saved_movie_genres/db_saved_movie_genre_dao.dart'
    as _i33;
import 'package:movo/src/data/local/saved_movies/saved_movie_dao.dart' as _i46;
import 'package:movo/src/data/local/search_result/search_result_dao.dart'
    as _i13;
import 'package:movo/src/data/local/season_files/db_episode/db_episode_dao.dart'
    as _i21;
import 'package:movo/src/data/local/season_files/db_episode_cover/db_episode_cover_dao.dart'
    as _i20;
import 'package:movo/src/data/local/season_files/db_episode_file/db_episode_file_dao.dart'
    as _i22;
import 'package:movo/src/data/local/season_files/db_season_file/db_season_file_dao.dart'
    as _i34;
import 'package:movo/src/data/local/season_files/season_files_dao.dart' as _i38;
import 'package:movo/src/data/local/subtitle_local_loader.dart' as _i16;
import 'package:movo/src/data/local/watched_movies/db_watched_movie/db_watched_movie_dao.dart'
    as _i35;
import 'package:movo/src/data/local/watched_movies/watched_movie_dao.dart'
    as _i39;
import 'package:movo/src/data/network/api_service.dart' as _i44;
import 'package:movo/src/data/network/interceptors/api_service_header_interceptor.dart'
    as _i3;
import 'package:movo/src/data/network/interceptors/authorization_interceptor.dart'
    as _i40;
import 'package:movo/src/data/network/services/authorization_service.dart'
    as _i19;
import 'package:movo/src/data/network/services/movie_service.dart' as _i45;
import 'package:movo/src/data/network/services/search_service.dart' as _i47;
import 'package:movo/src/data/network/subtitle_remote_loader.dart' as _i17;
import 'package:movo/src/di/modules/abstract_components_module.dart' as _i57;
import 'package:movo/src/di/modules/network_module.dart' as _i58;
import 'package:movo/src/di/modules/storage_module.dart' as _i56;
import 'package:movo/src/ui/core/bottom_sheets/core/bottom_sheet_manager.dart'
    as _i4;
import 'package:movo/src/ui/core/dialogs/core/dialog_manager.dart' as _i8;
import 'package:movo/src/ui/core/routes/routes.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i14;
import 'package:sqflite/sqflite.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final abstractComponentsModule = _$AbstractComponentsModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i3.ApiServiceHeaderInterceptor>(
        () => _i3.ApiServiceHeaderInterceptor());
    gh.lazySingleton<_i4.BottomSheetManager>(() => _i4.BottomSheetManager());
    await gh.singletonAsync<_i5.Database>(
      () => storageModule.database,
      preResolve: true,
    );
    gh.lazySingleton<_i6.DeviceInfoPlugin>(
        () => abstractComponentsModule.deviceInfo);
    gh.lazySingleton<_i7.DeviceUUIDProvider>(
        () => _i7.DeviceUUIDProvider(gh<_i6.DeviceInfoPlugin>()));
    gh.lazySingleton<_i8.DialogManager>(() => _i8.DialogManager());
    gh.lazySingleton<_i9.FirebaseFirestore>(() => networkModule.firestore);
    gh.lazySingleton<_i10.PermissionManager>(
        () => _i10.PermissionManagerImpl());
    gh.factory<_i11.PlayerControlsControllerMiddleMan>(
        () => _i11.PlayerControlsControllerMiddleMan());
    gh.factory<_i12.RouteGenerator>(() => _i12.RouteGenerator());
    gh.lazySingleton<_i13.SearchResultDao>(
        () => _i13.SearchResultDao(gh<_i5.Database>()));
    await gh.singletonAsync<_i14.SharedPreferences>(
      () => storageModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i15.SubtitleDecoder>(() => _i15.SubtitleDecoderImpl());
    gh.lazySingleton<_i16.SubtitleLocalLoader>(
        () => _i16.SubtitleLocalLoaderImpl(gh<_i15.SubtitleDecoder>()));
    gh.lazySingleton<_i17.SubtitleRemoteLoader>(
        () => _i17.SubtitleRemoteLoaderImpl(gh<_i15.SubtitleDecoder>()));
    gh.factory<_i18.SubtitlesControllerMiddleMan>(
        () => _i18.SubtitlesControllerMiddleMan());
    gh.lazySingleton<_i19.AuthorizationService>(() => _i19.AuthorizationService(
          gh<_i7.DeviceUUIDProvider>(),
          gh<_i9.FirebaseFirestore>(),
          gh<_i14.SharedPreferences>(),
        ));
    gh.lazySingleton<_i20.DBEpisodeCoverDao>(
        () => _i20.DBEpisodeCoverDao(gh<_i5.Database>()));
    gh.lazySingleton<_i21.DBEpisodeDao>(
        () => _i21.DBEpisodeDao(gh<_i5.Database>()));
    gh.lazySingleton<_i22.DBEpisodeFileDao>(
        () => _i22.DBEpisodeFileDao(gh<_i5.Database>()));
    gh.lazySingleton<_i23.DBFavoriteMovieDao>(
        () => _i23.DBFavoriteMovieDao(gh<_i5.Database>()));
    gh.lazySingleton<_i24.DBMovieCoverDao>(
        () => _i24.DBMovieCoverDao(gh<_i5.Database>()));
    gh.lazySingleton<_i25.DBMovieDao>(
        () => _i25.DBMovieDao(gh<_i5.Database>()));
    gh.lazySingleton<_i26.DBMovieGenreDao>(
        () => _i26.DBMovieGenreDao(gh<_i5.Database>()));
    gh.lazySingleton<_i27.DBMovieGroupDao>(
        () => _i27.DBMovieGroupDao(gh<_i5.Database>()));
    gh.lazySingleton<_i28.DBMovieLanguageDao>(
        () => _i28.DBMovieLanguageDao(gh<_i5.Database>()));
    gh.lazySingleton<_i29.DBMoviePositionDao>(
        () => _i29.DBMoviePositionDao(gh<_i5.Database>()));
    gh.lazySingleton<_i30.DBMovieSeasonDao>(
        () => _i30.DBMovieSeasonDao(gh<_i5.Database>()));
    gh.lazySingleton<_i31.DBMovieSecondaryCoverDao>(
        () => _i31.DBMovieSecondaryCoverDao(gh<_i5.Database>()));
    gh.lazySingleton<_i32.DBMovieTrailerDao>(
        () => _i32.DBMovieTrailerDao(gh<_i5.Database>()));
    gh.lazySingleton<_i33.DBSavedMovieGenreDao>(
        () => _i33.DBSavedMovieGenreDao(gh<_i5.Database>()));
    gh.lazySingleton<_i34.DBSeasonFileDao>(
        () => _i34.DBSeasonFileDao(gh<_i5.Database>()));
    gh.lazySingleton<_i35.DBWatchedMovieDao>(
        () => _i35.DBWatchedMovieDao(gh<_i5.Database>()));
    gh.lazySingleton<_i36.MovieDao>(() => _i36.MovieDao(
          gh<_i25.DBMovieDao>(),
          gh<_i24.DBMovieCoverDao>(),
          gh<_i31.DBMovieSecondaryCoverDao>(),
          gh<_i26.DBMovieGenreDao>(),
          gh<_i28.DBMovieLanguageDao>(),
          gh<_i32.DBMovieTrailerDao>(),
          gh<_i30.DBMovieSeasonDao>(),
        ));
    gh.lazySingleton<_i37.PreferencesHelper>(
        () => _i37.PreferencesHelper(gh<_i14.SharedPreferences>()));
    gh.lazySingleton<_i38.SeasonFileDao>(() => _i38.SeasonFileDao(
          gh<_i21.DBEpisodeDao>(),
          gh<_i22.DBEpisodeFileDao>(),
          gh<_i34.DBSeasonFileDao>(),
          gh<_i20.DBEpisodeCoverDao>(),
        ));
    gh.lazySingleton<_i39.WatchedMovieDao>(
        () => _i39.WatchedMovieDao(gh<_i35.DBWatchedMovieDao>()));
    gh.factory<_i40.AuthorizationInterceptor>(
        () => _i40.AuthorizationInterceptor(gh<_i19.AuthorizationService>()));
    gh.factory<_i41.AuthorizationPromptDialogController>(() =>
        _i41.AuthorizationPromptDialogController(
            gh<_i19.AuthorizationService>()));
    gh.factory<_i42.CacheDumper>(() => _i42.CacheDumper(
          gh<_i36.MovieDao>(),
          gh<_i38.SeasonFileDao>(),
        ));
    gh.lazySingleton<_i43.Dio>(() => networkModule.dio(
          gh<_i3.ApiServiceHeaderInterceptor>(),
          gh<_i40.AuthorizationInterceptor>(),
        ));
    gh.lazySingleton<_i44.ApiService>(
        () => networkModule.apiService(gh<_i43.Dio>()));
    gh.lazySingleton<_i45.MovieService>(() => _i45.MovieService(
          gh<_i44.ApiService>(),
          gh<_i36.MovieDao>(),
          gh<_i38.SeasonFileDao>(),
        ));
    gh.lazySingleton<_i46.SavedMovieDao>(() => _i46.SavedMovieDao(
          gh<_i45.MovieService>(),
          gh<_i29.DBMoviePositionDao>(),
          gh<_i33.DBSavedMovieGenreDao>(),
        ));
    gh.lazySingleton<_i47.SearchService>(
        () => _i47.SearchService(gh<_i44.ApiService>()));
    gh.factory<_i48.StatisticsController>(() => _i48.StatisticsController(
          gh<_i39.WatchedMovieDao>(),
          gh<_i46.SavedMovieDao>(),
        ));
    gh.lazySingleton<_i49.FavoriteMovieDao>(() => _i49.FavoriteMovieDao(
          gh<_i45.MovieService>(),
          gh<_i23.DBFavoriteMovieDao>(),
        ));
    gh.factory<_i50.FavoritesControllerMiddleMan>(
        () => _i50.FavoritesControllerMiddleMan(gh<_i45.MovieService>()));
    gh.factory<_i51.HomeController>(() => _i51.HomeController(
          gh<_i45.MovieService>(),
          gh<_i46.SavedMovieDao>(),
          gh<_i8.DialogManager>(),
        ));
    gh.factory<_i52.MovieGroupControllerMiddleMan>(
        () => _i52.MovieGroupControllerMiddleMan(gh<_i45.MovieService>()));
    gh.lazySingleton<_i53.MovieGroupDao>(() => _i53.MovieGroupDao(
          gh<_i27.DBMovieGroupDao>(),
          gh<_i49.FavoriteMovieDao>(),
        ));
    gh.lazySingleton<_i54.SettingsHelper>(() => _i54.SettingsHelper(
          gh<_i14.SharedPreferences>(),
          gh<_i13.SearchResultDao>(),
          gh<_i46.SavedMovieDao>(),
          gh<_i49.FavoriteMovieDao>(),
          gh<_i53.MovieGroupDao>(),
          gh<_i42.CacheDumper>(),
        ));
    gh.factory<_i50.FavoritesController>(() => _i50.FavoritesController(
          gh<_i49.FavoriteMovieDao>(),
          gh<_i53.MovieGroupDao>(),
          gh<_i37.PreferencesHelper>(),
          gh<_i8.DialogManager>(),
          gh<_i4.BottomSheetManager>(),
        ));
    gh.factory<_i55.MainScreenController>(() => _i55.MainScreenController(
          gh<_i54.SettingsHelper>(),
          gh<_i19.AuthorizationService>(),
          gh<_i8.DialogManager>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i56.StorageModule {}

class _$AbstractComponentsModule extends _i57.AbstractComponentsModule {}

class _$NetworkModule extends _i58.NetworkModule {}
