import 'package:rive/rive.dart';

// ignore: implementation_imports
import 'package:rive/src/rive_core/animation/animation.dart';

class SingleShotController extends RiveAnimationController<RuntimeArtboard> {
  SingleShotController(this.animationName, {double? mix, this.speed = 1}) : _mix = mix?.clamp(0, 1).toDouble() ?? 1.0;

  LinearAnimationInstance? _instance;
  final String animationName;
  final double speed;

  // Controls the level of mix for the animation, clamped between 0 and 1
  double _mix;

  double get mix => _mix;

  set mix(double value) => _mix = value.clamp(0, 1).toDouble();

  LinearAnimationInstance? get instance => _instance;

  @override
  bool init(RuntimeArtboard artboard) {
    Animation? animation;
    for (final Animation a in artboard.animations) {
      if (a is LinearAnimation && a.name == animationName) {
        animation = a;
      }
    }
    if (animation != null) {
      _instance = LinearAnimationInstance(animation as LinearAnimation);
    }
    _instance?.animation.speed = speed;
    return _instance != null;
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    _instance?.animation.apply(_instance?.time ?? 0, coreContext: artboard, mix: mix);
    if (_instance != null && !_instance!.advance(elapsedSeconds)) {
      isActive = false;
    }
  }

  void run() {
    if (isActive) return;

    instance?.time = 0;
    isActive = true;
  }
}
