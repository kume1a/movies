import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movo/src/domain/core/enums.dart';
import 'package:movo/src/presentation/core/formatters.dart';
import 'package:movo/src/presentation/screens/stream/widgets/video_player/player.dart';
import 'package:movo/src/presentation/screens/stream/widgets/video_player/progress_bar.dart';
import 'package:movo/src/presentation/screens/stream/widgets/video_player/progress_colors.dart';
import 'package:movo/src/presentation/values/constants.dart';
import 'package:movo/src/presentation/values/text_styles.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatefulWidget {
  final ValueChanged<Language> onLanguageChanged;
  final ValueChanged<Quality> onQualityChanged;

  final int doubleTapToSeekValue;
  final List<Language> languages;
  final List<Quality> qualities;
  final Language selectedLanguage;
  final Quality selectedQuality;

  const VideoControls({
    @required this.doubleTapToSeekValue,
    @required this.onLanguageChanged,
    @required this.onQualityChanged,
    @required this.languages,
    @required this.qualities,
    @required this.selectedLanguage,
    @required this.selectedQuality,
  });

  @override
  State<StatefulWidget> createState() {
    return _VideoControlsState();
  }
}

class _VideoControlsState extends State<VideoControls> with SingleTickerProviderStateMixin {
  static const double barHeight = 48;

  VideoPlayerValue _latestValue;
  double _latestVolume;

  bool _hideStuff = true;
  Timer _hideTimer;
  Timer _initTimer;
  Timer _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;

  bool _showForward = false;
  bool _showRewind = false;
  Timer _forwardTimer;
  Timer _rewindTimer;

  Language _language;
  Quality _quality;

