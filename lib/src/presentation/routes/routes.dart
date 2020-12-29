import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movo/src/presentation/core/invalid_page.dart';
import 'package:movo/src/presentation/routes/route_args.dart';
import 'package:movo/src/presentation/screens/details/details_page.dart';
import 'package:movo/src/presentation/screens/main/main_page.dart';
import 'package:movo/src/presentation/screens/search/search_page.dart';
import 'package:movo/src/presentation/screens/stream/stream_page.dart';

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
      final DetailsPageArgs args = settings.arguments as DetailsPageArgs;
      return MaterialPageRoute<DetailsPage>(
        builder: (_) => DetailsPage(movieId: args.movieId),
      );
    case Routes.streamPage:
      final StreamPageArgs args = settings.arguments as StreamPageArgs;
      return MaterialPageRoute<StreamPage>(
        builder: (_) => StreamPage(
          movie: args.movie,
          seasonNumber: args.seasonNumber,
          episodeNumber: args.episodeNumber,
          startAt: args.startAt,
        ),
      );
    case Routes.searchPage:
      return FadeInPageRoute<SearchPage>(
        builder: (_) => SearchPage(),
      );
    default:
      return FadeInPageRoute<InvalidPage>(
        builder: (_) => InvalidPage(),
      );
  }
}

class FadeInPageRoute<T> extends MaterialPageRoute<T> {
  FadeInPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(
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
