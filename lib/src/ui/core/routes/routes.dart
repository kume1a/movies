import 'package:flutter/material.dart';

import '../../details/details_page.dart';
import '../../main/main_page.dart';
import '../../search/search_page.dart';
import '../../stream/stream_page.dart';
import 'route_args.dart';

class Routes {
  Routes._();

  static const String root = '/';
  static const String detailsPage = 'detailsPage';
  static const String streamPage = 'streamPage';
  static const String searchPage = 'searchPage';
}

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.root:
      return MaterialPageRoute<MainPage>(
        builder: (_) => MainPage(),
      );
    case Routes.detailsPage:
      final DetailsPageArgs? args = settings.arguments as DetailsPageArgs?;
      if (args == null) throw Exception();
      return MaterialPageRoute<DetailsPage>(
        builder: (_) => DetailsPage(movieId: args.movieId),
      );
    case Routes.streamPage:
      final StreamPageArgs? args = settings.arguments as StreamPageArgs?;
      if (args == null) throw Exception();
      return MaterialPageRoute<StreamPage>(
        builder: (_) => StreamPage(
          movieId: args.movieId,
          season: args.season,
          episode: args.episode,
          startAt: args.startAt,
        ),
      );
    case Routes.searchPage:
      return FadeInPageRoute<SearchPage>(
        builder: (_) => SearchPage(),
      );
    default:
      throw Exception('invalid page route: ${settings.name}');
  }
}

class FadeInPageRoute<T> extends MaterialPageRoute<T> {
  FadeInPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ) {
    assert(opaque);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
