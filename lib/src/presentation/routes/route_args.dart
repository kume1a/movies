import 'package:meta/meta.dart';

class DetailsPageArgs {
  final int movieId;

  DetailsPageArgs({@required this.movieId});
}

class StreamPageArgs {
  final int movieId;
  final int season;
  final int episode;
  final Duration startAt;

  const StreamPageArgs({
    @required this.movieId,
    this.season = 1,
    this.episode = 1,
    this.startAt = const Duration(),
  });
}
