// Package Imports
import 'package:flutter/material.dart';

/*
MDetailsText
A customized Text Widget to display details
*/
class MDetailsText extends StatelessWidget {
  final String value;

  MDetailsText(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: Colors.white54,
        fontSize: 14.0,
      ),
    );
  }
}
