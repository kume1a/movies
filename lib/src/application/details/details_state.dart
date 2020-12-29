part of 'details_bloc.dart';

@freezed
abstract class DetailsState with _$DetailsState {
  const factory DetailsState(
    Option<MovieData> movieOption,
    Option<Actors> actorsOption,
    bool favorite, // ignore: avoid_positional_boolean_parameters
  ) = _DetailsState;

  factory DetailsState.initial() => DetailsState(none(), none(), false);
}
