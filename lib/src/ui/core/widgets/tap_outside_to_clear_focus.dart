import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TapOutsideToClearFocus extends HookWidget {
  const TapOutsideToClearFocus({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = useFocusNode();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(focusNode),
      child: child,
    );
  }
}
