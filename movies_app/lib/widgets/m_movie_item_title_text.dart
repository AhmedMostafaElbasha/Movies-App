import 'package:flutter/material.dart';
import 'package:movies_app/constants/colors.dart';

class MMovieItemTitleText extends StatelessWidget {
  final String value;

  MMovieItemTitleText(this.value);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        color: moviesTextColor,
        fontSize: 16.0,
      ),
    );
  }
}
