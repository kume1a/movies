import 'package:flutter/material.dart';

import '../routes/screens_navigator.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => ScreensNavigator.pop(),
      icon: const Icon(Icons.arrow_back),
      splashRadius: 24,
    );
  }
}
