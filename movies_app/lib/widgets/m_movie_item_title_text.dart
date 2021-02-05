// Package Imports
import 'package:flutter/material.dart';
// Inner Imports
import '../constants/constants.dart';

class MMovieItemTitleText extends StatelessWidget {
  final String value;
  final double fontSize;

  MMovieItemTitleText(
    this.value,
    this.fontSize,
  );

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      maxLines: 2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        color: moviesTextColor,
        fontSize: fontSize,
      ),
    );
  }
}
