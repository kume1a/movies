part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.favoriteMoviesRequested() = _FavoriteMoviesRequested;
}
