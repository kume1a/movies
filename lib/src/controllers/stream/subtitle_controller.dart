import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/managers/permission_manager.dart';
import '../../data/local/subtitle_local_loader.dart';
import '../../ui/stream/subtitles/models/subtitle.dart';
import '../core/base_controller_middle_man.dart';

class SubtitlesController extends GetxController {
  SubtitlesController(
    this._subtitleLocalLoader,
    this._permissionManager,
  );

  final SubtitleLocalLoader _subtitleLocalLoader;
  final PermissionManager _permissionManager;

  final RxBool showSubtitles = true.obs;
  final Rxn<Subtitle> subtitle = Rxn<Subtitle>();

  Subtitles? _subtitles;

  Future<void> onImportSubtitlesPressed() async {
    if (await _permissionManager.isStoragePermissionGranted()) {
      _loadSubtitles();
    } else {
      final PermissionStatus storagePermissionStatus = await _permissionManager.requestStoragePermission();
      switch (storagePermissionStatus) {
        case PermissionStatus.denied:
        case PermissionStatus.permanentlyDenied:
          Get.defaultDialog(onConfirm: () => openAppSettings());
          break;

        case PermissionStatus.granted:
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
          _loadSubtitles();
          break;
      }
    }
  }

  Future<void> _loadSubtitles() async {
    _subtitles = await _subtitleLocalLoader.loadSubtitles();
  }

  Future<void> _updateSubtitle(Duration position) async {
    if (_subtitles == null) {
      return;
    }
    if (subtitle.value != null && position.inMilliseconds > subtitle.value!.endTime.inMilliseconds) {
      subtitle.value = null;
    }

    for (final Subtitle subtitleItem in _subtitles!.subtitles) {
      final bool validStartTime = position.inMilliseconds > subtitleItem.startTime.inMilliseconds;
      final bool validEndTime = position.inMilliseconds < subtitleItem.endTime.inMilliseconds;
      if (validStartTime && validEndTime) {
        subtitle.value = subtitleItem;
      }
    }
  }
}

@injectable
class SubtitlesControllerMiddleMan extends BaseControllerMiddleMan<SubtitlesController> {
  void updateSubtitle(Duration position) {
    runIfRegistered((SubtitlesController controller) => controller._updateSubtitle(position));
  }

  void removeCurrentSubtitles() {
    runIfRegistered((SubtitlesController controller) {
      controller.subtitle.value = null;
      controller._subtitles = null;
    });
  }
}

enum SubtitleEncoding {
  utf8,
  latin1,
}

enum SubtitleType {
  webvtt,
  srt,
}
