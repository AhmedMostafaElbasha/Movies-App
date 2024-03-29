// Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Inner Imports
import '../screens/screens.dart';
import '../blocs/blocs.dart';
import '../models/models.dart';
import '../constants/constants.dart';
import '../widgets/widgets.dart';

class MRecentMovieItem extends StatelessWidget {
  final double height;
  final double width;
  final RecentMovieItem recentMovieItem;

  MRecentMovieItem({
    @required this.height,
    @required this.width,
    @required this.recentMovieItem,
  });

  @override
  Widget build(BuildContext context) {
    var movieId = recentMovieItem.id;

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
                    heroTag: '${state.movieItem.title}recent',
                    movieItem: state.movieItem,
                  ),
                );
              },
              child: Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMoviePosterImageDisplay(state),
                    MHeightBox(height * 0.03),
                    _buildMovieTitleDisplay(state),
                  ],
                ),
              ),
            );
          }

          if (state is MovieDetailsLoadFailure) {
            return _buildErrorStateDisplay();
          }

          return Container();
        },
      ),
    );
  }

  Container _buildErrorStateDisplay() {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          Icons.error,
          size: 40.0,
          color: moviesRatingIconColor,
        ),
      ),
    );
  }

  Container _buildLoadingStateDisplay() {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Padding _buildMovieTitleDisplay(MovieDetailsLoadSuccess state) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: MMovieItemTitleText(state.movieItem.title, 18.0),
    );
  }

  Hero _buildMoviePosterImageDisplay(MovieDetailsLoadSuccess state) {
    return Hero(
      tag: '${state.movieItem.title}recent',
      child: Container(
        height: height * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            _buildMoviePosterPath(state.movieItem.posterPath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  String _buildMoviePosterPath(String posterImagePath) {
    String newPosterPath = 'https://image.tmdb.org/t/p/original/';
    newPosterPath += posterImagePath;
    return newPosterPath;
  }
}
