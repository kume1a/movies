part of 'movie_group_bloc.dart';

@freezed
class MovieGroupEvent with _$MovieGroupEvent {
  const factory MovieGroupEvent.init(int movieId) = _Init;
}
