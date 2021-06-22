import 'package:flutter/material.dart';

import '../../values/colors.dart';
import '../../values/text_styles.dart';
import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../settings/settings_page.dart';
import 'widgets/bottomnav_item.dart';
import 'widgets/navigation_bar.dart';

const int pageCount = 3;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin<MainPage> {
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
        child: IndexedStack(
          index: _index,
          children: <Widget>[HomePage(), FavoritesPage(), SettingsPage()],
        ),
      ),
    );
  }
}
