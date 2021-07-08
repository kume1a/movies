import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../di/injection.dart';
import '../state/app/app_bloc.dart';
import 'core/routes/routes.dart';
import 'core/routes/screens_navigator.dart' show navigatorKey;
import 'core/values/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (_) => getIt<AppBloc>()..add(const AppEvent.init()),
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (AppState previous, AppState current) => previous.locale != current.locale,
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'movo',
            onGenerateRoute: getIt<RouteGenerator>().generateRoutes,
            navigatorKey: navigatorKey,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            theme: AppThemes.dark,
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }
}
