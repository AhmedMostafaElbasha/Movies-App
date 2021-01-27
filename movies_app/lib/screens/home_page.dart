import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../utilities/utilities.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moviesBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 26.0),
        child: SingleChildScrollView(
          child: Container(
            height: appHeight(context),
            width: appWidth(context),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
