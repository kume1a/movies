part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    Movies? popularMovies,
    Movies? topMovies,
    Movies? movies,
    List<SavedMovie>? savedMovies,
    required Genre genre,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        genre: Genre.all,
      );
}
