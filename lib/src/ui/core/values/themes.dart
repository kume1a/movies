import 'package:flutter/material.dart';

import 'colors.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: colorPrimary,
    splashColor: colorAccent,
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
    sliderTheme: SliderThemeData(
      trackShape: LessMarginTrackShape(),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorAccent;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorAccent;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorAccent;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colorAccent;
        }
        return null;
      }),
    ),
    colorScheme: const ColorScheme.dark()
        .copyWith(
          primary: colorAccent,
          secondary: colorAccent,
        )
        .copyWith(background: colorPrimary),
  );

  static final ThemeData darkLocaleKa = dark.copyWith(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(fontSize: 21),
      titleLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(color: colorTextSecondary, fontSize: 14),
      bodyLarge: TextStyle(color: colorTextSecondary, fontSize: 12),
    ),
  );
}

class LessMarginTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0;
    final double trackLeft = offset.dx + 12;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 24;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
