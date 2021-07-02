import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/favorites/favorites_bloc.dart';

enum _SwitcherValue {
  seeAll,
  groups,
}

class ListToGroupSwitcher extends StatelessWidget {
  const ListToGroupSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Material(
        type: MaterialType.transparency,
        child: PopupMenuButton<_SwitcherValue>(
          itemBuilder: (_) {
            return const <PopupMenuEntry<_SwitcherValue>>[
              PopupMenuItem<_SwitcherValue>(
                value: _SwitcherValue.seeAll,
                padding: EdgeInsets.symmetric(horizontal: 48),
                height: 42,
                child: Center(child: Text('See All')),
              ),
              PopupMenuDivider(),
              PopupMenuItem<_SwitcherValue>(
                value: _SwitcherValue.groups,
                padding: EdgeInsets.symmetric(horizontal: 48),
                height: 42,
                child: Center(child: Text('Groups')),
              ),
            ];
          },
          onSelected: (_SwitcherValue value) {
            switch (value) {
              case _SwitcherValue.seeAll:
                context.read<FavoritesBloc>().add(const FavoritesEvent.switchedToSeeAll());
                break;
              case _SwitcherValue.groups:
                context.read<FavoritesBloc>().add(const FavoritesEvent.switchedToMovieGroups());
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
