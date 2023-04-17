import 'package:flutter/material.dart';

class FadeInPageRoute<T> extends MaterialPageRoute<T> {
  FadeInPageRoute({
    required super.builder,
    super.settings,
    super.maintainState,
    super.fullscreenDialog,
  }) {
    assert(opaque);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }
}
