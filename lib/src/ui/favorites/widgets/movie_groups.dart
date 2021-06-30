import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/values/colors.dart';
import 'add_movie_group_dialog.dart';

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
            return overListLength ? _buildAddGroupItem(context) : _buildItem(state.movieGroups![index]);
          },
        );
      },
    );
  }

  Widget _buildAddGroupItem(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorPrimaryLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () async {
            final String? groupName = await showAddMovieGroupDialog(context);
            if (groupName != null) {
              context.read<FavoritesBloc>().add(FavoritesEvent.groupAdded(groupName));
            }
          },
          child: const SizedBox.expand(
            child: Icon(Icons.add, size: 42),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(MovieGroup movieGroup) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorPrimaryLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(movieGroup.name),
    );
  }
}
