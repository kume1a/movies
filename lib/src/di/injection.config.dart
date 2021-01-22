// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../infrastructure/cache_control.dart';
import '../application/details/details_bloc.dart';
import '../application/favorites/favorites_bloc.dart';
import '../infrastructure/history_manager.dart';
import '../infrastructure/hive_box_holder.dart';
import '../application/home/home_bloc.dart';
import '../domain/i_history_manager.dart';
import '../domain/i_movie_repository.dart';
import '../domain/settings/i_settings_interactor.dart';
import '../infrastructure/repository/movie_local_interactor.dart';
import '../infrastructure/repository/movie_remote_provider.dart';
import '../infrastructure/repository/movie_repository.dart';
import '../application/search/search_bloc.dart';
import '../application/settings/settings_bloc.dart';
import '../infrastructure/settings/settings_interactor.dart';
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
  gh.lazySingleton<IHistoryManager>(() => HistoryManager(get<HiveBoxHolder>()));
  gh.lazySingleton<ISettingsInteractor>(
      () => SettingsInteractor(get<HiveBoxHolder>()));
  gh.lazySingleton<MovieLocalInteractor>(
      () => MovieLocalInteractor(get<HiveBoxHolder>()));
  gh.lazySingleton<MovieRemoteProvider>(() => MovieRemoteProvider());
  gh.factory<SettingsBloc>(() => SettingsBloc(get<ISettingsInteractor>()));
  gh.factory<CacheControl>(() => CacheControl(get<HiveBoxHolder>()));
  gh.lazySingleton<IMovieRepository>(() =>
      MovieRepository(get<MovieRemoteProvider>(), get<MovieLocalInteractor>()));
  gh.factory<SearchBloc>(() => SearchBloc(
        get<IMovieRepository>(),
        get<IHistoryManager>(),
        get<ISettingsInteractor>(),
      ));
  gh.factory<StreamBloc>(
      () => StreamBloc(get<IMovieRepository>(), get<ISettingsInteractor>()));
  gh.factoryParam<DetailsBloc, int, dynamic>(
      (movieId, _) => DetailsBloc(get<IMovieRepository>(), movieId));
  gh.factory<FavoritesBloc>(() => FavoritesBloc(get<IMovieRepository>()));
  gh.factory<HomeBloc>(() => HomeBloc(get<IMovieRepository>()));
  return get;
}
