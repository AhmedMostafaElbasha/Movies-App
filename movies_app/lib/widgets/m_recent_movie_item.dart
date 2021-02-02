import 'package:flutter/material.dart';
import '../models/models.dart';
import './widgets.dart';

class MRecentMovieItem extends StatelessWidget {
  final double height;
  final double width;
  final RecentMovieItem recentMovieItem;

  MRecentMovieItem({
    @required this.height,
    @required this.width,
    @required this.recentMovieItem,
  });

  @override
  Widget build(BuildContext context) {
    var movieTitle = recentMovieItem.title;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: movieTitle,
              child: Container(
                height: height * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(08.0),
                  child: Image.network(
                    recentMovieItem.posterPath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            MHeightBox(height * 0.05),
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: MMovieItemTitleText(recentMovieItem.title, 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
