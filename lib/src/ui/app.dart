import 'package:flutter/material.dart';

import 'routes/routes.dart';
import 'values/colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movo',
      onGenerateRoute: generateRoutes,
      theme: ThemeData.dark().copyWith(
        backgroundColor: colorPrimary,
        accentColor: colorAccent,
        splashColor: colorAccent,
        toggleableActiveColor: colorAccent,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: colorPrimaryLight,
          actionTextColor: colorAccent,
          contentTextStyle: TextStyle(color: colorTextPrimary),
          elevation: 12
        ),
      ),
    );
  }
}
