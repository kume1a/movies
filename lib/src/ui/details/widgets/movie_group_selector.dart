import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../di/injection.dart';
import '../../../state/details/movie_group_bloc/movie_group_bloc.dart';
import '../../core/routes/screens_navigator.dart';

Future<MovieGroup?> showMovieGroupSelector(BuildContext context, int movieId) async {
  return showModalBottomSheet<MovieGroup>(
    isScrollControlled: true,
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
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * .7,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.movieGroups?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                final MovieGroup movieGroup = state.movieGroups![index];
                final bool isSelected = movieGroup == state.selectedMovieGroup;

                return ListTile(
                  onTap: () => ScreensNavigator.pop(movieGroup),
                  title: Text(movieGroup.name),
                  tileColor: isSelected ? Colors.white12 : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
