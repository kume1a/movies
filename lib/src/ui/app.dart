import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../di/injection.dart';
import 'core/routes/routes.dart';
import 'core/values/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movo',
      getPages: getIt<RouteGenerator>().getRoutes(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // locale: state.locale,
      // theme: state.locale.languageCode == 'ka' ? AppThemes.darkLocaleKa : AppThemes.dark,
      theme: Get.locale?.languageCode == 'ka' ? AppThemes.darkLocaleKa : AppThemes.dark,
      themeMode: ThemeMode.dark,
    );
  }
}
