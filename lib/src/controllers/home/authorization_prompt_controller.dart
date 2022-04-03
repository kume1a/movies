import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../data/network/services/authorization_service.dart';
import '../../ui/core/routes/screens_navigator.dart';

@injectable
class AuthorizationPromptDialogController extends GetxController {
  AuthorizationPromptDialogController(this._authorizationService);

  final AuthorizationService _authorizationService;
  late final Timer _reCheckTimer;

  @override
  Future<void> onInit() async {
    super.onInit();

    final bool isAuthorized = await _authorizationService.isAuthorized();
    if (!isAuthorized) {
      await _authorizationService.sendAuthorizationRequest();

      _reCheckTimer = Timer.periodic(
        const Duration(seconds: 15),
        (_) => _checkAuthorizationStatus(),
      );
    } else {
      ScreensNavigator.pop();
    }
  }

  @override
  Future<void> onClose() async {
    _reCheckTimer.cancel();
  }

  Future<void> onCheckPressed() async => _checkAuthorizationStatus();

  Future<void> onResendPressed() async => _authorizationService.sendAuthorizationRequest();

  Future<void> _checkAuthorizationStatus() async {
    final bool isAuthorized = await _authorizationService.isAuthorized();
    if (isAuthorized) {
      ScreensNavigator.pop();
    }
  }
}
