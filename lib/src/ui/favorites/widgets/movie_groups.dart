import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/values/colors.dart';

class MovieGroups extends StatelessWidget {
  const MovieGroups({
    Key? key,
    required this.movieGroups,
  }) : super(key: key);

  final List<MovieGroup>? movieGroups;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState previous, FavoritesState current) =>
          !const DeepCollectionEquality().equals(previous.movieGroups, current.movieGroups),
      builder: (BuildContext context, FavoritesState state) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 7 / 8,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: (state.movieGroups?.length ?? 0) + 1,
          itemBuilder: (BuildContext context, int index) {
            final bool overListLength = index > (state.movieGroups?.length ?? 0) - 1;

            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorPrimaryLight,
                borderRadius: BorderRadius.circular(16),
              ),
              child: overListLength ? const Icon(Icons.add, size: 52) : const Text('name'),
            );
          },
        );
      },
    );
  }
}
