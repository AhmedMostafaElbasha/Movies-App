import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants/constants.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);
    return Scaffold(
      backgroundColor: moviesBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.05, top: height * 0.13),
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MHeadingText('Search'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
