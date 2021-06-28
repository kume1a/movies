import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class ScrollUpRefreshIndicators extends StatefulWidget {
  const ScrollUpRefreshIndicators({
    required this.child,
    required this.onRefresh,
    required this.onScrollToUpPressed,
  });

  final Widget child;
  final VoidCallback onScrollToUpPressed;
  final RefreshCallback onRefresh;

  @override
  _ScrollUpRefreshIndicatorsState createState() => _ScrollUpRefreshIndicatorsState();
}

class _ScrollUpRefreshIndicatorsState extends State<ScrollUpRefreshIndicators> with SingleTickerProviderStateMixin {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      backgroundColor: colorAccent,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.axis == Axis.vertical) {
                final bool shouldShow = notification.metrics.pixels > 120;
                if (shouldShow != _active) {
                  setState(() => _active = shouldShow);
                }
              }
              return false;
            },
            child: widget.child,
          ),
          TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: _active ? 0 : 20, end: _active ? 20 : 0),
            duration: const Duration(milliseconds: 200),
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
            child: GestureDetector(
              onTap: widget.onScrollToUpPressed,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.2),
                ),
                child: const Icon(Icons.keyboard_arrow_up_rounded, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
