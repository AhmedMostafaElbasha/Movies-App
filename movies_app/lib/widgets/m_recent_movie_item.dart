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
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: recentMovieItem.title,
            child: Container(
              height: height * 0.7,
              width: width,
              child: Image.network(
                recentMovieItem.posterPath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          MHeightBox(height * 0.05),
          Padding(
            padding: EdgeInsets.only(right: width * 0.3),
            child: MMovieItemTitleText(recentMovieItem.title),
          ),
        ],
      ),
    );
  }
}
