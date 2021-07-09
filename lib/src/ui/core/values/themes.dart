import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData dark = ThemeData.dark().copyWith(
    backgroundColor: colorPrimary,
    accentColor: colorAccent,
    scaffoldBackgroundColor: colorPrimary,
    splashColor: colorAccent,
    toggleableActiveColor: colorAccent,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: colorAccent,
      secondary: colorAccent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? colorTextSecondary : colorTextPrimary,
        ),
        overlayColor: MaterialStateProperty.all<Color>(colorAccent.withOpacity(.5)),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 4,
      textStyle: const TextStyle(color: colorTextPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: colorPrimaryLight,
      actionTextColor: colorAccent,
      contentTextStyle: TextStyle(color: colorTextPrimary),
      elevation: 12,
    ),
  );

  static final ThemeData darkLocaleKa = dark.copyWith(
    textTheme: const TextTheme(
      headline5: TextStyle(fontSize: 21),
      headline6: TextStyle(fontSize: 18),
      bodyText2: TextStyle(color: colorTextSecondary, fontSize: 14),
      bodyText1: TextStyle(color: colorTextSecondary, fontSize: 12),
    ),
  );
}
