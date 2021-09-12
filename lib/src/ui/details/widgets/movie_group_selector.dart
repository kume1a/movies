import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/details/movie_group_selector_controller.dart';
import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../core/routes/screens_navigator.dart';

Future<MovieGroup?> showMovieGroupSelector(BuildContext context, int movieId) async {
  return Get.bottomSheet(
    const _MovieGroupSelector(),
    isScrollControlled: true,
    settings: RouteSettings(
      arguments: movieId,
    ),
  );
}

class _MovieGroupSelector extends GetWidget<MovieGroupSelectorController> {
  const _MovieGroupSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * .7,
      ),
      child: Material(
        child: Obx(() {
          final List<MovieGroup> movieGroups = controller.movieGroups;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: movieGroups.length,
            itemBuilder: (BuildContext context, int index) {
              final MovieGroup movieGroup = movieGroups[index];

              return Obx(
                () => ListTile(
                  onTap: () => ScreensNavigator.pop(result: movieGroup),
                  title: Text(
                    movieGroup.groupId != null ? movieGroup.name : appLocalizations?.detailsOptionNoGroup ?? '',
                  ),
                  tileColor: movieGroup == controller.selectedMovieGroup.value ? Colors.white12 : null,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
