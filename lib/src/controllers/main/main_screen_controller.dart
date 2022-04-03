import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../core/enums/supported_locale.dart';
import '../../core/helpers/enum_helpers/supported_locale_helper.dart';
import '../../data/local/preferences/settings_helper.dart';
import '../../data/network/services/authorization_service.dart';
import '../../ui/core/dialogs/core/dialog_manager.dart';

@injectable
class MainScreenController extends GetxController {
  MainScreenController(
    this._settingsHelper,
    this._authorizationService,
    this._dialogManager,
  );

  final SettingsHelper _settingsHelper;
  final AuthorizationService _authorizationService;
  final DialogManager _dialogManager;

  @override
  Future<void> onInit() async {
    super.onInit();

    final SupportedLocale supportedLocale = await _settingsHelper.readLocale();
    Get.updateLocale(SupportedLocaleHelper.getLocale(supportedLocale));

    final bool isAuthorized = await _authorizationService.isAuthorized();
    if (!isAuthorized) {
      _dialogManager.showAuthorizationPromptDialog();
    }
  }
}
