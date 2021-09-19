import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/enums/language.dart';
import '../../../../core/enums/quality.dart';
import '../../../../core/helpers/language_helper.dart';
import '../../../../core/helpers/quality_helper.dart';
import '../../../../l10n/translation_keys.dart';
import '../../../core/formatters.dart';
import '../../../core/routes/screens_navigator.dart';
import '../../../core/values/text_styles.dart';
import 'player.dart';
import 'progress_bar.dart';
import 'progress_colors.dart';

class VideoControls extends StatefulWidget {
  const VideoControls({
    required this.doubleTapToSeekValue,
    required this.onLanguageChanged,
    required this.onQualityChanged,
    required this.languages,
    required this.qualities,
    required this.selectedLanguage,
    required this.selectedQuality,
  });

  final ValueChanged<Language> onLanguageChanged;
  final ValueChanged<Quality> onQualityChanged;

  final int doubleTapToSeekValue;
  final List<Language> languages;
  final List<Quality> qualities;
  final Language selectedLanguage;
  final Quality selectedQuality;

  @override
  State<StatefulWidget> createState() {
    return _VideoControlsState();
  }
}

class _VideoControlsState extends State<VideoControls> with SingleTickerProviderStateMixin {
  static const double barHeight = 48;

  VideoPlayerValue? _latestValue;
  double? _latestVolume;

  bool _hideControls = true;
  Timer? _hideTimer;
  Timer? _initTimer;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  bool _showForward = false;
  bool _showRewind = false;
  Timer? _forwardTimer;
  Timer? _rewindTimer;

  late RiveAnimationController<RuntimeArtboard> _forwardController;
  late RiveAnimationController<RuntimeArtboard> _rewindController;

  Language? _language;
  Quality? _quality;

  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  AnimationController? _playPauseIconAnimController;

