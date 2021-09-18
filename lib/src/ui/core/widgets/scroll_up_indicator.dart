import 'package:flutter/material.dart';

class ScrollUpIndicator extends StatefulWidget {
  const ScrollUpIndicator({
    required this.child,
    required this.onScrollToUpPressed,
    this.displacement = 20,
    this.backgroundColor = Colors.white24,
    this.indicatorColor = Colors.white,
    this.splashColor,
  });

  final Widget child;
  final VoidCallback onScrollToUpPressed;
  final double displacement;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color? splashColor;

  @override
  _ScrollUpIndicatorState createState() => _ScrollUpIndicatorState();
}

class _ScrollUpIndicatorState extends State<ScrollUpIndicator> with SingleTickerProviderStateMixin {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.axis == Axis.vertical) {
              final bool shouldShow = notification.metrics.pixels > 150;
              if (shouldShow != _isActive) {
                setState(() => _isActive = shouldShow);
              }
            }
            return false;
          },
          child: widget.child,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: _isActive ? 0 : widget.displacement, end: _isActive ? widget.displacement : 0),
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeIn,
          builder: (BuildContext context, double value, Widget? child) {
            final double progress = value / 20;

            return Transform.translate(
              offset: Offset(0, value),
              child: Opacity(
                opacity: progress,
                child: child,
              ),
            );
          },
          child: ClipOval(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap:  _isActive ? widget.onScrollToUpPressed : null,
                splashColor: widget.splashColor ?? Theme.of(context).splashColor,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.backgroundColor,
                  ),
                  child: Icon(Icons.keyboard_arrow_up_rounded, color: widget.indicatorColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
