import 'package:flutter/material.dart';
import 'package:movo/src/presentation/screens/favorites/favorites_page.dart';
import 'package:movo/src/presentation/screens/home/home_page.dart';
import 'package:movo/src/presentation/screens/main/widgets/bottomnav_item.dart';
import 'package:movo/src/presentation/screens/main/widgets/navigation_bar.dart';
import 'package:movo/src/presentation/screens/settings/settings_page.dart';
import 'package:movo/src/presentation/values/colors.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

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
