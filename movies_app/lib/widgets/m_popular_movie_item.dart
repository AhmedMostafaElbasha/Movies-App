import 'package:flutter/material.dart';
import 'package:movies_app/constants/colors.dart';
import 'package:movies_app/widgets/m_details_text.dart';
import 'widgets.dart';
import '../models/models.dart';

class MPopularMovieItem extends StatelessWidget {
  final double height;
  final double width;
  final PopularMovieItem popularMovieItem;

  MPopularMovieItem({
    @required this.height,
    @required this.width,
    @required this.popularMovieItem,
  });

  @override
  Widget build(BuildContext context) {
    var movieTitle = popularMovieItem.title;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Container(
                height: height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: movieTitle,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(08.0),
                        child: Image.network(
                          popularMovieItem.posterPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.04),
              child: Container(
                height: height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: MMovieItemTitleText(
                        movieTitle,
                        20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        '1h 59min',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 09.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: MDetailsText('values'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: MDetailsText('Director:'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.01),
                            child: Icon(
                              Icons.star,
                              size: 28.0,
                              color: moviesRatingIconColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.01),
                            child: Text(
                              '${popularMovieItem.voteAverage} ',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '/ ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child:
                          MDetailsText('${popularMovieItem.voteCount} Reviews'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
