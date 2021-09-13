import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/values/colors.dart';
import '../core/values/text_styles.dart';
import '../favorites/favorites_page.dart';
import '../home/home_page.dart';
import '../statistics/statistics_page.dart';
import 'widgets/widgets.dart';

const int pageCount = 3;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocalizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: colorPrimary,
      bottomNavigationBar: BottomAnimation(
        onItemSelect: (int value) {
          if (value != _index) {
            setState(() => _index = value);
          }
        },
        selectedIndex: _index,
        items: <BottomNavItem>[
          BottomNavItem(
            title: appLocalizations?.bottomNavHome ?? '',
            icon: const Icon(Icons.home_outlined, size: 30),
          ),
          BottomNavItem(
            title: appLocalizations?.bottomNavFavorites ?? '',
            icon: const Icon(Icons.favorite_border_sharp, size: 30),
          ),
          BottomNavItem(
            title: appLocalizations?.bottomNavStatistics ?? '',
            icon: SvgPicture.asset('assets/statistics.svg', width: 30, height: 30, color: Colors.white),
          ),
        ],
        activeIconColor: Colors.white,
        backgroundColor: colorAccent,
        itemHoverColor: Colors.white,
        barHeight: 70,
        itemHoverColorOpacity: 0.2,
        textStyle: pr13,
        barRadius: 24,
        itemHoverHeight: 50,
        hoverAlignmentDuration: 300,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _index,
          children: const <Widget>[
            HomePage(),
            FavoritesPage(),
            StatisticsPage(),
          ],
        ),
      ),
    );
  }
}
