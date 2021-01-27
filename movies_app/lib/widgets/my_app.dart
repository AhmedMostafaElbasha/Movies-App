import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../screens/screens.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
