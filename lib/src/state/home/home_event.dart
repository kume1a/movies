part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.popularMoviesFetchRequested() = _PopularMoviesFetchRequested;
  const factory HomeEvent.topMoviesPageFetchRequested() = _TopMoviesPageFetchRequested;
  const factory HomeEvent.moviesPageFetchRequested() = _MoviesPageFetchRequested;
  const factory HomeEvent.savedMoviesRequested() = _SavedMoviesRequested;
  const factory HomeEvent.genreChanged(Genre genre) = _GenreChanged;
  const factory HomeEvent.clear() = _Clear;
}
