import 'package:flutter/material.dart';
import './../models/models.dart';
import './../widgets/widgets.dart';

class MMovieBackDropsList extends StatelessWidget {
  final double height;
  final double width;
  final List<BackDrop> backdrops;

  MMovieBackDropsList({
    @required this.height,
    @required this.width,
    this.backdrops = const [],
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
            child: backdrops.length == 0
                ? MEmptyState(
                    'screenshots',
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: backdrops.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: width * 0.05),
                        child: MMovieBackDropItem(
                          height: height,
                          width: width * 0.42,
                          backdrop: backdrops[index],
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
