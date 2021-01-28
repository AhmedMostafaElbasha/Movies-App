import 'package:flutter/material.dart';
import 'widgets.dart';

class MRecentMoviesList extends StatelessWidget {
  final double height;
  final double width;

  MRecentMoviesList({
    @required this.height,
    @required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MSubHeadingText('Recent'),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: MSeeMoreButton(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.1),
            child: Container(
              height: height * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Text(
                    'data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
