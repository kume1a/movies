import '../../../data/model/models/search/search_result.dart';
import '../../enums/supported_locale.dart';
import 'core/supported_locale_provider.dart';

extension SearchResultL10NX on SearchResult {
  String getName() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return nameEn.isNotEmpty ? nameEn : nameKa;
      case SupportedLocale.ka:
        return nameKa.isNotEmpty ? nameKa : nameEn;
    }
  }

  String getDescription() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return descriptionEn.isNotEmpty ? descriptionEn : descriptionKa;
      case SupportedLocale.ka:
        return descriptionKa.isNotEmpty ? descriptionKa : descriptionEn;
    }
  }
}
