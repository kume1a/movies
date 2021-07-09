import 'package:flutter/material.dart';

import '../../../data/model/models/actors/actor.dart';
import '../../enums/supported_locale.dart';
import '../../extensions/build_context_extensions.dart';

extension ActorL10NX on Actor {
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
