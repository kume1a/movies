import 'movie_data.dart';
import 'movie_position.dart';

class SavedMovie {
  SavedMovie(this.position, this.data);

  final MoviePosition position;
  final MovieData data;

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