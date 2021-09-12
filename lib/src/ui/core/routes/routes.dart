import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../di/bindings/add_movie_page_binding.dart';
import '../../../di/bindings/details_page_binding.dart';
import '../../../di/bindings/main_page_binding.dart';
import '../../../di/bindings/movie_group_page_binding.dart';
import '../../../di/bindings/search_page_binding.dart';
import '../../../di/bindings/settings_page_binding.dart';
import '../../../di/bindings/stream_page_binding.dart';
import '../../add_movie/add_movie_page.dart';
import '../../details/details_page.dart';
import '../../main/main_page.dart';
import '../../movie_group/movie_group_page.dart';
import '../../search/search_page.dart';
import '../../settings/settings_page.dart';
import '../../stream/stream_page.dart';

abstract class Routes {
  static const String root = '/';

  static const String details = '/details';
  static const String stream = '/stream';
  static const String search = '/search';
  static const String movieGroup = '/movie_group';
  static const String addMovie = '/add_movie';
  static const String settings = '/settings';
}

@injectable
class RouteGenerator {
  List<GetPage<T?>> getRoutes<T extends Object?>() {
    return <GetPage<T?>>[
      GetPage<T?>(
        name: Routes.root,
        page: () => const MainPage(),
        binding: MainPageBinding(),
      ),
      GetPage<T?>(
        name: Routes.details,
        page: () => const DetailsPage(),
        binding: DetailsPageBinding(),
      ),
      GetPage<T?>(
        name: Routes.stream,
        page: () => const StreamPage(),
        binding: StreamPageBinding(),
      ),
      GetPage<T?>(
        name: Routes.search,
        page: () => const SearchPage(),
        binding: SearchPageBinding(),
      ),
      GetPage<T?>(
        name: Routes.movieGroup,
        page: () => const MovieGroupPage(),
        binding: MovieGroupPageBinding(),
      ),
      GetPage<T?>(
        name: Routes.addMovie,
        page: () => const AddMoviePage(),
        binding: AddMoviePageBinding(),
      ),
      GetPage<T?>(
        name: Routes.settings,
        page: () => const SettingsPage(),
        binding: SettingsPageBinding(),
      ),
    ];
  }
}
