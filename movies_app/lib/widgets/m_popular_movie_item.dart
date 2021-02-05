// Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Inner Imports
import '../blocs/blocs.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';
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
            return _buildLoadingStateDisplay();
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
                    _buildMoviePosterImageDisplay(state),
                    _buildMovieInfoDisplay(state),
                  ],
                ),
              ),
            );
          }

          if (state is MovieDetailsLoadFailure) {
            return _buildErrorStateDisplay(state);
          }

          return Container();
        },
      ),
    );
  }

  // Presentation Functions

  Container _buildErrorStateDisplay(MovieDetailsLoadFailure state) {
    return Container(
      height: height,
      width: width,
      child: MErrorState(state.error),
    );
  }

  Padding _buildMovieInfoDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.04),
      child: Container(
        height: height,
        width: width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieTitleDisplay(state),
            _buildMovieDurationDisplay(state),
            _buildMovieGenresDisplay(state),
            _buildMovieDirectorNameDisplay(),
            _buildMovieRatingDisplay(state),
            _buildMovieVoteCountDisplay(state),
          ],
        ),
      ),
    );
  }

  Padding _buildMovieVoteCountDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: MDetailsText('${state.movieItem.voteCount} Reviews'),
    );
  }

  Padding _buildMovieRatingDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRatingIconDisplay(),
          _buildVoteAverageValueDisplay(state),
          _buildMaximumAverageValueDisplay(),
        ],
      ),
    );
  }

  Row _buildMaximumAverageValueDisplay() {
    return Row(
      children: [
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
    );
  }

  Padding _buildVoteAverageValueDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.01),
      child: Text(
        '${state.movieItem.voteAverage} ',
        style: TextStyle(
          fontSize: 26.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding _buildRatingIconDisplay() {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.01),
      child: Icon(
        Icons.star,
        size: 38.0,
        color: moviesRatingIconColor,
      ),
    );
  }

  Padding _buildMovieDirectorNameDisplay() {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: MDetailsText('Director: David Letich'),
    );
  }

  Padding _buildMovieGenresDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: MDetailsText(
        _buildGenresValue(state.movieItem.genres),
      ),
    );
  }

  Padding _buildMovieDurationDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: Text(
        _buildMovieDurationValue(state.movieItem.runtime),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Container _buildLoadingStateDisplay() {
    return Container(
      height: height,
      width: width,
      child: MLoadingState(),
    );
  }

  Padding _buildMovieTitleDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.03),
      child: MMovieItemTitleText(
        state.movieItem.title,
        22.0,
      ),
    );
  }

  Padding _buildMoviePosterImageDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
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
                    _buildMoviePosterPath(state.movieItem.posterPath),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Data Functions

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
