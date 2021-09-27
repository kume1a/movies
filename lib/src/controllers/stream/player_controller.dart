import 'package:get/get.dart';

import '../../ui/core/dialogs/core/dialog_manager.dart';

class PlayerController extends GetxController {
  PlayerController(
    this._dialogManager,
  );

  final DialogManager _dialogManager;

  void onSettingsPressed() {
    _dialogManager.showStreamSettingsDialog();
  }
}
