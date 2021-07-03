import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/favorites/favorites_bloc.dart';
import '../../state/home/home_bloc.dart';
import '../core/routes/screens_navigator.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _StatisticsPageContent();
  }
}

class _StatisticsPageContent extends StatelessWidget {
  const _StatisticsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await ScreensNavigator.pushSettingsPage();
        context.read<HomeBloc>().add(const HomeEvent.savedMoviesRequested());
        context.read<FavoritesBloc>().add(const FavoritesEvent.refreshData());
      },
      icon: const Icon(Icons.settings_outlined),
      splashRadius: 24,
      iconSize: 30,
    );
  }
}
