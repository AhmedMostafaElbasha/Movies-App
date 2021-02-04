import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/blocs/movie_details/movie_details.dart';
import 'package:movies_app/constants/arguments.dart';
import 'package:movies_app/constants/colors.dart';
import 'package:movies_app/screens/screens.dart';
import 'package:movies_app/widgets/m_details_text.dart';
import 'widgets.dart';
import '../models/models.dart';
import '../constants/constants.dart';

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
    var movieId = popularMovieItem.id;

    return BlocProvider<MovieDetailsBloc>(
      create: (context) => MovieDetailsBloc()..add(MovieItemPressed(movieId)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoadInProgress) {
            return Container(
              height: height,
              width: width,
              child: MLoadingState(),
            );
          }

          if (state is MovieDetailsLoadSuccess) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MovieDetailsPage.routeName,
                  arguments: Arguments(
                    heroTag: '${state.movieItem.title}popular',
                    movieItem: state.movieItem,
                  ),
                );
              },
              child: Container(
                height: height,
                width: width,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Container(
                        height: height,
                        width: width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: '${state.movieItem.title}popular',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image(
                                  height: height,
                                  width: width * 0.4,
                                  image: NetworkImage(
                                    _buildMoviePosterPath(
                                        state.movieItem.posterPath),
                                  ),
                                  fit: BoxFit.cover,
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
                        height: height,
                        width: width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.03),
                              child: MMovieItemTitleText(
                                state.movieItem.title,
                                22.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                _buildMovieDurationValue(
                                    state.movieItem.runtime),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: MDetailsText(
                                _buildGenresValue(state.movieItem.genres),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: MDetailsText('Director: David Letich'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.02),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.01),
                                    child: Icon(
                                      Icons.star,
                                      size: 38.0,
                                      color: moviesRatingIconColor,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.01),
                                    child: Text(
                                      '${state.movieItem.voteAverage} ',
                                      style: TextStyle(
                                        fontSize: 26.0,
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
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: MDetailsText(
                                  '${state.movieItem.voteCount} Reviews'),
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

          if (state is MovieDetailsLoadFailure) {
            return Container(
              height: height,
              width: width,
              child: MErrorState(state.error),
            );
          }

          return Container();
        },
      ),
    );
  }

  String _buildGenresValue(List<Genre> genres) {
    String genresDisplay = '';
    for (int i = 0; i < genres.length; i++) {
      genresDisplay += '${genres[i].name}, ';
    }
    return genresDisplay;
  }

  String _buildMoviePosterPath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }

  String _buildMovieDurationValue(int filmRuntime) {
    int hours = 0;
    int minutes = filmRuntime;
    String durationInString = '';

    if (minutes > 59) {
      minutes -= 60;
      hours += 1;
      if (minutes > 59) {
        minutes -= 60;
        hours += 1;
      }
      durationInString = durationInString =
          hours.toString() + 'h ' + minutes.toString() + 'min';
    } else {
      durationInString = minutes.toString() + 'min';
    }

    return durationInString;
  }
}
