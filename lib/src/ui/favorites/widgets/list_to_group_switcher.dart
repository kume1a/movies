import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../../controllers/favorites/favorites_controller.dart';

enum _SwitcherValue {
  seeAll,
  groups,
}

class ListToGroupSwitcher extends GetView<FavoritesController> {
  const ListToGroupSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

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
                child: Center(child: Text(appLocalizations?.favoritesOptionSeeAll ?? '')),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<_SwitcherValue>(
                value: _SwitcherValue.groups,
                padding: const EdgeInsets.symmetric(horizontal: 48),
                height: 42,
                child: Center(child: Text(appLocalizations?.favoritesOptionGroups ?? '')),
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
