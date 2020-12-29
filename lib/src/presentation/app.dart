import 'package:flutter/material.dart';
import 'package:movo/src/presentation/routes/routes.dart';
import 'package:movo/src/presentation/values/colors.dart';

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
        toggleableActiveColor: colorAccent
      ),
    );
  }
}
