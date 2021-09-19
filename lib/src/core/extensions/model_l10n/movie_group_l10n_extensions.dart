import '../../../data/model/models/movie_groups/movie_group.dart';
import '../../enums/supported_locale.dart';
import 'core/supported_locale_provider.dart';

extension MovieGroupL10NX on MovieGroup {
  List<String> getMovieNames() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return movieNamesEn;
      case SupportedLocale.ka:
        return movieNamesKa;
    }
  }
}
