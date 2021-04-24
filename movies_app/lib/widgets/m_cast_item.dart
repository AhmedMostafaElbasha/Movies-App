import 'package:flutter/material.dart';
import '../models/models.dart';
import '../models/models.dart';
import 'widgets.dart';

class MCastItem extends StatelessWidget {
  final double height;
  final double width;
  final Cast cast;

  MCastItem({
    @required this.height,
    @required this.width,
    @required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                _buildCastProfilePath(cast.profilePath),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: Text(
                cast.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildCastProfilePath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }
}
