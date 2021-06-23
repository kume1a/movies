part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState(Option<List<MovieData>> moviesOption) = _FavoritesState;

  factory FavoritesState.initial() => FavoritesState(
        none(),
      );
}
