import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movo/src/application/stream/stream_bloc.dart';
import 'package:movo/src/domain/movie/movie_data_model.dart';
import 'package:movo/src/domain/movies/movies_model.dart';
import 'package:movo/src/presentation/core/extensions.dart';
import 'package:movo/src/presentation/core/widgets/movie_item.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/routes/routes.dart';

class RelatedMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          !prev.relatedOption.equals(curr.relatedOption),
      builder: (BuildContext context, StreamState state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.relatedOption.fold(() => 0, (Movies movies) => movies.data.length),
            itemBuilder: (BuildContext context, int index) {
              return state.relatedOption.fold(
                () => const MovieItem(),
                (Movies movies) => _buildItem(context, movies.data[index]),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, MovieData movie) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.streamPage,
          arguments: StreamPageArgs(movie: movie),
        );
      },
      child: MovieItem(
        imageUrl: movie.poster,
        name: movie.name,
        duration: movie.duration,
        plot: movie.plot,
        rating: movie.imdbRating,
        voterCount: movie.voterCount,
      ),
    );
  }
}
