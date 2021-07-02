import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/enums/favorites_page_state.dart';
import '../../state/favorites/favorites_bloc.dart';
import 'widgets/widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState prev, FavoritesState curr) => prev.pageState != curr.pageState,
      builder: (BuildContext context, FavoritesState state) {
        late Widget content;
        switch (state.pageState) {
          case FavoritesPageState.seeAll:
            content = const MovieList();
            break;
          case FavoritesPageState.groups:
            content = const MovieGroups();
            break;
          default:
            content = const SizedBox.shrink();
            break;
        }

        return Stack(
          children: <Widget>[
            content,
            const Positioned(
              right: 0,
              child: ListToGroupSwitcher(),
            ),
          ],
        );
      },
    );
  }
}
