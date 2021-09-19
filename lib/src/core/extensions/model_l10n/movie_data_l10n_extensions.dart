import '../../../data/model/models/movies/movie_data.dart';
import '../../enums/supported_locale.dart';
import 'core/supported_locale_provider.dart';

extension MovieDataL10NX on MovieData {
  String getName() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return nameEn.isNotEmpty ? nameEn : nameKa;
      case SupportedLocale.ka:
        return nameKa.isNotEmpty ? nameKa : nameEn;
    }
  }

  String getPlot() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return plotEn.isNotEmpty ? plotEn : plotKa;
      case SupportedLocale.ka:
        return plotKa.isNotEmpty ? plotKa : plotEn;
    }
  }
}
