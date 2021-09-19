import 'package:get/get.dart';

import 'translation_keys.dart';

class ParameterizedTranslations {
  ParameterizedTranslations._();

  static String commonDuration(int hours, int minutes) => ptrCommonDuration.trParams(<String, String>{
        'hours': hours.toString(),
        'minutes': minutes.toString(),
      });

  static String commonHours(String hours) =>
      ptrCommonHours.trParams(<String, String>{
        'hours': hours,
      });

  static String commonMinutes(int minutes) =>
      ptrCommonMinutes.trParams(<String, String>{
        'minutes': minutes.toString(),
      });

  static String commonReviews(String reviewerCount) =>
      ptrCommonReviews.trParams(<String, String>{
        'count': reviewerCount,
      });

  static String favoritesHeaderDeleteGroup(String groupName) =>
      ptrFavoritesHeaderDeleteGroup.trParams(<String, String>{
        'groupName': groupName,
      });

  static String favoritesContentDeleteGroup(String groupName) =>
      ptrFavoritesContentDeleteGroup.trParams(<String, String>{
        'groupName': groupName,
      });

  static String settingsCommentDoubleTapToSeek(int seconds) =>
      ptrSettingsCommentDoubleTapToSeek.trParams(<String, String>{
        'value': seconds.toString(),
      });

  static String settingsDoubleTapToSeekDialogItem(int seconds) =>
      ptrSettingsDoubleTapToSeekDialogItem.trParams(<String, String>{
        'seconds': seconds.toString(),
      });

  static String settingsCommentSaveMovieInterval(int seconds) =>
      ptrSettingsCommentSaveMovieInterval.trParams(<String, String>{
        'seconds': seconds.toString(),
      });

  static String settingsSaveMovieIntervalDialogItem(int seconds) =>
      ptrSettingsSaveMovieIntervalDialogItem.trParams(<String, String>{
        'seconds': seconds.toString(),
      });

  static String streamSeason(int season) =>
    ptrStreamSeason.trParams(<String, String>{
      'season': season.toString(),
    });

  static String streamEpisode(int episode) =>
      ptrStreamEpisode.trParams(<String, String>{
        'episode': episode.toString(),
      });

  static String streamEp(int episode) =>
      ptrStreamEp.trParams(<String, String>{
        'episode': episode.toString(),
      });
}
