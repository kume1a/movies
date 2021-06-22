part of 'favorites_bloc.dart';

@freezed
abstract class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.favoriteMoviesRequested() = _FavoriteMoviesRequested;
}
