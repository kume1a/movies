part of 'add_movie_bloc.dart';

@freezed
class AddMovieEvent with _$AddMovieEvent {
  const factory AddMovieEvent.init(int groupId) = _Init;

  const factory AddMovieEvent.queryChanged(String query) = _QueryChanged;
  const factory AddMovieEvent.nextPageRequested() = _NextPageRequested;
  const factory AddMovieEvent.addClicked(int movieId, String movieNameEn, String movieNameKa) = _AddClicked;
  const factory AddMovieEvent.removeClicked(int movieId) = _RemoveClicked;
}