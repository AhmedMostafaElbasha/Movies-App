import 'package:flutter/material.dart';
import './../widgets/widgets.dart';
import './../models/models.dart';

class MMoviePostersList extends StatelessWidget {
  final double height;
  final double width;
  final List<Poster> posters;

  MMoviePostersList({
    @required this.height,
    @required this.width,
    this.posters = const [],
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
              itemCount: posters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: width * 0.05),
                  child: MMoviePosterItem(
                    height: height,
                    width: width * 0.34,
                    poster: posters[index],
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
