part of 'movie_group_ui_bloc.dart';

@freezed
class MovieGroupUiState with _$MovieGroupUiState {
  const factory MovieGroupUiState({
    required bool isFabExpanded,
  }) = _MovieGroupUiState;

  factory MovieGroupUiState.initial() => const MovieGroupUiState(isFabExpanded: false);
}
