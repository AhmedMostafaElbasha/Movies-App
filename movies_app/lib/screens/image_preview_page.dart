import 'package:flutter/material.dart';
import './../models/models.dart';
import './../utilities/utilities.dart';

class ImagePreviewPage extends StatelessWidget {
  final String posterImagePath;
  final String backDropImagePath;

  ImagePreviewPage({
    this.posterImagePath = '',
    this.backDropImagePath = '',
  });

  @override
  Widget build(BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Hero(
          tag: posterImagePath == '' ? backDropImagePath : posterImagePath,
          child: Container(
            height: height * 0.5,
            width: backDropImagePath == '' ? width * 0.35 : width * 0.45,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(posterImagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
