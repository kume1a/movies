import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../../data/model/schemas/core/enums.dart';
import '../../../state/stream/stream_bloc.dart';
import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';
import 'video_player/player.dart';
import 'video_player/video_controls.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer(this.id);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StreamBloc, StreamState>(
      buildWhen: (StreamState prev, StreamState curr) =>
          prev.videoSrc != curr.videoSrc || prev.settings != curr.settings,
      builder: (BuildContext context, StreamState state) {
        return state.videoSrc != null
            ? _buildPlayer(
                state.videoSrc!,
                state.settings,
                state.startPosition,
                state.availableLanguages,
                state.availableQualities,
                state.language,
                state.quality,
              )
            : Container(color: colorPreview);
      },
    );
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

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    _initControllers();

    _ticker = Timer.periodic(const Duration(seconds: 4), (Timer timer) async {
      if (_videoPlayerController != null && _chewieController != null && _chewieController?.isPlaying == true) {
        final Duration? position = await _videoPlayerController!.position;
        if (position != null) {
          context.read<StreamBloc>().add(StreamEvent.onPositionTick(position));
        }
      }
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
      customControls: VideoControls(
        doubleTapToSeekValue: widget.settings.doubleTapToSeekValue,
        languages: widget.languages,
        qualities: widget.qualities,
        onLanguageChanged: (Language? value) =>
            context.read<StreamBloc>().add(StreamEvent.languageChanged(value ?? widget.selectedLanguage)),
        onQualityChanged: (Quality? value) =>
            context.read<StreamBloc>().add(StreamEvent.qualityChanged(value ?? widget.selectedQuality)),
        selectedQuality: widget.selectedQuality,
        selectedLanguage: widget.selectedLanguage,
      ),
      errorBuilder: (BuildContext context, String errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: pr,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null ? Chewie(controller: _chewieController!) : const SizedBox.shrink();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _ticker?.cancel();

    Wakelock.disable();
  }
}
