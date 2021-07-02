part of 'movie_group_bloc.dart';

@freezed
class MovieGroupEvent with _$MovieGroupEvent {
  const factory MovieGroupEvent.init(int groupId) = _Init;
  const factory MovieGroupEvent.refreshData() = _RefreshData;

  const factory MovieGroupEvent.addMovieClicked() = _AddMovieClicked;
}
