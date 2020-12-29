import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movo/src/presentation/screens/main/widgets/bottomnav_item.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

/// Bottom Navigation Widget.
class BottomAnimation extends StatefulWidget {
  // widget parameters
  const BottomAnimation({
    Key key,
    @required this.selectedIndex,
    @required this.items,
    @required this.activeIconColor,
    @required this.inactiveIconColor,
    @required this.backgroundColor,
    @required this.onItemSelect,
    @required this.itemHoverColor,
    this.hoverAlignmentDuration = 700,
    this.iconSize = 30,
    this.textStyle,
    this.barHeight = 80,
    this.barRadius = 0,
    this.itemHoverBorderRadius = 15,
    this.itemHoverColorOpacity = .13,
    this.itemHoverHeight = 55,
    this.itemHoverWidth = 150,
  }) : super(key: key);

  final int selectedIndex;
  final List<BottomNavItem> items;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final double iconSize;
  final TextStyle textStyle;
  final ValueChanged<int> onItemSelect;
  final double barHeight;
  final double barRadius;
  final Color itemHoverColor;
  final double itemHoverColorOpacity;
  final double itemHoverBorderRadius;
  final double itemHoverWidth;
  final double itemHoverHeight;
  final int hoverAlignmentDuration;


  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  TextStyle _textStyle;
  List<BottomNavItem> listItems;

  double calculateContainerPosition(int index) {
    // lerp parameter
    final bool isLtr = Directionality.of(context) == TextDirection.ltr;
    final int listSize = widget.items.length;
    double a = 0.0;
    double b = 0.0;
    // set suitable count for calculate lerp
    if (listSize == 0) {
      a = 0.0;
      b = 0.0;
    } else if (listSize == 2) {
      a = .6;
      b = .6;
    } else if (listSize == 3) {
      a = .8;
      b = .8;
    } else if (listSize == 4) {
      a = .9;
      b = .9;
    } else {
      a = 1;
      b = 1;
    }
    // return calculated lerp
    if (isLtr) {
      return lerpDouble(-a, b, index / (listSize - 1));
    }
    return lerpDouble(b, -a, index / (listSize - 1));
  }

  @override
  void initState() {
    listItems = widget.items;

    _textStyle = widget.textStyle ?? prL18;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            widget.barRadius,
          ),
        ),
      ),
      width: double.infinity,
      height: widget.barHeight,
      child: Stack(
        children: <Widget>[
          AnimatedAlign(
            curve: Curves.ease,
            duration: Duration(milliseconds: widget.hoverAlignmentDuration),
            alignment: Alignment(calculateContainerPosition(widget.selectedIndex), 0),
            child: Container(
              width: widget.itemHoverWidth,
              height: widget.itemHoverHeight,
              decoration: BoxDecoration(
                color: widget.itemHoverColor.withOpacity(widget.itemHoverColorOpacity),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.itemHoverBorderRadius),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listItems.map((BottomNavItem item) {
                final int index = listItems.indexOf(item);
                return GestureDetector(
                  onTap: () => widget.onItemSelect(index),
                  child: BarItem(
                    selected: widget.selectedIndex == index,
                    activeColor: widget.activeIconColor,
                    inactiveColor: widget.inactiveIconColor,
                    icon: item.iconData,
                    title: item.title,
                    iconSize: widget.iconSize,
                    textStyle: _textStyle,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Each item in Bottom Navigation
class BarItem extends StatefulWidget {
  const BarItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.selected,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.iconSize,
    @required this.textStyle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool selected;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;
  final TextStyle textStyle;

  @override
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      width: widget.selected ? 100 : 50,
      duration: const Duration(seconds: 1),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.selected ? widget.activeColor : widget.inactiveColor,
              size: widget.iconSize,
            ),
            const SizedBox(width: 10),
            if (widget.selected) Text(widget.title, style: widget.textStyle) else Container()
          ],
        ),
      ),
    );
  }
}
