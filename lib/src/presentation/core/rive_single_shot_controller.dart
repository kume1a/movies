import 'package:rive/rive.dart';
import 'package:rive/src/rive_core/animation/animation.dart';

class SingleShotController extends RiveAnimationController<RuntimeArtboard> {
  SingleShotController(this.animationName, {double mix, double speed = 1})
      : _mix = mix?.clamp(0, 1)?.toDouble() ?? 1.0,
        speed = speed;

  LinearAnimationInstance _instance;
  final String animationName;
  final double speed;

  // Controls the level of mix for the animation, clamped between 0 and 1
  double _mix;

  double get mix => _mix;

  set mix(double value) => _mix = value?.clamp(0, 1)?.toDouble() ?? 1;

  LinearAnimationInstance get instance => _instance;

  @override
  bool init(RuntimeArtboard artboard) {
    final Animation animation = artboard.animations.firstWhere(
      (Animation animation) => animation is LinearAnimation && animation.name == animationName,
      orElse: () => null,
    );
    if (animation != null) {
      _instance = LinearAnimationInstance(animation as LinearAnimation);
    }
    _instance.animation.speed = speed;
    return _instance != null;
  }

  @override
  void apply(RuntimeArtboard artboard, double elapsedSeconds) {
    _instance.animation.apply(_instance.time, coreContext: artboard, mix: mix);
    if (!_instance.advance(elapsedSeconds)) {
      isActive = false;
    }
  }

  void run() {
    if (isActive) return;

    instance.time = 0;
    isActive = true;
  }
}
