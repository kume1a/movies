part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.init() = _Init;

  const factory FavoritesEvent.refreshData() = _RefreshData;

  const factory FavoritesEvent.switchedToMovieGroups() = _SwitchedToMovieGroups;
  const factory FavoritesEvent.switchedToFavorites() = _SwitchedToFavorites;
}
