import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/models.dart';
import '../constants/constants.dart';
import '../utilities/utilities.dart';

class MovieDetailsPage extends StatelessWidget {
  static const routeName = '/movie_details_page';

  @override
  Widget build(BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);

    Arguments arguments = ModalRoute.of(context).settings.arguments;
    String heroTag = arguments.heroTag;
    MovieItem movieItem = arguments.movieItem;

    return Scaffold(
      backgroundColor: moviesBackgroundColor,
      body: Stack(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              height: height * .5,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    _buildMoviePosterPath(movieItem.posterPath),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.black54,
              actions: [
                _buildActionButton(
                  Icons.upload_rounded,
                  () {},
                ),
                _buildActionButton(
                  Icons.favorite_border,
                  () {},
                ),
                MWidthBox(16.0),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MHeightBox(height * 0.24),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: Text(
                                movieItem.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 07.0),
                              child: Text(
                                '(${_buildReleaseYearValue(movieItem.releaseDate)})',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children:
                              _buildGenreDisplayList(movieItem.genres, context),
                        ),
                      ],
                    ),
                    MHeightBox(height * 0.03),
                    _buildMovieRateRatioBar(
                      movieItem.popularity,
                      movieItem.voteAverage,
                      height,
                      width,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: MSubHeadingText('Synopsis'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: MDetailsText(movieItem.overview),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: MCustomDivider(),
                    ),
                    MSubHeadingText('Photogallery'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Function() onPressed) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: onPressed,
    );
  }

  String _buildMoviePosterPath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }

  String _buildReleaseYearValue(String releaseDate) {
    var releaseDateParse = DateTime.parse(releaseDate);
    return releaseDateParse.year.toString();
  }

  List<Widget> _buildGenreDisplayList(
      List<Genre> genres, BuildContext context) {
    return genres
        .map(
          (genre) => _buildGenreDisplayCard(genre.name, context),
        )
        .toList();
  }

  Widget _buildGenreDisplayCard(String genreName, BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, right: 6.0),
      child: Container(
        height: height * 0.03,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(05.0),
          border: Border.all(
            width: 1,
            color: Colors.white70,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Center(
            child: Text(
              genreName,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieRateRatioBar(
    num popularity,
    num rateAverage,
    double height,
    double width,
  ) {
    var fixedPropularityValue = popularity.ceilToDouble().toStringAsFixed(1);
    return Column(
      children: [
        MCustomDivider(),
        MHeightBox(height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 2.0),
              child: Column(
                children: [
                  Text(
                    fixedPropularityValue.replaceRange(1, 4, ''),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: moviesMetaScoreColor,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  MHeightBox(06.0),
                  Text(
                    'Metascore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  MHeightBox(04.0),
                  Icon(
                    Icons.star,
                    color: moviesRatingIconColor,
                    size: 34,
                  ),
                  MHeightBox(04.0),
                  Row(
                    children: [
                      Text(
                        rateAverage.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          ' /',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '10',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
              child: GestureDetector(
                child: Column(
                  children: [
                    MHeightBox(04.0),
                    Icon(
                      Icons.star_border,
                      color: Colors.white70,
                      size: 40,
                    ),
                    MHeightBox(04.0),
                    Text(
                      'Rate This',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        MHeightBox(height * 0.02),
        MCustomDivider(),
      ],
    );
  }
}
