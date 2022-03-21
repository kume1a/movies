import 'package:get/get.dart';

import '../../../l10n/translation_keys.dart';

enum OptionMovieGroup {
  editName,
  delete,
}

extension OptionEditDeleteX on OptionMovieGroup {
  String translate() {
    switch (this) {
      case OptionMovieGroup.editName:
        return trOptionMovieGroupEditName.tr;
      case OptionMovieGroup.delete:
        return trOptionMovieGroupDelete.tr;
    }
  }
}
