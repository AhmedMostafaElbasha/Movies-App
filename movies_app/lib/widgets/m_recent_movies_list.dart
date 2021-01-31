import 'package:flutter/material.dart';
import 'widgets.dart';
import '../models/models.dart';

class MRecentMoviesList extends StatelessWidget {
  final double height;
  final double width;
  final List<RecentMovieItem> recentMovieItems;

  MRecentMoviesList({
    @required this.height,
    @required this.width,
    this.recentMovieItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                // return MRecentMovieItem(
                //   height: height * 0.68,
                //   width: width * 25,
                //   recentMovieItem: recentMovieItems[index],
                // );
                return Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
