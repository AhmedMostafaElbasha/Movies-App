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
    this.recentMovieItems = const [],
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
              itemCount:
                  recentMovieItems.length <= 0 ? 10 : recentMovieItems.length,

              itemBuilder: (context, index) {
                return recentMovieItems.length > 0
                    ? Padding(
                      padding: EdgeInsets.only(right: width * 0.03),
                      child: MRecentMovieItem(
                          height: height,
                          width: width * 0.27,
                          recentMovieItem: recentMovieItems[index],
                        ),
                    )
                    : Text(
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
