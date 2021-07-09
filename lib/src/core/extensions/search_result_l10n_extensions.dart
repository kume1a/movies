import 'package:flutter/material.dart';

import '../../data/model/models/search/search_result.dart';
import '../enums/supported_locale.dart';
import '../extensions/build_context_extensions.dart';

extension SearchResultL10NX on SearchResult {
  String getName(BuildContext context) {
    final SupportedLocale locale = context.locale;
    switch (locale) {
      case SupportedLocale.en:
        return nameEn.isNotEmpty ? nameEn : nameKa;
      case SupportedLocale.ka:
        return nameKa.isNotEmpty ? nameKa : nameEn;
    }
  }

  String getDescription(BuildContext context) {
    final SupportedLocale locale = context.locale;
    switch (locale) {
      case SupportedLocale.en:
        return descriptionEn.isNotEmpty ? descriptionEn : descriptionKa;
      case SupportedLocale.ka:
        return descriptionKa.isNotEmpty ? descriptionKa : descriptionEn;
    }
  }
}
