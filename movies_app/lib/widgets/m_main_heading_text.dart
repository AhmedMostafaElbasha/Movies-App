// Package Imports
import 'package:flutter/material.dart';
// Inner Imports
import '../constants/constants.dart';

class MHeadingText extends StatelessWidget {
  final String value;
  MHeadingText(this.value);
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 50.0,
        color: moviesTextColor,
      ),
    );
  }
}
