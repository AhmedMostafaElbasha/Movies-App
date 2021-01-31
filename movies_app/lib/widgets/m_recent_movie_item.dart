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
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: recentMovieItem.title,
              child: Container(
                height: height * 0.8,
                width: width,
                child: Image.network(
                  recentMovieItem.posterPath,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            MHeightBox(height * 0.05),
            Padding(
              padding: EdgeInsets.only(right: width * 0.25),
              child: MMovieItemTitleText(recentMovieItem.title),
            ),
          ],
        ),
      ),
    );
  }
}
