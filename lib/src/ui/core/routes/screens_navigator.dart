import 'package:flutter/widgets.dart';

import 'route_args.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ScreensNavigator {
  ScreensNavigator._();

  static void pop<T extends Object?>([T? result]) => navigatorKey.currentState?.pop<T>(result);

  static Future<T?> pushDetailsPage<T extends Object?>(int movieId) async {
    final DetailsPageArgs args = DetailsPageArgs(movieId: movieId);

    return navigatorKey.currentState?.pushNamed(
      Routes.details,
      arguments: args,
    );
  }

  static Future<T?> pushDetailsPageAndRemoveUntilRoot<T extends Object?>(int movieId) async {
    final DetailsPageArgs args = DetailsPageArgs(movieId: movieId);

    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.details,
      (Route<dynamic> route) => route.settings.name == Routes.root,
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

    return navigatorKey.currentState?.pushNamed(
      Routes.stream,
      arguments: args,
    );
  }

  static Future<T?> pushSearchPage<T extends Object?>() async => navigatorKey.currentState?.pushNamed(Routes.search);

  static Future<T?> pushMovieGroupPage<T extends Object?>(int groupId) async {
    final MovieGroupPageArgs args = MovieGroupPageArgs(groupId: groupId);

    return navigatorKey.currentState?.pushNamed(
      Routes.movieGroup,
      arguments: args,
    );
  }

  static Future<T?> pushAddMoviePage<T extends Object?>(int groupId) async {
    final AddMoviePageArgs args = AddMoviePageArgs(groupId: groupId);

    return navigatorKey.currentState?.pushNamed(
      Routes.addMovie,
      arguments: args,
    );
  }

  static Future<T?> pushSettingsPage<T extends Object?>() async =>
      navigatorKey.currentState?.pushNamed(Routes.settings);
}
