import 'package:flutter/material.dart';

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
