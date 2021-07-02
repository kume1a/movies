import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_group_ui_bloc.freezed.dart';
part 'movie_group_ui_event.dart';
part 'movie_group_ui_state.dart';

@injectable
class MovieGroupUiBloc extends Bloc<MovieGroupUiEvent, MovieGroupUiState> {
  MovieGroupUiBloc() : super(MovieGroupUiState.initial());

  @override
  Stream<MovieGroupUiState> mapEventToState(
    MovieGroupUiEvent event,
  ) async* {
    yield* event.map(
      scrolledUp: _scrolledUp,
      scrolledDown: _scrolledDown,
    );
  }

  Stream<MovieGroupUiState> _scrolledUp(_ScrolledUp event) async* {
    yield state.copyWith(isFabExpanded: true);
  }

  Stream<MovieGroupUiState> _scrolledDown(_ScrolledDown event) async* {
    yield state.copyWith(isFabExpanded: false);
  }
}
