import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../details/details_page.dart';
import '../../main/main_page.dart';
import '../../movie_group/movie_group_page.dart';
import '../../search/search_page.dart';
import '../../stream/stream_page.dart';
import 'route_args.dart';
import 'transition_routes.dart';

class Routes {
  Routes._();

  static const String root = '/';
  static const String detailsPage = 'detailsPage';
  static const String streamPage = 'streamPage';
  static const String searchPage = 'searchPage';
  static const String movieGroupPage = 'movie_group';
}

@injectable
class RouteGenerator {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return _createMainPageRoute(settings);
      case Routes.detailsPage:
        return _createDetailsPageRoute(settings);
      case Routes.streamPage:
        return _createStreamPageRoute(settings);
      case Routes.searchPage:
        return _createSearchPageRoute(settings);
      case Routes.movieGroupPage:
        return _createMovieGroupPageRoute(settings);
      default:
        throw Exception('invalid page route: ${settings.name}');
    }
  }

  MaterialPageRoute<void> _createMainPageRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => MainPage(),
    );
  }

  MaterialPageRoute<void> _createDetailsPageRoute(RouteSettings settings) {
    final DetailsPageArgs? args = settings.arguments as DetailsPageArgs?;
    if (args == null) throw Exception();
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => DetailsPage(movieId: args.movieId),
    );
  }

  MaterialPageRoute<void> _createStreamPageRoute(RouteSettings settings) {
    final StreamPageArgs? args = settings.arguments as StreamPageArgs?;
    if (args == null) throw Exception();
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => StreamPage(
        movieId: args.movieId,
        season: args.season,
        episode: args.episode,
        startAt: args.startAt,
      ),
    );
  }

  MaterialPageRoute<void> _createSearchPageRoute(RouteSettings settings) {
    return FadeInPageRoute<void>(
      settings: settings,
      builder: (_) => SearchPage(),
    );
  }

  MaterialPageRoute<void> _createMovieGroupPageRoute(RouteSettings settings) {
    if (settings.arguments == null || settings.arguments is! MovieGroupPageArgs) {
      throw Exception();
    }
    final MovieGroupPageArgs args = settings.arguments! as MovieGroupPageArgs;
    return FadeInPageRoute<void>(
      settings: settings,
      builder: (_) => MovieGroupPage(groupId: args.groupId),
    );
  }
}
