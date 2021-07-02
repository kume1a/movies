part of 'details_bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.init() = _Init;

  const factory DetailsEvent.movieFetchRequested() = _MovieFetchRequested;
  const factory DetailsEvent.castPageFetchRequested() = _CastPageFetchRequested;
  const factory DetailsEvent.groupSelected(MovieGroup movieGroup) = _GroupSelected;
}