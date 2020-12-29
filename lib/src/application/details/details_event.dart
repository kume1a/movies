part of 'details_bloc.dart';

@freezed
abstract class DetailsEvent with _$DetailsEvent {
  const factory DetailsEvent.movieFetchRequested() = _MovieFetchRequested;
  const factory DetailsEvent.castPageFetchRequested() = _CastPageFetchRequested;
  const factory DetailsEvent.favoriteToggled() = _FavoriteToggled;
}