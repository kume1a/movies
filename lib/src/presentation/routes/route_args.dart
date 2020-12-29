import 'package:meta/meta.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';

class DetailsPageArgs {
  final int movieId;

  DetailsPageArgs({@required this.movieId});
}

class StreamPageArgs {
  final MovieData movie;
  final int seasonNumber;
  final int episodeNumber;
  final Duration startAt;

  const StreamPageArgs({
    @required this.movie,
    this.seasonNumber = 1,
    this.episodeNumber = 0,
    this.startAt = const Duration(),
  });
}
