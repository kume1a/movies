import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/favorites_controller.dart';
import '../../../core/extensions/model_l10n/movie_group_l10n_extensions.dart';
import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../core/values/colors.dart';

class MovieGroups extends GetView<FavoritesController> {
  const MovieGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final RxList<MovieGroup> movieGroups = controller.movieGroups;

      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisExtent: 150,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),
        itemCount: movieGroups.length + 1,
        itemBuilder: (BuildContext context, int index) {
          final bool overListLength = index > movieGroups.length - 1;
          return overListLength ? _buildAddGroupItem(context) : _buildItem(context, movieGroups[index]);
        },
      );
    });
  }

  Widget _buildAddGroupItem(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorPrimaryLight,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: controller.onAddMovieGroupPressed,
            child: const SizedBox.expand(
              child: Icon(Icons.add, size: 42),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, MovieGroup movieGroup) {
    const int maxMovieNameCount = 4;
    final ListSlice<String> movieNames = movieGroup.getMovieNames().slice(
          0,
          movieGroup.getMovieNames().length >= maxMovieNameCount
              ? maxMovieNameCount
              : movieGroup.getMovieNames().length,
        );
    final Widget header = Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          movieGroup.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
            onLongPress: () => controller.onGroupLongPressed(movieGroup),
            onTap: () => controller.onMovieGroupPressed(movieGroup),
            child: SizedBox.expand(child: content),
          ),
        ),
      ),
    );
  }
}
