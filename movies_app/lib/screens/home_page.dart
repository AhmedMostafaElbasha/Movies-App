import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../constants/constants.dart';
import '../utilities/utilities.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    double height = appHeight(context);
    double width = appWidth(context);
    var textController = TextEditingController();

    return Scaffold(
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
                MHeadingText('Search'),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.02, right: height * 0.05),
                  child: MSearchBar(textController),
                ),
                MHeightBox(height * 0.03),
                MListTitleBar(
                  width: width,
                  title: 'Recent',
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.04),
                  child: BlocBuilder<RecentMoviesBloc, RecentMoviesState>(
                    builder: (context, state) {
                      if (state is RecentMoviesLoadInProgress) {
                        return MLoadingState();
                      }

                      if (state is RecentMoviesLoadSuccess) {
                        return MRecentMoviesList(
                          height: height * 0.28,
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
                MHeightBox(height * 0.04),
                MListTitleBar(
                  width: width,
                  title: 'Popular',
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
