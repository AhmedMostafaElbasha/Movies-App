// Dart Imports
import 'dart:async';
import 'dart:convert';
// Package Imports
import 'package:http/http.dart' as http;
// Inner Imports
import '../constants/constants.dart';
import '../models/models.dart';

/*
PopularMoviesRepository
This class is responsable for getting popular movies list
*/
class PopularMoviesRepository {
  Future<List<PopularMovieItem>> getPopularMovies() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/popular?api_key=$apIKey&language=en-US&page=1');

    if (response.statusCode == 401) {
      final responseBody = json.decode(response.body);
      final extracted401Error = PopularError.fromJson(responseBody);
      throw Exception(extracted401Error.statusMessage);
    } else if (response.statusCode == 404) {
      final responseBody = json.decode(response.body);
      final extracted404Error = PopularError.fromJson(responseBody);
      throw Exception(extracted404Error.statusMessage);
    } else {
      final responseBody = json.decode(response.body);
      final extractedPopularMoviesResponse =
          PopularMoviesList.fromJson(responseBody);
      final popularMovies = extractedPopularMoviesResponse.results;
      return popularMovies;
    }
  }
}
