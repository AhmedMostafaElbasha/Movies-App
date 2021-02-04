import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class MListTitleBar extends StatelessWidget {
  final double width;
  final String title;

  MListTitleBar({
    @required this.width,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MSubHeadingText(title),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: MSeeMoreButton(),
          ),
        ],
      ),
    );
  }
}
