import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../../state/favorites/favorites_bloc.dart';
import '../../core/routes/screens_navigator.dart';
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
            return overListLength ? _buildAddGroupItem(context) : _buildItem(context, state.movieGroups![index]);
          },
        );
      },
    );
  }

  Widget _buildAddGroupItem(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorPrimaryLight,
        child: Material(
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
      ),
    );
  }

  Widget _buildItem(BuildContext context, MovieGroup movieGroup) {
    const int maxMovieNameCount = 6;
    final ListSlice<String> movieNames = movieGroup.movieNames
        .slice(0, movieGroup.movieNames.length >= maxMovieNameCount ? maxMovieNameCount : movieGroup.movieNames.length);

    final Widget header = Align(
      child: Text(
        movieGroup.name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    final Widget content = movieNames.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                header,
                const SizedBox(height: 12),
                for (String movieName in movieNames)
                  Row(
                    children: <Widget>[
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        margin: const EdgeInsets.symmetric(vertical: 9),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          movieName,
                          style: const TextStyle(fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                // if (movieGroup.movieNames.length > 5) SizedBox(height: 8),
                // if (movieGroup.movieNames.length > 5) Text('${movieGroup.movieNames.length - 5} more'),
              ],
            ),
          )
        : Center(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: header));

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorPrimaryLight,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async {
              if (movieGroup.groupId != null) {
                await ScreensNavigator.pushMovieGroupPage(movieGroup.groupId!);
                context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
              }
            },
            child: SizedBox.expand(child: content),
          ),
        ),
      ),
    );
  }
}
