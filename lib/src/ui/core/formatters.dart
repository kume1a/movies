import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String formatDuration(BuildContext context, int durationInMinutes, {bool emptyOnZero = true}) {
  if (durationInMinutes == 0 && emptyOnZero) return '';

  final AppLocalizations? appLocalizations = AppLocalizations.of(context);

  final int hours = (durationInMinutes / 60).floor();
  final int minutes = durationInMinutes - hours * 60;

  if (hours == 0) return appLocalizations?.minutes(minutes) ?? '';
  if (minutes == 0) return appLocalizations?.hours(hours) ?? '';
  return appLocalizations?.duration(hours, minutes) ?? '';
}

String formatDurationFromSeconds(BuildContext context, int seconds) {
  final int minutes = (seconds / 60).floor();
  return formatDuration(context, minutes);
}

String formatBigNumber(int num) {
  if (num > 10e+2) return '${(num / 10e+2).round()}k';
  if (num > 10e+5) return '${(num / 10e+5).round()}m';
  if (num > 10e+8) return '${(num / 10e+8).round()}b'; // just in case
  return num.toString();
}

String formatVideoDuration(int ms) {
  int seconds = ms ~/ 1000;
  final int hours = seconds ~/ 3600;
  seconds = seconds % 3600;
  final int minutes = seconds ~/ 60;
  seconds = seconds % 60;

  final String hoursString = hours >= 10
      ? '$hours'
      : hours == 0
      ? '00'
      : '0$hours';

  final String minutesString = minutes >= 10
      ? '$minutes'
      : minutes == 0
      ? '00'
      : '0$minutes';

  final String secondsString = seconds >= 10
      ? '$seconds'
      : seconds == 0
      ? '00'
      : '0$seconds';

  final String formattedTime =
      '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';

  return formattedTime;
}
