part of 'movie_group_bloc.dart';

@freezed
class MovieGroupState with _$MovieGroupState {
  const factory MovieGroupState({
    MovieGroup? selectedMovieGroup,
    List<MovieGroup>? movieGroups,
}) = _MovieGroupState;

  factory MovieGroupState.initial() => const MovieGroupState();
}