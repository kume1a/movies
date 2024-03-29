import 'dart:async';

import 'package:flutter/material.dart';

import '../values/text_styles.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    required this.onBackPressed,
    required this.onChanged,
    required this.decoration,
  });

  final VoidCallback onBackPressed;
  final ValueChanged<String> onChanged;
  final InputDecoration decoration;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;
  Timer? _debounce;
  bool _showClear = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        _showClear = _controller.text.isNotEmpty;
      });
      if (_debounce?.isActive ?? false) _debounce?.cancel();
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
        if (_showClear)
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
    _debounce?.cancel();
  }
}
