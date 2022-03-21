import '../../l10n/parameterized_translations.dart';

String formatDuration(int durationInMinutes, {bool emptyOnZero = true}) {
  if (durationInMinutes == 0 && emptyOnZero) return '';

  final int hours = (durationInMinutes / 60).floor();
  final int minutes = durationInMinutes - hours * 60;

  if (hours == 0) return ParamTranslations.commonMinutes(minutes);
  if (minutes == 0) return ParamTranslations.commonHours(hours.toString());
  return ParamTranslations.commonDuration(hours, minutes);
}

String formatDurationFromSeconds(int seconds) {
  final int minutes = (seconds / 60).floor();
  return formatDuration(minutes);
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

  final String formattedTime = '${hoursString == '00' ? '' : '$hoursString:'}$minutesString:$secondsString';

  return formattedTime;
}
