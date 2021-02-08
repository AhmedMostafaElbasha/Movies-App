import 'package:flutter/material.dart';
import '../screens/screens.dart';
import './../models/models.dart';

class MMovieBackDropItem extends StatelessWidget {
  final double height;
  final double width;
  final BackDrop backdrop;

  MMovieBackDropItem({
    @required this.height,
    @required this.width,
    @required this.backdrop,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: backdrop.filePath == null
          ? null
          : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ImagePreviewPage(
                    backDropImagePath: _buildMoviePosterPath(backdrop.filePath),
                  ),
                ),
              );
            },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              _buildMoviePosterPath(backdrop.filePath),
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  String _buildMoviePosterPath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }
}
