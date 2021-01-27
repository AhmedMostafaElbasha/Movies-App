import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../utilities/utilities.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie_details_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moviesBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
