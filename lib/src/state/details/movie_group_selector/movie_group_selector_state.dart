part of 'movie_group_selector_bloc.dart';

@freezed
class MovieGroupSelectorState with _$MovieGroupSelectorState {
  const factory MovieGroupSelectorState({
    MovieGroup? selectedMovieGroup,
    List<MovieGroup>? movieGroups,
}) = _MovieGroupSelectorState;

  factory MovieGroupSelectorState.initial() => const MovieGroupSelectorState();
}