import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../di/injection.dart';
import '../../../state/details/movie_group_bloc/movie_group_bloc.dart';

Future<MovieGroup?> showMovieGroupSelector(BuildContext context, int movieId) async {
  return showModalBottomSheet<MovieGroup>(
    context: context,
    builder: (_) => _MovieGroupSelector(movieId: movieId),
  );
}

class _MovieGroupSelector extends StatelessWidget {
  const _MovieGroupSelector({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieGroupBloc>(
      create: (_) => getIt<MovieGroupBloc>()..add(MovieGroupEvent.init(movieId)),
      child: BlocBuilder<MovieGroupBloc, MovieGroupState>(
        builder: (BuildContext context, MovieGroupState state) {
          return ListView.builder(
            itemCount: state.movieGroups?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final MovieGroup movieGroup = state.movieGroups![index];

              return ListTile(title: Text(movieGroup.name));
            },
          );
        },
      ),
    );
  }
}
