import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movies_app/models/models.dart';

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
                MHeightBox(height * 0.05),
                MListTitleBar(
                  width: width,
                  title: 'Recent',
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: MRecentMoviesList(
                    height: height * 0.3,
                    width: width,
                    recentMovieItems: [
                      RecentMovieItem(
                        posterPath:
                            'https://upload.wikimedia.org/wikipedia/ar/0/0e/Sm2_peter_onesheet.jpg',
                        title: 'Spider Man 2',
                      ),
                      RecentMovieItem(
                        posterPath: 'https://upload.wikimedia.org/wikipedia/ar/0/0e/Sm2_peter_onesheet.jpg',
                        title: 'The Amazing Spider Man',
                      ),RecentMovieItem(
                        posterPath:
                        'https://cdn.dribbble.com/users/1968881/screenshots/4636369/attachments/1047684/daily_ui_movie_app_3.png',
                        title: 'Spider Man 2',
                      ),
                    ],
                  ),
                ),
                MHeightBox(height * 0.02),
                MListTitleBar(
                  width: width,
                  title: 'Popular',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
