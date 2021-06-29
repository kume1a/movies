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
        return state.movies != null
            ? AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: state.movies!.isNotEmpty ? MovieList(state.movies!) : EmptyFavoriteListMessage(),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
