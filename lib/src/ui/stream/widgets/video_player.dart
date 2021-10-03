import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../../controllers/stream/stream_controller.dart';
import '../../../core/enums/language.dart';
import '../../../core/enums/quality.dart';
import '../../../data/local/preferences/settings_helper.dart';
import '../../../di/injection.dart';
import '../../core/values/colors.dart';
import 'video_player/player.dart';
import 'video_player/video_player_controls.dart';

class VideoPlayer extends GetView<StreamController> {
  const VideoPlayer(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.videoSrc.value != null
          ? _buildPlayer(
              controller.videoSrc.value!,
              controller.settings.value,
              controller.startPosition.value,
              controller.availableLanguages,
              controller.availableQualities,
              controller.language.value,
              controller.quality.value,
            )
          : Container(color: colorPreview);
    });
  }

  Widget _buildPlayer(
    String src,
    StreamSettings settings,
    Duration startPosition,
    List<Language> availableLanguages,
    List<Quality> availableQualities,
    Language language,
    Quality quality,
  ) {
    return Container(
      color: Colors.black,
      child: Mp4Handler(
        src: src,
        settings: settings,
        startPosition: startPosition,
        languages: availableLanguages,
        qualities: availableQualities,
        selectedQuality: quality,
        selectedLanguage: language,
      ),
    );
  }
}

class Mp4Handler extends StatefulWidget {
  const Mp4Handler({
    required this.src,
    required this.settings,
    required this.startPosition,
    required this.languages,
    required this.qualities,
    required this.selectedLanguage,
    required this.selectedQuality,
  });

  final String src;
  final StreamSettings settings;
  final Duration startPosition;
  final List<Language> languages;
  final List<Quality> qualities;
  final Language selectedLanguage;
  final Quality selectedQuality;

  @override
  _Mp4HandlerState createState() => _Mp4HandlerState();
}

class _Mp4HandlerState extends State<Mp4Handler> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  Timer? _ticker;

  StreamController get controller => Get.find();

  @override
  void initState() {
    super.initState();
    _initControllers();

    getIt<SettingsHelper>().getSaveMovieInterval().then((int value) {
      _ticker = Timer.periodic(Duration(seconds: value), (Timer timer) async {
        if (_videoPlayerController != null && _chewieController != null && _chewieController?.isPlaying == true) {
          final Duration? position = await _videoPlayerController!.position;
          if (position != null) {
            controller.onPositionTick(position);
          }
        }
      });
    });
  }

  @override
  void didUpdateWidget(Mp4Handler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.src != oldWidget.src || widget.settings != oldWidget.settings) {
      _initControllers();
    }
  }

  void _initControllers() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();

    _videoPlayerController = VideoPlayerController.network(widget.src);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoInitialize: true,
      looping: true,
      autoPlay: widget.settings.autoPlayEnabled,
      startAt: widget.startPosition,
      allowFullScreen: false,
      customControls: const VideoPlayerControls(),
      // errorBuilder: (BuildContext context, String errorMessage) {
      //   return Center(
      //     child: Text(
      //       errorMessage,
      //       style: pr,
      //     ),
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) =>
      _chewieController != null ? Chewie(controller: _chewieController!) : const SizedBox.shrink();

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _ticker?.cancel();

    Wakelock.disable();
  }
}
