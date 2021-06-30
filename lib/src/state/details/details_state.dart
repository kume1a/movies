part of 'details_bloc.dart';

@freezed
class DetailsState with _$DetailsState {
  const factory DetailsState({
    MovieData? movie,
    Actors? actors,
    MoviePosition? moviePosition,
    required bool belongsToMovieGroup,
    required bool canShowGroupSelector,
  }) = _DetailsState;

  factory DetailsState.initial() => const DetailsState(
        belongsToMovieGroup: false,
        canShowGroupSelector: false,
      );
}
