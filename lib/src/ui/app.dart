import 'package:flutter/material.dart';

import '../di/injection.dart';
import 'core/routes/routes.dart';
import 'core/routes/screens_navigator.dart' show navigatorKey;
import 'core/values/colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movo',
      onGenerateRoute: getIt<RouteGenerator>().generateRoutes,
      navigatorKey: navigatorKey,
      theme: ThemeData.dark().copyWith(
        backgroundColor: colorPrimary,
        accentColor: colorAccent,
        splashColor: colorAccent,
        toggleableActiveColor: colorAccent,
        colorScheme: const ColorScheme.light().copyWith(
          primary: colorAccent,
          secondary: colorAccent,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: colorPrimaryLight,
          actionTextColor: colorAccent,
          contentTextStyle: TextStyle(color: colorTextPrimary),
          elevation: 12,
        ),
      ),
    );
  }
}
