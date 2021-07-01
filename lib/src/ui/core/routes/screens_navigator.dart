import 'package:flutter/widgets.dart';

import 'route_args.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ScreensNavigator {
  ScreensNavigator._();

  static void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  static Future<T?> pushDetailsPage<T extends Object?>(int movieId) async {
    final DetailsPageArgs args = DetailsPageArgs(movieId: movieId);

    return navigatorKey.currentState?.pushNamed(
      Routes.detailsPage,
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
      Routes.streamPage,
      arguments: args,
    );
  }

  static Future<T?> pushSearchPage<T extends Object?>() async {
    return navigatorKey.currentState?.pushNamed(Routes.searchPage);
  }

  static Future<T?> pushMovieGroupPage<T extends Object?>(int groupId) async {
    final MovieGroupPageArgs args = MovieGroupPageArgs(groupId: groupId);

    return navigatorKey.currentState?.pushNamed(
      Routes.movieGroupPage,
      arguments: args,
    );
  }
}
