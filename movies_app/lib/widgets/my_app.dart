import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';
import '../constants/constants.dart';
import '../screens/screens.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailsBloc>(
          create: (context) => MovieDetailsBloc(),
        ),
        BlocProvider<RecentMoviesBloc>(
          create: (context) => RecentMoviesBloc(),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) => PopularMoviesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        initialRoute: HomePage.routeName,
        routes: routes,
      ),
    );
  }
}
