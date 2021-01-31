// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../infrastructure/managers/cache_manager.dart';
import '../application/details/details_bloc.dart';
import '../application/favorites/favorites_bloc.dart';
import '../infrastructure/managers/favorites_manager.dart';
import '../infrastructure/managers/history_manager.dart';
import '../infrastructure/hive_box_holder.dart';
import '../application/home/home_bloc.dart';
import '../domain/managers/i_favorites_manager.dart';
import '../domain/managers/i_history_manager.dart';
import '../domain/i_movie_repository.dart';
import '../domain/managers/i_saved_movies_manager.dart';
import '../domain/managers/i_settings_manager.dart';
import '../infrastructure/repository/movie_local_interactor.dart';
import '../infrastructure/repository/movie_remote_provider.dart';
import '../infrastructure/repository/movie_repository.dart';
import '../infrastructure/managers/saved_movies_manager.dart';
import '../application/search/search_bloc.dart';
import '../application/settings/settings_bloc.dart';
import '../infrastructure/managers/settings_manager.dart';
import '../application/stream/stream_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<HiveBoxHolder>(() => HiveBoxHolder());
  gh.lazySingleton<IFavoritesManager>(
      () => FavoritesManager(get<HiveBoxHolder>()));
  gh.lazySingleton<IHistoryManager>(() => HistoryManager(get<HiveBoxHolder>()));
  gh.lazySingleton<ISavedMoviesManager>(
      () => SavedMoviesManager(get<HiveBoxHolder>()));
  gh.lazySingleton<ISettingsManager>(
      () => SettingsManager(get<HiveBoxHolder>()));
  gh.lazySingleton<MovieLocalInteractor>(
      () => MovieLocalInteractor(get<HiveBoxHolder>()));
  gh.lazySingleton<MovieRemoteProvider>(() => MovieRemoteProvider());
  gh.factory<SettingsBloc>(() => SettingsBloc(get<ISettingsManager>()));
  gh.factory<CacheManager>(() => CacheManager(get<HiveBoxHolder>()));
  gh.factory<FavoritesBloc>(() => FavoritesBloc(get<IFavoritesManager>()));
  gh.lazySingleton<IMovieRepository>(() =>
      MovieRepository(get<MovieRemoteProvider>(), get<MovieLocalInteractor>()));
  gh.factory<SearchBloc>(() => SearchBloc(
        get<IMovieRepository>(),
        get<IHistoryManager>(),
        get<ISettingsManager>(),
      ));
  gh.factory<StreamBloc>(() => StreamBloc(
        get<IMovieRepository>(),
        get<ISettingsManager>(),
        get<ISavedMoviesManager>(),
      ));
  gh.factoryParam<DetailsBloc, int, dynamic>((movieId, _) => DetailsBloc(
        get<IMovieRepository>(),
        get<IFavoritesManager>(),
        get<ISavedMoviesManager>(),
        movieId,
      ));
  gh.factory<HomeBloc>(
      () => HomeBloc(get<IMovieRepository>(), get<ISavedMoviesManager>()));
  return get;
}
