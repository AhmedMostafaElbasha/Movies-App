import 'package:flutter/material.dart';
import '../screens/screens.dart';
import './../models/models.dart';

class MMoviePosterItem extends StatelessWidget {
  final double height;
  final double width;
  final Poster poster;

  MMoviePosterItem({
    @required this.height,
    @required this.width,
    @required this.poster,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: poster.filePath == null
          ? null
          : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ImagePreviewPage(
                    posterImagePath: _buildMoviePosterPath(poster.filePath),
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
            _buildMoviePosterPath(poster.filePath),
          ),
          fit: BoxFit.fill,
        )),
      ),
    );
  }

  String _buildMoviePosterPath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }
}
