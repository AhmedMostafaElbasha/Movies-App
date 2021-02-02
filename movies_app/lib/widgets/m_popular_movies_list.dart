import 'package:flutter/material.dart';
import 'widgets.dart';
import '../models/models.dart';

class MPopularMoviesList extends StatelessWidget {
  final double height;
  final double width;
  final List<PopularMovieItem> popularMoviesItems;

  MPopularMoviesList({
    @required this.height,
    @required this.width,
    this.popularMoviesItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          Container(
            height: height,
            child: ListView.builder(
              itemCount: popularMoviesItems.length,
              itemBuilder: (context, index) {
                return MPopularMovieItem(
                  height: height * .4,
                  width: width,
                  popularMovieItem: popularMoviesItems[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
