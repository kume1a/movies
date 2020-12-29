
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movie_position/movie_position_model.dart';

class SavedMovie {
  final MoviePosition position;
  final MovieData data;

  SavedMovie(this.position, this.data);

  @override
  String toString() {
    return 'SavedMovie{position: $position, movie: $data}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedMovie &&
          runtimeType == other.runtimeType &&
          position == other.position &&
          data == other.data;

  @override
  int get hashCode => position.hashCode ^ data.hashCode;
}