  @override
  Widget build(BuildContext context) {
    if (_latestValue?.hasError == true) {
      if (_chewieController?.errorBuilder != null) {
        return _chewieController!.errorBuilder!(
          context,
          _chewieController!.videoPlayerController.value.errorDescription ?? '',
        );
      }
      return const Center(
        child: Icon(
          Icons.error,
          color: Colors.white,
          size: 42,
        ),
      );
    }

    // final bool isInitializing =
    //    _latestValue != null && !_latestValue!.isPlaying && _latestValue!.duration == null || _latestValue!.isBuffering;
    final bool isInitializing = _latestValue != null && !_latestValue!.isInitialized;

    final List<Widget> content = <Widget>[];
    if (isInitializing) {
      content.add(
        const Expanded(child: Center(child: CircularProgressIndicator())),
      );
    } else {
      content.add(_buildTopBar(isInitializing));
      content.add(_buildHitArea());
      content.add(_buildBottomBar());
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () => _cancelAndRestartTimer(),
          onDoubleTap: () {},
          onDoubleTapDown: (TapDownDetails details) {
            final double leftThreshold = constraints.maxWidth / 2 - 64;
            final double rightThreshold = constraints.maxWidth - constraints.maxWidth / 2 + 64;

            final double x = details.localPosition.dx;
            if (x <= leftThreshold) {
              setState(() {
                _rewindController.isActive = true;
                _showRewind = true;
                _rewindTimer = Timer(const Duration(milliseconds: 250), () {
                  setState(() => _showRewind = false);
                });
              });
              if (_latestValue != null && _chewieController != null) {
                _chewieController!.seekTo(_latestValue!.position - Duration(seconds: widget.doubleTapToSeekValue));
              }
            } else if (x >= rightThreshold) {
              setState(() {
                _forwardController.isActive = true;
                _showForward = true;
                _forwardTimer = Timer(const Duration(milliseconds: 250), () {
                  setState(() => _showForward = false);
                });
              });
              if (_latestValue != null && _chewieController != null) {
                _chewieController!.seekTo(_latestValue!.position + Duration(seconds: widget.doubleTapToSeekValue));
              }
            }
          },
          child: AbsorbPointer(
            absorbing: _hideControls,
            child: Stack(
              children: <Widget>[
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: _hideControls ? Colors.transparent : Colors.black26,
                ),
                ClipPath(
                  clipper: RewindClipper(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: _showRewind ? Colors.white38 : Colors.transparent,
                  ),
                ),
                ClipPath(
                  clipper: ForwardClipper(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: _showForward ? Colors.white38 : Colors.transparent,
                  ),
                ),
                Column(children: content),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _forwardController = OneShotAnimation('forward', autoplay: false);
    _rewindController = OneShotAnimation('forward', autoplay: false);
    super.initState();
  }

  @override
  void dispose() {
    _playPauseIconAnimController?.dispose();
    _forwardController.dispose();
    _rewindController.dispose();
    _dispose();
    super.dispose();
  }

  void _dispose() {
    _controller?.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _forwardTimer?.cancel();
    _rewindTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final ChewieController? _oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    _controller = _chewieController?.videoPlayerController;

    _playPauseIconAnimController ??= AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _playPauseIconAnimController?.reset();

    if (_oldController != _chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  Widget _buildTopBar(bool shouldShowSettings) {
    return SizedBox(
      height: barHeight,
      child: AnimatedOpacity(
        opacity: _hideControls ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            _buildSettingsButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    final bool isFinished = _latestValue!.position >= _latestValue!.duration;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_latestValue != null && _latestValue?.isPlaying == true) {
            if (_displayTapped) {
              setState(() => _hideControls = true);
            } else {
              _cancelAndRestartTimer();
            }
          } else {
            _playPause();
            setState(() => _hideControls = true);
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: RiveAnimation.asset(
                  'assets/forward_rewind_new.riv',
                  controllers: <RiveAnimationController<RuntimeArtboard>>[_rewindController],
                ),
              ),
              AnimatedOpacity(
                opacity: _latestValue != null && !_latestValue!.isPlaying && !_dragging ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: GestureDetector(
                  onTap: () {
                    _playPause();
                  },
                  child: isFinished
                      ? const Icon(Icons.replay, size: 64)
                      : (_playPauseIconAnimController != null
                          ? AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: _playPauseIconAnimController!,
                              size: 64,
                              color: Colors.white,
                            )
                          : const SizedBox.shrink()),
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: RiveAnimation.asset(
                    'assets/forward_rewind_new.riv',
                    controllers: <RiveAnimationController<RuntimeArtboard>>[_forwardController],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    if (_controller == null || _chewieController == null) return const SizedBox.shrink();

    return SizedBox(
      height: barHeight,
      child: AnimatedOpacity(
        opacity: _hideControls ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: <Widget>[
            _buildPlayPause(_controller!),
            if (MediaQuery.of(context).orientation == Orientation.landscape)
              _chewieController!.isLive ? const Expanded(child: Text('LIVE')) : _buildPosition(),
            if (!_chewieController!.isLive) _buildProgressBar(),
            if (_chewieController!.allowMuting) _buildMuteButton(_controller!) else const SizedBox.shrink(),
            if (_chewieController!.allowFullScreen) _buildExpandButton() else const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayPause(VideoPlayerController controller) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 8, right: 4),
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Icon(
          controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPosition() {
    final Duration position =
        // ignore: unnecessary_null_comparison
        _latestValue != null && _latestValue!.position != null ? _latestValue!.position : Duration.zero;
    final Duration duration =
        // ignore: unnecessary_null_comparison
        _latestValue != null && _latestValue!.duration != null ? _latestValue!.duration : Duration.zero;

    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Text(
        '${formatVideoDuration(position.inMilliseconds)} / ${formatVideoDuration(duration.inMilliseconds)}',
        style: pr14,
      ),
    );
  }

  Widget _buildProgressBar() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: _controller != null
            ? VideoProgressBar(
                _controller!,
                onDragStart: () {
                  setState(() {
                    _dragging = true;
                  });

                  _hideTimer?.cancel();
                },
                onDragEnd: () {
                  setState(() {
                    _dragging = false;
                  });

                  _startHideTimer();
                },
                colors: _chewieController?.materialProgressColors ??
                    ChewieProgressColors(
                      playedColor: Theme.of(context).colorScheme.secondary,
                      handleColor: Theme.of(context).colorScheme.secondary,
                      bufferedColor: Theme.of(context).backgroundColor,
                      backgroundColor: Theme.of(context).disabledColor,
                    ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return IconButton(
      onPressed: () async {
        _hideTimer?.cancel();

        final _Setting? settingType = await showModalBottomSheet<_Setting>(
          context: context,
          isScrollControlled: true,
          useRootNavigator: true,
          builder: (BuildContext context) => _SettingsDialog(),
        );

        switch (settingType) {
          case _Setting.language:
            _language = await showModalBottomSheet<Language>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              builder: (BuildContext context) => _BottomSheetDialog<Language>(
                items: widget.languages,
                selected: _language ?? widget.selectedLanguage,
                nameMapper: (Language language) =>
                    LanguageHelper.convertToString(language),
              ),
            );

            if (_language != null) {
              widget.onLanguageChanged.call(_language!);
            }
            break;

          case _Setting.playbackSpeed:
            final double? playbackSpeed = await showModalBottomSheet<double>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              builder: (BuildContext context) => _BottomSheetDialog<double>(
                items: _chewieController?.playbackSpeeds ?? List<double>.empty(),
                selected: _latestValue?.playbackSpeed ?? 1,
                nameMapper: (double t) => t.toString(),
              ),
            );

            if (playbackSpeed != null) {
              _controller?.setPlaybackSpeed(playbackSpeed);
            }

            if (_latestValue?.isPlaying == true) {
              _startHideTimer();
            }
            break;

          case _Setting.quality:
            _quality = await showModalBottomSheet<Quality>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              builder: (BuildContext context) => _BottomSheetDialog<Quality>(
                items: widget.qualities,
                selected: _quality ?? widget.selectedQuality,
                nameMapper: (Quality quality) => QualityHelper.convertToString(quality),
              ),
            );

            if (_quality != null) {
              widget.onQualityChanged.call(_quality!);
            }
            break;
          default:
            break;
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      icon: const Icon(Icons.settings, color: Colors.white),
    );
  }

  Widget _buildMuteButton(VideoPlayerController controller) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue?.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0);
        }
      },
      child: ClipRect(
        child: Container(
          height: barHeight,
          padding: const EdgeInsets.only(left: 8, right: 16),
          child: Icon(
            (_latestValue != null && _latestValue!.volume > 0) ? Icons.volume_up : Icons.volume_off,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandButton() {
    return GestureDetector(
      onTap: _onExpandCollapse,
      child: Container(
        height: barHeight,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Icon(
            _chewieController?.isFullScreen == true ? Icons.fullscreen_exit : Icons.fullscreen,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      _hideControls = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    _controller?.addListener(_updateState);

    _updateState();

    if ((_controller?.value != null && _controller?.value.isPlaying == true) || _chewieController?.autoPlay == true) {
      _startHideTimer();
    }

    if (_chewieController?.showControlsOnInitialize == true) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          _hideControls = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      _hideControls = true;

      _chewieController?.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(const Duration(milliseconds: 300), () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    bool isFinished;
    if (_latestValue?.duration != null) {
      isFinished = _latestValue!.position >= _latestValue!.duration;
    } else {
      isFinished = false;
    }

    setState(() {
      if (_controller?.value.isPlaying == true) {
        _playPauseIconAnimController?.reverse();
        _hideControls = false;
        _hideTimer?.cancel();
        _controller?.pause();
      } else {
        _cancelAndRestartTimer();

        if (_controller != null && !_controller!.value.isInitialized) {
          _controller?.initialize().then((_) {
            _controller?.play();
            _playPauseIconAnimController?.forward();
          });
        } else {
          if (isFinished) {
            _controller?.seekTo(Duration.zero);
          }
          _playPauseIconAnimController?.forward();
          _controller?.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideControls = true;
      });
    });
  }

  void _updateState() {
    if (mounted) {
      setState(() {
        _latestValue = _controller?.value;
      });
    }
  }
}

class RewindClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2 - 80, 0)
      ..cubicTo(
        size.width / 2 - 80,
        0,
        size.width / 2 - 20,
        size.height / 2,
        size.width / 2 - 80,
        size.height,
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ForwardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width / 2 + 80, 0)
      ..cubicTo(
        size.width / 2 + 80,
        0,
        size.width / 2 + 20,
        size.height / 2,
        size.width / 2 + 80,
        size.height,
      )
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

enum _Setting { language, playbackSpeed, quality }

class _SettingsDialog extends StatelessWidget {
  static const List<_Setting> settings = _Setting.values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: settings.length,
      itemBuilder: (BuildContext context, int index) {
        final _Setting setting = settings[index];

        IconData icon;
        String name;
        switch (setting) {
          case _Setting.language:
            name = trStreamOptionLanguage.tr;
            icon = Icons.language;
            break;
          case _Setting.playbackSpeed:
            name = trStreamOptionSpeed.tr;
            icon = Icons.speed;
            break;
          case _Setting.quality:
            name = trStreamOptionQuality.tr;
            icon = Icons.high_quality;
            break;
        }

        return ListTile(
          dense: true,
          title: Text(name),
          leading: Icon(icon, color: Colors.white),
          onTap: () => ScreensNavigator.pop(result: setting),
        );
      },
    );
  }
}

class _BottomSheetDialog<T> extends StatelessWidget {
  const _BottomSheetDialog({
    required this.items,
    required this.selected,
    this.nameMapper,
  });

  final List<T> items;
  final T selected;
  final String Function(T t)? nameMapper;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final T item = items[index];
        return ListTile(
          dense: true,
          title: Row(
            children: <Widget>[
              if (item == selected)
                Icon(
                  Icons.check,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                )
              else
                Container(width: 20),
              const SizedBox(width: 16),
              Text(nameMapper != null ? nameMapper!.call(item) : item.toString()),
            ],
          ),
          selected: item == selected,
          onTap: () => ScreensNavigator.pop(result: item),
        );
      },
      itemCount: items.length,
    );
  }
}
