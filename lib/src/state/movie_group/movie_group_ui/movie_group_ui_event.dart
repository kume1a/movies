part of 'movie_group_ui_bloc.dart';

@freezed
class MovieGroupUiEvent with _$MovieGroupUiEvent {
  const factory MovieGroupUiEvent.scrolledUp() = _ScrolledUp;

  const factory MovieGroupUiEvent.scrolledDown() = _ScrolledDown;
}
