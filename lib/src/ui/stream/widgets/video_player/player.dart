import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'progress_colors.dart';

typedef ChewieRoutePageBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  _ChewieControllerProvider controllerProvider,
);

/// A Video Player with Material and Cupertino skins.
///
/// `video_player` is pretty low level. Chewie wraps it in a friendly skin to
/// make it easy to use!
class Chewie extends StatefulWidget {
  const Chewie({
    super.key,
    required this.controller,
  });

  /// The [ChewieController]
  final ChewieController controller;

  @override
  ChewieState createState() {
    return ChewieState();
  }
}

class ChewieState extends State<Chewie> {
  bool _isFullScreen = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  @override
  void didUpdateWidget(Chewie oldWidget) {
    if (oldWidget.controller != widget.controller) {
      widget.controller.addListener(listener);
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> listener() async {
    if (widget.controller.isFullScreen && !_isFullScreen) {
      _isFullScreen = true;
      await _pushFullScreenWidget(context);
    } else if (_isFullScreen) {
      Navigator.of(context, rootNavigator: true).pop();
      _isFullScreen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ChewieControllerProvider(
      controller: widget.controller,
      child: const PlayerWithControls(),
    );
  }

  Widget _buildFullScreenVideo(
    BuildContext context,
    Animation<double> animation,
    _ChewieControllerProvider controllerProvider,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: controllerProvider,
      ),
    );
  }

  AnimatedWidget _defaultRoutePageBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    _ChewieControllerProvider controllerProvider,
  ) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return _buildFullScreenVideo(context, animation, controllerProvider);
      },
    );
  }

  Widget _fullScreenRoutePageBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final _ChewieControllerProvider controllerProvider = _ChewieControllerProvider(
      controller: widget.controller,
      child: const PlayerWithControls(),
    );

    if (widget.controller.routePageBuilder == null) {
      return _defaultRoutePageBuilder(context, animation, secondaryAnimation, controllerProvider);
    }
    return widget.controller.routePageBuilder!
        .call(context, animation, secondaryAnimation, controllerProvider);
  }

  Future<dynamic> _pushFullScreenWidget(BuildContext context) async {
    final TransitionRoute<void> route = PageRouteBuilder<void>(
      pageBuilder: _fullScreenRoutePageBuilder,
    );

    onEnterFullScreen();

    // if (!widget.controller.allowedScreenSleep) {
    //   Wakelock.enable();
    // }

    await Navigator.of(context, rootNavigator: true).push(route);
    _isFullScreen = false;
    widget.controller.exitFullScreen();

    // The wakelock plugins checks whether it needs to perform an action internally,
    // so we do not need to check Wakelock.isEnabled.
    // Wakelock.disable();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: widget.controller.systemOverlaysAfterFullScreen);
    SystemChrome.setPreferredOrientations(widget.controller.deviceOrientationsAfterFullScreen);
  }

  void onEnterFullScreen() {
    final double videoWidth = widget.controller.videoPlayerController.value.size.width;
    final double videoHeight = widget.controller.videoPlayerController.value.size.height;

    if (widget.controller.systemOverlaysOnEnterFullScreen != null) {
      /// Optional user preferred settings
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: widget.controller.systemOverlaysOnEnterFullScreen,
      );
    } else {
      /// Default behavior
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[]);
    }

    if (widget.controller.deviceOrientationsOnEnterFullScreen != null) {
      /// Optional user preferred settings
      SystemChrome.setPreferredOrientations(widget.controller.deviceOrientationsOnEnterFullScreen!);
    } else {
      final bool isLandscapeVideo = videoWidth > videoHeight;
      final bool isPortraitVideo = videoWidth < videoHeight;

      /// Default behavior
      /// Video w > h means we force landscape
      if (isLandscapeVideo) {
        SystemChrome.setPreferredOrientations(<DeviceOrientation>[
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }

      /// Video h > w means we force portrait
      else if (isPortraitVideo) {
        SystemChrome.setPreferredOrientations(<DeviceOrientation>[
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }

      /// Otherwise if h == w (square video)
      else {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }
    }
  }
}

/// The ChewieController is used to configure and drive the Chewie Player
/// Widgets. It provides methods to control playback, such as [pause] and
/// [play], as well as methods that control the visual appearance of the player,
/// such as [enterFullScreen] or [exitFullScreen].
///
/// In addition, you can listen to the ChewieController for presentational
/// changes, such as entering and exiting full screen mode. To listen for
/// changes to the playback, such as a change to the seek position of the
/// player, please use the standard information provided by the
/// `VideoPlayerController`.
class ChewieController extends ChangeNotifier {
  ChewieController({
    required this.videoPlayerController,
    this.aspectRatio,
    this.autoInitialize = false,
    this.autoPlay = false,
    this.startAt,
    this.looping = false,
    this.fullScreenByDefault = false,
    this.cupertinoProgressColors,
    this.materialProgressColors,
    this.placeholder,
    this.overlay,
    this.showControlsOnInitialize = true,
    this.showControls = true,
    required this.customControls,
    this.errorBuilder,
    this.allowedScreenSleep = true,
    this.isLive = false,
    this.allowFullScreen = true,
    this.allowMuting = true,
    this.allowPlaybackSpeedChanging = true,
    this.playbackSpeeds = const <double>[0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2],
    this.systemOverlaysOnEnterFullScreen,
    this.deviceOrientationsOnEnterFullScreen,
    this.systemOverlaysAfterFullScreen = SystemUiOverlay.values,
    this.deviceOrientationsAfterFullScreen = DeviceOrientation.values,
    this.routePageBuilder,
  }) : assert(
          playbackSpeeds.every((double speed) => speed > 0),
          'The playbackSpeeds values must all be greater than 0',
        );

  /// The controller for the video you want to play
  final VideoPlayerController videoPlayerController;

  /// Initialize the Video on Startup. This will prep the video for playback.
  final bool autoInitialize;

  /// Play the video as soon as it's displayed
  final bool autoPlay;

  /// Start video at a certain position
  final Duration? startAt;

  /// Whether or not the video should loop
  final bool looping;

  /// Weather or not to show the controls when initializing the widget.
  final bool showControlsOnInitialize;

  /// Whether or not to show the controls at all
  final bool showControls;

  /// Defines customised controls. Check [MaterialControls] or
  /// [CupertinoControls] for reference.
  final Widget customControls;

  /// When the video playback runs  into an error, you can build a custom
  /// error message.
  final Widget Function(BuildContext context, String errorMessage)? errorBuilder;

  /// The Aspect Ratio of the Video. Important to get the correct size of the
  /// video!
  ///
  /// Will fallback to fitting within the space allowed.
  final double? aspectRatio;

  /// The colors to use for controls on iOS. By default, the iOS player uses
  /// colors sampled from the original iOS 11 designs.
  final ChewieProgressColors? cupertinoProgressColors;

  /// The colors to use for the Material Progress Bar. By default, the Material
  /// player uses the colors from your Theme.
  final ChewieProgressColors? materialProgressColors;

  /// The placeholder is displayed underneath the Video before it is initialized
  /// or played.
  final Widget? placeholder;

  /// A widget which is placed between the video and the controls
  final Widget? overlay;

  /// Defines if the player will start in fullscreen when play is pressed
  final bool fullScreenByDefault;

  /// Defines if the player will sleep in fullscreen or not
  final bool allowedScreenSleep;

  /// Defines if the controls should be for live stream video
  final bool isLive;

  /// Defines if the fullscreen control should be shown
  final bool allowFullScreen;

  /// Defines if the mute control should be shown
  final bool allowMuting;

  /// Defines if the playback speed control should be shown
  final bool allowPlaybackSpeedChanging;

  /// Defines the set of allowed playback speeds user can change
  final List<double> playbackSpeeds;

  /// Defines the system overlays visible on entering fullscreen
  final List<SystemUiOverlay>? systemOverlaysOnEnterFullScreen;

  /// Defines the set of allowed device orientations on entering fullscreen
  final List<DeviceOrientation>? deviceOrientationsOnEnterFullScreen;

  /// Defines the system overlays visible after exiting fullscreen
  final List<SystemUiOverlay> systemOverlaysAfterFullScreen;

  /// Defines the set of allowed device orientations after exiting fullscreen
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen;

  /// Defines a custom RoutePageBuilder for the fullscreen
  final ChewieRoutePageBuilder? routePageBuilder;

  static ChewieController? of(BuildContext context) {
    final _ChewieControllerProvider? chewieControllerProvider =
        context.dependOnInheritedWidgetOfExactType<_ChewieControllerProvider>();

    return chewieControllerProvider?.controller;
  }

  bool _isFullScreen = false;

  bool get isFullScreen => _isFullScreen;

  bool get isPlaying => videoPlayerController.value.isPlaying;

  bool _isInitialized = false;

  Future<void> initialize() async {
    await videoPlayerController.setLooping(looping);

    if ((autoInitialize || autoPlay) && !videoPlayerController.value.isInitialized) {
      await videoPlayerController.initialize();
    }

    if (autoPlay) {
      if (fullScreenByDefault) {
        enterFullScreen();
      }

      await videoPlayerController.play();
    }

    if (startAt != null) {
      await videoPlayerController.seekTo(startAt!);
    }

    if (fullScreenByDefault) {
      videoPlayerController.addListener(_fullScreenListener);
    }
    _isInitialized = true;
  }

  Future<void> _fullScreenListener() async {
    if (videoPlayerController.value.isPlaying && !_isFullScreen) {
      enterFullScreen();
      videoPlayerController.removeListener(_fullScreenListener);
    }
  }

  void enterFullScreen() {
    _isFullScreen = true;
    notifyListeners();
  }

  void exitFullScreen() {
    _isFullScreen = false;
    notifyListeners();
  }

  void toggleFullScreen() {
    _isFullScreen = !_isFullScreen;
    notifyListeners();
  }

  void togglePause() {
    isPlaying ? pause() : play();
  }

  Future<void> play() async {
    await videoPlayerController.play();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> setLooping(bool looping) async {
    await videoPlayerController.setLooping(looping);
  }

  Future<void> pause() async {
    await videoPlayerController.pause();
  }

  Future<void> seekTo(Duration moment) async {
    await videoPlayerController.seekTo(moment);
  }

  Future<void> setVolume(double volume) async {
    await videoPlayerController.setVolume(volume);
  }
}

class _ChewieControllerProvider extends InheritedWidget {
  const _ChewieControllerProvider({
    required this.controller,
    required super.child,
  });

  final ChewieController controller;

  @override
  bool updateShouldNotify(_ChewieControllerProvider old) => controller != old.controller;
}

class PlayerWithControls extends StatelessWidget {
  const PlayerWithControls({super.key});

  @override
  Widget build(BuildContext context) {
    final ChewieController? chewieController = ChewieController.of(context);

    if (chewieController == null) return const SizedBox.shrink();

    double calculateAspectRatio(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
      final double width = size.width;
      final double height = size.height;

      return width > height ? width / height : height / width;
    }

    Widget buildControls(
      BuildContext context,
      ChewieController chewieController,
    ) {
      return chewieController.showControls ? chewieController.customControls : const SizedBox.shrink();
    }

    Stack buildPlayerWithControls(ChewieController chewieController, BuildContext context) {
      final VideoPlayer videoPlayer = VideoPlayer(chewieController.videoPlayerController);

      return Stack(
        children: <Widget>[
          chewieController.placeholder ?? const SizedBox.shrink(),
          Center(
            child: !chewieController._isInitialized
                ? FutureBuilder<void>(
                    builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SizedBox.shrink();
                      }

                      return AspectRatio(
                        aspectRatio: chewieController.aspectRatio ??
                            chewieController.videoPlayerController.value.aspectRatio,
                        child: videoPlayer,
                      );
                    },
                    future: chewieController.initialize(),
                  )
                : AspectRatio(
                    aspectRatio: chewieController.aspectRatio ??
                        chewieController.videoPlayerController.value.aspectRatio,
                    child: videoPlayer,
                  ),
          ),
          chewieController.overlay ?? const SizedBox.shrink(),
          if (!chewieController.isFullScreen)
            buildControls(context, chewieController)
          else
            SafeArea(
              child: buildControls(context, chewieController),
            ),
        ],
      );
    }

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: calculateAspectRatio(context),
          child: buildPlayerWithControls(chewieController, context),
        ),
      ),
    );
  }
}
