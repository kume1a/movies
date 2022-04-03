import 'package:flutter/material.dart';

import '../values/colors.dart';

class DialogButtonPositve extends StatelessWidget {
  const DialogButtonPositve({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? colorAccent.withOpacity(.6) : colorAccent,
        ),
        foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) =>
              states.contains(MaterialState.disabled) ? Colors.white.withOpacity(.6) : Colors.white,
        ),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white24),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Text(label),
    );
  }
}

class DialogButtonNegative extends StatelessWidget {
  const DialogButtonNegative({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorPrimary),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white54),
        overlayColor: MaterialStateProperty.all<Color>(Colors.white12),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: Text(label),
    );
  }
}
