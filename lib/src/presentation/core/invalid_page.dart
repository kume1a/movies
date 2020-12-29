import 'package:flutter/material.dart';
import 'package:movo/src/presentation/values/colors.dart';

class InvalidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorPrimary,
      body: Center(
        child: Text(
          'page not found',
          style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
