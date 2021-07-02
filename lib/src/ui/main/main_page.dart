import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';
import '../../state/favorites/favorites_bloc.dart';
import '../../state/home/home_bloc.dart';
import '../../state/settings/settings_bloc.dart';
import '../core/values/colors.dart';
import '../core/values/text_styles.dart';
import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../settings/settings_page.dart';
import 'widgets/widgets.dart';

const int pageCount = 3;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      bottomNavigationBar: BottomAnimation(
        onItemSelect: (int value) {
          setState(() => _index = value);
        },
        selectedIndex: _index,
        items: <BottomNavItem>[
          BottomNavItem(title: 'Home', iconData: Icons.home_outlined),
          BottomNavItem(title: 'Favorites', iconData: Icons.favorite_border_sharp),
          BottomNavItem(title: 'Settings', iconData: Icons.settings_outlined),
        ],
        activeIconColor: Colors.white,
        backgroundColor: colorAccent,
        itemHoverColor: Colors.white,
        barHeight: 70,
        itemHoverColorOpacity: 0.2,
        inactiveIconColor: Colors.white,
        textStyle: pr13,
        barRadius: 24,
        itemHoverHeight: 50,
        hoverAlignmentDuration: 300,
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          // ignore: always_specify_types
          providers: [
            BlocProvider<FavoritesBloc>(
              create: (_) => getIt<FavoritesBloc>()..add(const FavoritesEvent.init()),
            ),
            BlocProvider<HomeBloc>(
              create: (_) => getIt<HomeBloc>()
                ..add(const HomeEvent.popularMoviesFetchRequested())
                ..add(const HomeEvent.savedMoviesRequested())
                ..add(const HomeEvent.topMoviesPageFetchRequested())
                ..add(const HomeEvent.moviesPageFetchRequested()),
            ),
            BlocProvider<SettingsBloc>(
              create: (_) => getIt<SettingsBloc>()..add(const SettingsEvent.init()),
            ),
          ],
          child: IndexedStack(
            index: _index,
            children: const <Widget>[
              HomePage(),
              FavoritesPage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
