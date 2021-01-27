import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MSubHeadingText extends StatelessWidget {
  final String value;

  MSubHeadingText(this.value);
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 25.0,
        color: moviesTextColor,
      ),
    );
  }
}
