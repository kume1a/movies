import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'route_args.dart';
import 'routes.dart';

class ScreensNavigator {
  ScreensNavigator._();

  static void pop<T>({T? result, bool closeOverlays = false, bool canPop = true, int? id}) =>
      Get.back(result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);

  static Future<T?> pushDetailsPage<T extends Object?>(int movieId) async {
    final DetailsPageArgs args = DetailsPageArgs(movieId: movieId);

    return Get.toNamed(Routes.details, arguments: args);
  }

  static Future<T?> pushDetailsPageAndRemoveUntilRoot<T extends Object?>(int movieId) async {
    final DetailsPageArgs args = DetailsPageArgs(movieId: movieId);

    return Get.offAllNamed(
      Routes.details,
      predicate: (Route<dynamic> route) => route.settings.name == Routes.root,
      arguments: args,
    );
  }

  static Future<T?> pushStreamPage<T extends Object?>({
    required int movieId,
    int? season,
    int? episode,
    int? leftAt,
  }) async {
    final StreamPageArgs args = StreamPageArgs(
      movieId: movieId,
      season: season ?? 1,
      episode: episode ?? 1,
      startAt: Duration(milliseconds: leftAt ?? 0),
    );

    return Get.toNamed(Routes.stream, arguments: args);
  }

  static Future<T?> pushSearchPage<T extends Object?>() async => Get.toNamed(Routes.search);

  static Future<T?> pushMovieGroupPage<T extends Object?>(int groupId) async {
    final MovieGroupPageArgs args = MovieGroupPageArgs(groupId: groupId);

    return Get.toNamed(Routes.movieGroup, arguments: args);
  }

  static Future<T?> pushAddMoviePage<T extends Object?>(int groupId) async {
    final AddMoviePageArgs args = AddMoviePageArgs(groupId: groupId);

    return Get.toNamed(Routes.addMovie, arguments: args);
  }

  static Future<T?> pushSettingsPage<T extends Object?>() async => Get.toNamed(Routes.settings);
}
