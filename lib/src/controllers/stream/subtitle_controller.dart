// ignore_for_file: use_setters_to_change_properties

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/managers/permission_manager.dart';
import '../../data/local/preferences/preferences_helper.dart';
import '../../data/local/subtitle_local_loader.dart';
import '../../data/model/models/subtitles/subtitle.dart';
import '../../data/model/models/subtitles/subtitles.dart';
import '../core/base_controller_middle_man.dart';
import 'player_controls_controller.dart';

class SubtitlesController extends GetxController {
  SubtitlesController(
    this._subtitleLocalLoader,
    this._permissionManager,
    this._preferencesHelper,
    this._playerControlsControllerMiddleMan,
  );

  final SubtitleLocalLoader _subtitleLocalLoader;
  final PermissionManager _permissionManager;
  final PreferencesHelper _preferencesHelper;
  final PlayerControlsControllerMiddleMan _playerControlsControllerMiddleMan;

  final RxBool showSubtitles = true.obs;
  final RxBool showingSubtitles = false.obs;
  final RxInt subtitleOffset = 0.obs;
  final RxDouble subtitleTextSize = 16.0.obs;
  final RxDouble subtitleSpacingFromBottom = 0.0.obs;
  final Rx<Color> subtitleTextColor = Colors.white.obs;
  final RxDouble subtitleBorderThickness = 0.0.obs;
  final Rx<Color> subtitleBorderColor = Colors.black.obs;
  final Rxn<Subtitle> subtitle = Rxn<Subtitle>();

  Subtitles? _subtitles;

  @override
  Future<void> onInit() async {
    super.onInit();

    final double? preferredSubtitleTextSize = await _preferencesHelper.readPreferredSubtitleTextSize();
    if (preferredSubtitleTextSize != null) {
      subtitleTextSize.value = preferredSubtitleTextSize;
    }

    final double? preferredSubtitleSpacingFromBottom =
        await _preferencesHelper.readPreferredSubtitleSpacingFromBottom();
    if (preferredSubtitleSpacingFromBottom != null) {
      subtitleSpacingFromBottom.value = preferredSubtitleSpacingFromBottom;
    }

    final Color? preferredSubtitleTextColor = await _preferencesHelper.readPreferredSubtitleTextColor();
    if (preferredSubtitleTextColor != null) {
      subtitleTextColor.value = preferredSubtitleTextColor;
    }

    final double? preferredSubtitleBorderThickness = await _preferencesHelper.readPreferredSubtitleBorderThickness();
    if (preferredSubtitleBorderThickness != null) {
      subtitleBorderThickness.value = preferredSubtitleBorderThickness;
    }

    final Color? preferredSubtitleBorderColor = await _preferencesHelper.readPreferredSubtitleBorderColor();
    if (preferredSubtitleBorderColor != null) {
      subtitleBorderColor.value = preferredSubtitleBorderColor;
    }
  }

  Future<void> onImportSubtitlesPressed() async {
    _playerControlsControllerMiddleMan.pausePlayer();

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

  void onSubtitleOffsetPlusPressed() => subtitleOffset.value = subtitleOffset.value + 1;

  void onSubtitleOffsetMinusPressed() => subtitleOffset.value = subtitleOffset.value - 1;

  Future<void> onSubtitleTextSizeChanged(double textSize) async {
    subtitleTextSize.value = textSize;

    await _preferencesHelper.writePreferredSubtitleTextSize(textSize);
  }

  Future<void> onSubtitleSpacingFromBottomChanged(double spacingFromBottom) async {
    subtitleSpacingFromBottom.value = spacingFromBottom;

    await _preferencesHelper.writePreferredSubtitleSpacingFromBottom(spacingFromBottom);
  }

  Future<void> onSubtitleTextColorChanged(Color color) async {
    subtitleTextColor.value = color;

    await _preferencesHelper.writePreferredSubtitleTextColor(color);
  }

  Future<void> onSubtitleBorderThicknessChanged(double borderThickness) async {
    subtitleBorderThickness.value = borderThickness;

    await _preferencesHelper.writePreferredSubtitleBorderThickness(borderThickness);
  }

  Future<void> onSubtitleBorderColorChanged(Color borderColor) async {
    subtitleBorderColor.value = borderColor;

    await _preferencesHelper.writePreferredSubtitleBorderColor(borderColor);
  }

  Future<void> _loadSubtitles() async {
    _subtitles = await _subtitleLocalLoader.loadSubtitles();
    showingSubtitles.value = true;
  }

  Future<void> _updateSubtitle(Duration position) async {
    if (_subtitles == null) {
      return;
    }

    final int effectivePosition = position.inMilliseconds - subtitleOffset.value * 1000;

    if (subtitle.value != null && effectivePosition > subtitle.value!.endTime.inMilliseconds) {
      subtitle.value = null;
    }

    for (final Subtitle subtitleItem in _subtitles!.subtitles) {
      final bool validStartTime = effectivePosition > subtitleItem.startTime.inMilliseconds;
      final bool validEndTime = effectivePosition < subtitleItem.endTime.inMilliseconds;
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
      controller.showingSubtitles.value = false;
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
