part of 'details_bloc.dart';

@freezed
class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.init() = _Init;

  const factory DetailsEvent.movieFetchRequested() = _MovieFetchRequested;
  const factory DetailsEvent.castPageFetchRequested() = _CastPageFetchRequested;
  const factory DetailsEvent.favoriteToggled() = _FavoriteToggled;
  const factory DetailsEvent.isSavedMovieRequested() = _IsSavedMovieRequested;
}