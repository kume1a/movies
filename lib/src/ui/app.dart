import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../di/injection.dart';
import '../l10n/translation_locales.dart';
import '../l10n/translations.dart' as tr;
import 'core/routes/routes.dart';
import 'core/values/themes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movo',
      getPages: getIt<RouteGenerator>().getRoutes(),
      theme: Get.locale?.languageCode == 'ka' ? AppThemes.darkLocaleKa : AppThemes.dark,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.fadeIn,
      translations: tr.Translations(),
      locale: TranslationLocales.localeEn,
      fallbackLocale: TranslationLocales.fallbackLocale,
      localizationsDelegates: TranslationLocales.localizationsDelegates,
    );
  }
}
