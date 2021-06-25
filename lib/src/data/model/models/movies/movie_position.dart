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

  final int movieId;
  final int durationInMillis;
  final int leftAt;
  final bool isTvShow;
  final int season;
  final int episode;
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
