import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:video_player/video_player.dart';

import '../../../../controllers/stream/player_controller.dart';
import '../../../core/formatters.dart';
import '../../../core/routes/screens_navigator.dart';
import '../../../core/values/text_styles.dart';
import 'player.dart';
import 'progress_bar.dart';
import 'progress_colors.dart';

class VideoPlayerControls extends StatefulWidget {
  const VideoPlayerControls({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoPlayerControlsState();
}

class _VideoPlayerControlsState extends State<VideoPlayerControls> {
  static const double barHeight = 48;

  PlayerController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final VideoPlayerValue? latestValue = controller.latestValue.value;

      if (latestValue?.hasError == true) {
        if (controller.chewieController?.errorBuilder != null) {
          return controller.chewieController!.errorBuilder!(
            context,
            controller.chewieController!.videoPlayerController.value.errorDescription ?? '',
          );
        }
        return const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 42,
          ),
        );
      }

      // final bool isInitializing =
      //    _latestValue != null && !_latestValue!.isPlaying && _latestValue!.duration == null || _latestValue!.isBuffering;
      final bool isInitializing = latestValue != null && !latestValue.isInitialized;

      final List<Widget> content = <Widget>[];
      if (isInitializing) {
        content.add(
          const Expanded(child: Center(child: CircularProgressIndicator())),
        );
      } else {
        content.add(_buildTopBar());
        content.add(_buildHitArea());
        content.add(_buildBottomBar());
      }

      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return GestureDetector(
            onTap: controller.onTappedOnScreen,
            onDoubleTap: () {},
            onDoubleTapDown: (TapDownDetails details) =>
                controller.onScreenDoublePressed(constraints.maxWidth, details.localPosition),
            child: Obx(
              () {
                final bool hideControls = controller.hideControls.value;

                return AbsorbPointer(
                  absorbing: hideControls,
                  child: Stack(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        color: hideControls ? Colors.transparent : Colors.black26,
                      ),
                      ClipPath(
                        clipper: RewindClipper(),
                        child: Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            color: controller.showRewind.value ? Colors.white38 : Colors.transparent,
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: ForwardClipper(),
                        child: Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            color: controller.showForward.value ? Colors.white38 : Colors.transparent,
                          ),
                        ),
                      ),
                      Column(children: content),
                    ],
                  ),
                );
              },
            ),
          );
        },
      );
    });
  }

  @override
  void didChangeDependencies() {
    controller.onDidChangeDependencies(ChewieController.of(context));

    super.didChangeDependencies();
  }

  Widget _buildTopBar() {
    return SizedBox(
      height: barHeight,
      child: Obx(
        () => AnimatedOpacity(
          opacity: controller.hideControls.value ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          child: Material(
            type: MaterialType.transparency,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 24),
                ClipOval(
                  child: IconButton(
                    onPressed: () => ScreensNavigator.pop(),
                    splashRadius: 18,
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const Spacer(),
                ClipOval(
                  child: IconButton(
                    onPressed: controller.onSettingsPressed,
                    splashRadius: 18,
                    icon: const Icon(Icons.settings, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    return Expanded(
      child: GestureDetector(
        onTap: controller.onHitAreaPressed,
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
                  controllers: <RiveAnimationController<RuntimeArtboard>>[controller.rewindController],
                ),
              ),
              Obx(
                () => AnimatedOpacity(
                  opacity: controller.latestValue.value != null &&
                          !controller.dragging.value &&
                          !controller.hideControls.value
                      ? 1
                      : 0,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: controller.onPlayPausePressed,
                    child: Obx(
                      () {
                        final bool isFinished =
                            controller.latestValue.value!.position >= controller.latestValue.value!.duration;

                        return isFinished
                            ? const Icon(Icons.replay, size: 54)
                            : (controller.playPauseIconAnimController != null
                                ? AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: controller.playPauseIconAnimController!,
                                    size: 54,
                                    color: Colors.white,
                                  )
                                : const SizedBox.shrink());
                      },
                    ),
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 2,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: RiveAnimation.asset(
                    'assets/forward_rewind_new.riv',
                    controllers: <RiveAnimationController<RuntimeArtboard>>[controller.forwardController],
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
    return Obx(() {
      if (controller.videoPlayerController.value == null || controller.chewieController == null) {
        return const SizedBox.shrink();
      }

      return SizedBox(
        height: barHeight,
        child: Obx(
          () => AnimatedOpacity(
            opacity: controller.hideControls.value ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 24),
                if (context.orientation == Orientation.landscape)
                  Obx(() => controller.isLive.value ? const Expanded(child: Text('LIVE')) : _buildPosition()),
                _buildProgressBar(),
                const SizedBox(width: 24),
                _buildMuteButton(),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildPosition() {
    return Obx(() {
      final VideoPlayerValue? latestValue = controller.latestValue.value;

      final Duration position =
          // ignore: unnecessary_null_comparison
          latestValue != null && latestValue.position != null ? latestValue.position : Duration.zero;
      final Duration duration =
          // ignore: unnecessary_null_comparison
          latestValue != null && latestValue.duration != null ? latestValue.duration : Duration.zero;

      return Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Text(
          '${formatVideoDuration(position.inMilliseconds)} / ${formatVideoDuration(duration.inMilliseconds)}',
          style: pr14,
        ),
      );
    });
  }

  Widget _buildProgressBar() {
    return !controller.isLive.value
        ? Expanded(
            child: Obx(
              () => controller.videoPlayerController.value != null
                  ? VideoProgressBar(
                      controller.videoPlayerController.value!,
                      onDragStart: controller.onProgressBarDragStart,
                      onDragEnd: controller.onProgressBarDragEnd,
                      colors: controller.chewieController?.materialProgressColors ??
                          ChewieProgressColors(
                            playedColor: Theme.of(context).colorScheme.secondary,
                            handleColor: Theme.of(context).colorScheme.secondary,
                            bufferedColor: Theme.of(context).backgroundColor,
                            backgroundColor: Theme.of(context).disabledColor,
                          ),
                    )
                  : const SizedBox.shrink(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildMuteButton() {
    return Obx(
      () => controller.allowMuting.value
          ? GestureDetector(
              onTap: controller.onMutePressed,
              child: Obx(() {
                final VideoPlayerValue? latestValue = controller.latestValue.value;

                return Icon(
                  latestValue != null && latestValue.volume > 0 ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                );
              }),
            )
          : const SizedBox.shrink(),
    );
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
