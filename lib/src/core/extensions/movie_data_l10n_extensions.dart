import 'package:flutter/cupertino.dart';

import '../../data/model/models/movies/movie_data.dart';
import '../enums/supported_locale.dart';
import '../extensions/build_context_extensions.dart';

extension MovieDataL10NX on MovieData {
  String getName(BuildContext context) {
    final SupportedLocale locale = context.locale;
    switch (locale) {
      case SupportedLocale.en:
        return nameEn.isNotEmpty ? nameEn : nameKa;
      case SupportedLocale.ka:
        return nameKa.isNotEmpty ? nameKa : nameEn;
    }
  }
}