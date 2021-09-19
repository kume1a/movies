import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main/favorites_controller.dart';
import '../../core/enums/favorites_page_state.dart';
import 'widgets/widgets.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(() {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else {
            switch (controller.pageState.value) {
              case FavoritesPageState.seeAll:
                return const MovieList();
              case FavoritesPageState.groups:
                return const MovieGroups();
              default:
                return const SizedBox.shrink();
            }
          }
        }),
        const Positioned(
          right: 0,
          child: ListToGroupSwitcher(),
        ),
      ],
    );
  }
}
