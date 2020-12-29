import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movo/src/presentation/values/text_styles.dart';

class SearchBar extends StatefulWidget {
  final VoidCallback onBackPressed;
  final ValueChanged<String> onChanged;
  final InputDecoration decoration;

  const SearchBar({
    this.onBackPressed,
    this.onChanged,
    this.decoration,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller;
  Timer _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(
        const Duration(milliseconds: 500),
        () => widget.onChanged.call(_controller.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          splashColor: Colors.transparent,
          onPressed: widget.onBackPressed,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: TextField(
            controller: _controller,
            autocorrect: false,
            autofocus: true,
            style: pr,
            maxLength: 254,
            textInputAction: TextInputAction.search,
            cursorColor: Colors.white,
            decoration: widget.decoration,
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          splashColor: Colors.transparent,
          onPressed: () => _controller.clear(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _debounce.cancel();
  }
}
