import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../di/injection.dart';
import 'core/routes/routes.dart';
import 'core/routes/screens_navigator.dart' show navigatorKey;
import 'core/values/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movo',
      onGenerateRoute: getIt<RouteGenerator>().generateRoutes,
      navigatorKey: navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppThemes.dark,
      themeMode: ThemeMode.dark,
    );
  }
}
