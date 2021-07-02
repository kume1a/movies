part of 'add_movie_bloc.dart';

@freezed
class AddMovieState with _$AddMovieState {
  const factory AddMovieState({
    SearchResults? searchResults,
    required List<int> groupMovieIds,
}) = _AddMovieState;

  factory AddMovieState.initial() => AddMovieState(
    groupMovieIds: List<int>.empty(),
  );
}
