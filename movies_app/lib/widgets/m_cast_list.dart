import 'package:flutter/material.dart';
import '../models/models.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import 'm_cast_item.dart';

class MCastList extends StatelessWidget {
  final double height;
  final double width;
  final List<Cast> cast;

  MCastList({
    @required this.height,
    @required this.width,
    @required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return MCastItem(
            height: height,
            width: width * 0.3,
            cast: cast[index],
          );
        },
      ),
    );
  }
}
