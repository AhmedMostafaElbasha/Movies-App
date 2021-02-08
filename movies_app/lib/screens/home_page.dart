// Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Inner Imports
import '../blocs/blocs.dart';
import '../constants/constants.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

/*
HomePage:
This is the home page of the app
 */
class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);
    var textController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentMoviesBloc>(
          create: (context) => RecentMoviesBloc()..add(RecentMoviesFetched()),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) => PopularMoviesBloc()..add(PopularMoviesFetched()),
        ),
      ],
      child: Scaffold(
        backgroundColor: moviesBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.05, top: height * 0.08),
          child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(textController, height),
                  MHeightBox(height * 0.03),
                  _buildRecentMooviesList(height, width),
                  MHeightBox(height * 0.04),
                  _buildPopularMoviesList(height, width)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Presentation Functions

Widget _buildSearchBar(TextEditingController textController, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MHeadingText('Search'),
      Padding(
        padding: EdgeInsets.only(top: height * 0.02, right: height * 0.05),
        child: MSearchBar(textController),
      ),
    ],
  );
}

Widget _buildRecentMooviesList(double height, double width) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MListTitleBar(
        width: width,
        title: 'Recent',
      ),
      Padding(
        padding: EdgeInsets.only(top: height * 0.04),
        child: Container(
          height: height * 0.34,
          width: width,
          child: BlocBuilder<RecentMoviesBloc, RecentMoviesState>(
            builder: (context, state) {
              if (state is RecentMoviesLoadInProgress) {
                return MLoadingState();
              }
              if (state is RecentMoviesLoadSuccess) {
                return MRecentMoviesList(
                  height: height * 0.34,
                  width: width,
                  recentMovieItems: state.recentMovies,
                );
              }

              if (state is RecentMoviesLoadFailure) {
                return MErrorState(state.error);
              }

              return Container();
            },
          ),
        ),
      ),
    ],
  );
}

Widget _buildPopularMoviesList(double height, double width) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MListTitleBar(
        width: width,
        title: 'Popular',
      ),
      Padding(
        padding: EdgeInsets.only(top: height * 0.02),
        child: Container(
          height: height * 0.43,
          width: width,
          child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
            builder: (context, state) {
              if (state is PopularMoviesLoadInProgress) {
                return MLoadingState();
              }

              if (state is PopularMoviesLoadSuccess) {
                return MPopularMoviesList(
                  height: height * 0.4,
                  width: width,
                  popularMoviesItems: state.popularMovies,
                );
              }

              if (state is PopularMoviesLoadFailure) {
                return MErrorState(state.error);
              }

              return Container();
            },
          ),
        ),
      ),
    ],
  );
}
