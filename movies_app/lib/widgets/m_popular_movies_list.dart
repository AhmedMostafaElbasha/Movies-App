// Package Imports
import 'package:flutter/material.dart';
// Inner Imports
import '../widgets/widgets.dart';
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
                return Padding(
                  padding: EdgeInsets.only(top: height * 0.05),
                  child: MPopularMovieItem(
                    height: height * .57,
                    width: width,
                    popularMovieItem: popularMoviesItems[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
