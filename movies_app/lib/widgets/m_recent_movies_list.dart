import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';

class MRecentMoviesList extends StatelessWidget {
  final double height;
  final double width;
  final List<RecentMovieItem> recentMovieItems;

  MRecentMoviesList({
    @required this.height,
    @required this.width,
    this.recentMovieItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentMovieItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: MRecentMovieItem(
                    height: height,
                    width: width * 0.35,
                    recentMovieItem: recentMovieItems[index],
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
