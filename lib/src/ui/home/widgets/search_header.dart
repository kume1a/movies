import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/favorites/favorites_bloc.dart';
import '../../../state/home/home_bloc.dart';
import '../../core/routes/screens_navigator.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: GestureDetector(
        onTap: () async {
          await ScreensNavigator.pushSearchPage();
          context.read<FavoritesBloc>().add(const FavoritesEvent.favoriteMoviesRequested());
          context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('search', style: scL16),
              SizedBox(height: 4),
              Text('Movies, Actors, Directors', style: sc22),
              Divider(color: colorTextSecondary)
            ],
          ),
        ),
      ),
    );
  }
}
