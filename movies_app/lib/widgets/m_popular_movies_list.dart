import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class MPopularMoviesList extends StatelessWidget {
  final double height;
  final double width;
  final List<PopularMovieItem> popularMovieItems;

  MPopularMoviesList({
    @required this.height,
    @required this.width,
    this.popularMovieItems = const [],
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
            child: ListView.builder(
              itemCount:
                  popularMovieItems.length == 0 ? 10 : popularMovieItems.length,
              itemBuilder: (context, index) {
                return popularMovieItems.length > 0
                    ? null
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
