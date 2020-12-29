part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState(
    Option<Movies> popularMoviesOption,
    Option<Movies> topMoviesOption,
    Option<Movies> moviesOption,
    Option<List<SavedMovie>> savedMoviesOption,
    Genre genre,
  ) = _HomeState;

  factory HomeState.initial() => HomeState(none(), none(), none(), none(), Genre.all);
}
