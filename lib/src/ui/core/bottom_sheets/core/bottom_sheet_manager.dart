import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../options_selector_bottom_sheet.dart';

@lazySingleton
class BottomSheetManager {
  Future<T?> showOptionsSelector<T extends Enum>(
    List<T> options,
    String Function(T option) toStringMapper,
  ) async {
    return Get.bottomSheet(
      OptionsSelectorBottomSheet<T>(
        options: options,
        toStringMapper: toStringMapper,
      ),
    );
  }
}
