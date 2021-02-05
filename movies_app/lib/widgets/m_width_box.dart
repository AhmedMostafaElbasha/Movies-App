// Package Imports
import 'package:flutter/material.dart';

class MWidthBox extends StatelessWidget {
  final double value;

  MWidthBox(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
