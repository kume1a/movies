import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movies/movie_data.dart';
import '../../../state/stream/stream_bloc.dart';
import '../../core/widgets/movie_item.dart';

class RelatedMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) => prev.related != curr.related,
      builder: (BuildContext context, StreamState state) {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 6),
            itemCount: state.related != null ? state.related!.data.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return state.related != null
                  ? _buildItem(context, state.related!.data[index])
                  : const MovieItem();
            },
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        context.read<StreamBloc>()
          ..add(StreamEvent.movieChanged(movie.movieId))
          ..add(const StreamEvent.seasonChanged(1))
          ..add(const StreamEvent.episodeChanged(1))
          ..add(const StreamEvent.fetchRelatedRequested());
      },
      child: MovieItem(
        imageUrl: movie.poster,
        name: movie.name,
        duration: movie.duration,
        plot: movie.plot,
        rating: movie.imdbRating,
        voterCount: movie.voterCount,
        releaseYear: movie.year,
      ),
    );
  }
}