  VideoPlayerController _controller;
  ChewieController _chewieController;
  AnimationController _playPauseIconAnimController;

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      if (_chewieController.errorBuilder != null) {
        return _chewieController.errorBuilder(
          context,
          _chewieController.videoPlayerController.value.errorDescription,
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

    final bool isInitializing =
        _latestValue != null && !_latestValue.isPlaying && _latestValue.duration == null ||
            _latestValue.isBuffering;

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
                _showRewind = true;
                _rewindTimer = Timer(const Duration(milliseconds: 250), () {
                  setState(() => _showRewind = false);
                });
              });
              _chewieController
                  .seekTo(_latestValue.position - Duration(seconds: widget.doubleTapToSeekValue));
            } else if (x >= rightThreshold) {
              setState(() {
                _showForward = true;
                _forwardTimer = Timer(const Duration(milliseconds: 250), () {
                  setState(() => _showForward = false);
                });
              });
              _chewieController
                  .seekTo(_latestValue.position + Duration(seconds: widget.doubleTapToSeekValue));
            }
          },
          child: AbsorbPointer(
            absorbing: _hideStuff,
            child: Column(children: content),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _playPauseIconAnimController?.dispose();
    _dispose();
    super.dispose();
  }

  void _dispose() {
    _controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _forwardTimer?.cancel();
    _rewindTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final ChewieController _oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    _controller = _chewieController.videoPlayerController;

    _playPauseIconAnimController ??= AnimationController(
      vsync: this,
      duration: longAnimDuration,
      reverseDuration: longAnimDuration,
    );

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
        opacity: _hideStuff ? 0 : 1,
        duration: mediumAnimDuration,
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
    final bool isFinished = _latestValue.position >= _latestValue.duration;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (_latestValue != null && _latestValue.isPlaying) {
            if (_displayTapped) {
              setState(() => _hideStuff = true);
            } else {
              _cancelAndRestartTimer();
            }
          } else {
            _playPause();
            setState(() => _hideStuff = true);
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _showRewind ? 1 : 0,
                duration: shortAnimDuration,
                child: Icon(Icons.fast_rewind, color: Colors.white, size: 32),
              ),
              AnimatedOpacity(
                opacity: _latestValue != null && !_latestValue.isPlaying && !_dragging ? 1 : 0,
                duration: mediumAnimDuration,
                child: GestureDetector(
                  child: isFinished
                      ? const Icon(Icons.replay, size: 64)
                      : AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: _playPauseIconAnimController,
                          size: 64,
                          color: Colors.white,
                        ),
                  onTap: () {
                    _playPause();
                  },
                ),
              ),
              AnimatedOpacity(
                opacity: _showForward ? 1 : 0,
                duration: shortAnimDuration,
                child: Icon(Icons.fast_forward, color: Colors.white, size: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return SizedBox(
      height: barHeight,
      child: AnimatedOpacity(
        opacity: _hideStuff ? 0 : 1,
        duration: mediumAnimDuration,
        child: Row(
          children: <Widget>[
            _buildPlayPause(_controller),
            if (MediaQuery.of(context).orientation == Orientation.landscape)
              _chewieController.isLive ? const Expanded(child: Text('LIVE')) : _buildPosition(),
            if (!_chewieController.isLive) _buildProgressBar(),
            if (_chewieController.allowMuting) _buildMuteButton(_controller) else SizedBox.shrink(),
            if (_chewieController.allowFullScreen) _buildExpandButton() else SizedBox.shrink(),
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
    final Duration position = _latestValue != null && _latestValue.position != null
        ? _latestValue.position
        : Duration.zero;
    final Duration duration = _latestValue != null && _latestValue.duration != null
        ? _latestValue.duration
        : Duration.zero;

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
        child: VideoProgressBar(
          _controller,
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
          colors: _chewieController.materialProgressColors ??
              ChewieProgressColors(
                  playedColor: Theme.of(context).accentColor,
                  handleColor: Theme.of(context).accentColor,
                  bufferedColor: Theme.of(context).backgroundColor,
                  backgroundColor: Theme.of(context).disabledColor),
        ),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return IconButton(
      onPressed: () async {
        _hideTimer?.cancel();

        final _Setting settingType = await showModalBottomSheet<_Setting>(
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
                nameMapper: (Language t) {
                  switch (t) {
                    case Language.geo:
                      return 'geo';
                    case Language.eng:
                      return 'eng';
                    case Language.rus:
                      return 'rus';
                  }
                  return '';
                },
              ),
            );

            widget.onLanguageChanged.call(_language);
            break;

          case _Setting.playbackSpeed:
            final double playbackSpeed = await showModalBottomSheet<double>(
              context: context,
              isScrollControlled: true,
              useRootNavigator: true,
              builder: (BuildContext context) => _BottomSheetDialog<double>(
                items: _chewieController.playbackSpeeds,
                selected: _latestValue.playbackSpeed,
                nameMapper: (double t) => t.toString(),
              ),
            );

            if (playbackSpeed != null) {
              _controller.setPlaybackSpeed(playbackSpeed);
            }

            if (_latestValue.isPlaying) {
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
                nameMapper: (Quality quality) {
                  switch (quality) {
                    case Quality.medium:
                      return 'medium';
                    case Quality.high:
                      return 'high';
                  }
                  return '';
                },
              ),
            );

            widget.onQualityChanged.call(_quality);
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

        if (_latestValue.volume == 0) {
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
            (_latestValue != null && _latestValue.volume > 0) ? Icons.volume_up : Icons.volume_off,
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
            _chewieController.isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
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
      _hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    _controller.addListener(_updateState);

    _updateState();

    if ((_controller.value != null && _controller.value.isPlaying) || _chewieController.autoPlay) {
      _startHideTimer();
    }

    if (_chewieController.showControlsOnInitialize) {
      _initTimer = Timer(shortAnimDuration, () {
        setState(() {
          _hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      _hideStuff = true;

      _chewieController.toggleFullScreen();
      _showAfterExpandCollapseTimer = Timer(mediumAnimDuration, () {
        setState(() {
          _cancelAndRestartTimer();
        });
      });
    });
  }

  void _playPause() {
    bool isFinished;
    if (_latestValue.duration != null) {
      isFinished = _latestValue.position >= _latestValue.duration;
    } else {
      isFinished = false;
    }

    setState(() {
      if (_controller.value.isPlaying) {
        _playPauseIconAnimController.reverse();
        _hideStuff = false;
        _hideTimer?.cancel();
        _controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!_controller.value.initialized) {
          _controller.initialize().then((_) {
            _controller.play();
            _playPauseIconAnimController.forward();
          });
        } else {
          if (isFinished) {
            _controller.seekTo(const Duration());
          }
          _playPauseIconAnimController.forward();
          _controller.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void _updateState() {
    if (mounted) {
      setState(() {
        _latestValue = _controller.value;
      });
    }
  }
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
            name = 'Language';
            icon = Icons.language;
            break;
          case _Setting.playbackSpeed:
            name = 'Speed';
            icon = Icons.speed;
            break;
          case _Setting.quality:
            name = 'Quality';
            icon = Icons.high_quality;
            break;
        }

        return ListTile(
          dense: true,
          title: Text(name),
          leading: Icon(icon),
          onTap: () {
            Navigator.of(context).pop(setting);
          },
        );
      },
    );
  }
}

class _BottomSheetDialog<T> extends StatelessWidget {
  final List<T> items;
  final T selected;
  final String Function(T t) nameMapper;

  const _BottomSheetDialog({
    @required this.items,
    @required this.selected,
    @required this.nameMapper,
  });

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
                  color: Theme.of(context).accentColor,
                )
              else
                Container(width: 20),
              const SizedBox(width: 16),
              Text(nameMapper != null ? nameMapper.call(item) : item.toString()),
            ],
          ),
          selected: item == selected,
          onTap: () {
            Navigator.of(context).pop(item);
          },
        );
      },
      itemCount: items.length,
    );
  }
}
