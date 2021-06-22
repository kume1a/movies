import 'package:hive/hive.dart';

import '../../../local/hive_box_holder.dart';

part 'movie_position.g.dart';

@HiveType(typeId: HiveTypeIdHolder.moviePositionId)
class MoviePosition {
  const MoviePosition(
    this.movieId,
    this.durationInMillis,
    this.leftAt,
    this.isTvShow, // ignore: avoid_positional_boolean_parameters
    this.season,
    this.episode,
    this.timestamp,
  );

  @HiveField(0)
  final int movieId;

  @HiveField(1)
  final int durationInMillis;

  @HiveField(2)
  final int leftAt;

  @HiveField(3)
  final bool isTvShow;

  @HiveField(4)
  final int season;

  @HiveField(5)
  final int episode;

  @HiveField(6)
  final int timestamp;

  @override
  String toString() {
    return 'MoviePosition{movieId: $movieId, durationInMillis: $durationInMillis, leftAt: $leftAt, isTvShow: $isTvShow, season: $season, episode: $episode, timestamp: $timestamp}';
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
          season == other.season &&
          episode == other.episode &&
          timestamp == other.timestamp;

  @override
  int get hashCode =>
      movieId.hashCode ^
      durationInMillis.hashCode ^
      leftAt.hashCode ^
      isTvShow.hashCode ^
      season.hashCode ^
      episode.hashCode ^
      timestamp.hashCode;
}
