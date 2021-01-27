import 'package:flutter/material.dart';

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
