part of 'movie_group_selector_bloc.dart';

@freezed
class MovieGroupSelectorEvent with _$MovieGroupSelectorEvent {
  const factory MovieGroupSelectorEvent.init(int movieId) = _Init;
}
