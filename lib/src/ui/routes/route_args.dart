class DetailsPageArgs {
  DetailsPageArgs({required this.movieId});

  final int movieId;
}

class StreamPageArgs {
  const StreamPageArgs({
    required this.movieId,
    this.season = 1,
    this.episode = 1,
    this.startAt = const Duration(),
  });

  final int movieId;
  final int season;
  final int episode;
  final Duration startAt;
}
