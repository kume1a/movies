import '../../../data/model/models/actors/actor.dart';
import '../../enums/supported_locale.dart';
import 'core/supported_locale_provider.dart';

extension ActorL10NX on Actor {
  String getName() {
    switch (SupportedLocaleProvider.locale) {
      case SupportedLocale.en:
        return nameEn.isNotEmpty ? nameEn : nameKa;
      case SupportedLocale.ka:
        return nameKa.isNotEmpty ? nameKa : nameEn;
    }
  }
}
