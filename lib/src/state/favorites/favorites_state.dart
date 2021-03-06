part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    List<MovieData>? movies,
    List<MovieGroup>? movieGroups,
    FavoritesPageState? pageState,
  }) = _FavoritesState;

  factory FavoritesState.initial() => const FavoritesState();
}
