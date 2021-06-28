class DetailsPageArgs {
  DetailsPageArgs({required this.movieId});

  final int movieId;
}

class StreamPageArgs {
  const StreamPageArgs({
    required this.movieId,
    required this.season,
    required this.episode,
    required this.startAt,
  });

  final int movieId;
  final int season;
  final int episode;
  final Duration startAt;
}
