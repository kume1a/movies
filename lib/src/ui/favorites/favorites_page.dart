import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/favorites/favorites_bloc.dart';
import 'widgets/widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (FavoritesState prev, FavoritesState curr) => prev.movies != curr.movies,
      builder: (BuildContext context, FavoritesState state) {
        return Stack(
          children: <Widget>[
            if (state.movies != null) MovieList(movies: state.movies!) else MovieGroups(movieGroups: state.movieGroups),
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
