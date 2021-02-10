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
          children: [
            Container(
              height: height * .8,
              child: CircleAvatar(
                radius: 20.0,
                child: Image.network(
                  _buildCastProfilePath(cast.profilePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.2),
              child: Text(
                cast.name,
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
