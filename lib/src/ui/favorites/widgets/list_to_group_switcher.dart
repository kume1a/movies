import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main/favorites_controller.dart';
import '../../../l10n/translation_keys.dart';

enum _SwitcherValue {
  seeAll,
  groups,
}

class ListToGroupSwitcher extends GetView<FavoritesController> {
  const ListToGroupSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
        type: MaterialType.transparency,
        child: PopupMenuButton<_SwitcherValue>(
          itemBuilder: (_) {
            return <PopupMenuEntry<_SwitcherValue>>[
              PopupMenuItem<_SwitcherValue>(
                value: _SwitcherValue.seeAll,
                padding: const EdgeInsets.symmetric(horizontal: 48),
                height: 42,
                child: Center(child: Text(trFavoritesOptionSeeAll.tr)),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<_SwitcherValue>(
                value: _SwitcherValue.groups,
                padding: const EdgeInsets.symmetric(horizontal: 48),
                height: 42,
                child: Center(child: Text(trFavoritesOptionGroups.tr)),
              ),
            ];
          },
          onSelected: (_SwitcherValue value) {
            switch (value) {
              case _SwitcherValue.seeAll:
                controller.onSwitchedToSeeAll();
                break;
              case _SwitcherValue.groups:
                controller.onSwitchedToMovieGroups();
                break;
            }
          },
          icon: const Icon(Icons.more_vert),
          iconSize: 32,
        ),
      ),
    );
  }
}
