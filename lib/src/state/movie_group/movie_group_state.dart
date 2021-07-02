part of 'movie_group_bloc.dart';

@freezed
class MovieGroupState with _$MovieGroupState {
  const factory MovieGroupState({
    MovieGroup? movieGroup,
    List<MovieData>? movies,
}) = _MovieGroupState;

  factory MovieGroupState.initial() => const MovieGroupState();
}
