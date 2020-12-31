import 'package:hive/hive.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

part 'movie_position_model.g.dart';

@HiveType(typeId: HiveTypeIdHolder.moviePositionId)
class MoviePosition {
  @HiveField(0)
  final int movieId;

  @HiveField(1)
  final int durationInMillis;

  @HiveField(2)
  final int leftAt;

  @HiveField(3)
  final bool isTvShow;

  @HiveField(4)
  final int seasonNumber;

  @HiveField(5)
  final int episodeNumber;

  @HiveField(6)
  final int timestamp;

  const MoviePosition(
    this.movieId,
    this.durationInMillis,
    this.leftAt,
    this.isTvShow,
    this.seasonNumber,
    this.episodeNumber,
    this.timestamp,
  );

  @override
  String toString() {
    return 'MoviePosition{movieId: $movieId, durationInMillis: $durationInMillis, leftAt: $leftAt, isTvShow: $isTvShow, seasonNumber: $seasonNumber, episodeNumber: $episodeNumber, timestamp: $timestamp}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviePosition &&
          runtimeType == other.runtimeType &&
          movieId == other.movieId &&
          durationInMillis == other.durationInMillis &&
          leftAt == other.leftAt &&
          isTvShow == other.isTvShow &&
          seasonNumber == other.seasonNumber &&
          episodeNumber == other.episodeNumber &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      movieId.hashCode ^
      durationInMillis.hashCode ^
      leftAt.hashCode ^
      isTvShow.hashCode ^
      seasonNumber.hashCode ^
      episodeNumber.hashCode ^
      timestamp.hashCode;
}
