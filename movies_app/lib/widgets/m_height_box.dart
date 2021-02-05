// Package Imports
import 'package:flutter/material.dart';

/*
 * MHeightBox
 * A customized SizedBox widget to just increase the height
*/
class MHeightBox extends StatelessWidget {
  final double value;

  MHeightBox(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}
