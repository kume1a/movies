import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionManager {
  Future<bool> isStoragePermissionGranted();

  Future<PermissionStatus> requestStoragePermission();
}

@LazySingleton(as: PermissionManager)
class PermissionManagerImpl implements PermissionManager {
  @override
  Future<bool> isStoragePermissionGranted() => Permission.storage.isGranted;

  @override
  Future<PermissionStatus> requestStoragePermission() => Permission.storage.request();
}
