// Dart Imports
import 'dart:async';
import 'dart:convert';
// Package Imports
import 'package:http/http.dart' as http;
// Inner Imports
import '../constants/constants.dart';
import '../models/models.dart';

/*
RecentMoviesRepository
This class is responsable for getting recent movies list
*/
class RecentMoviesRepository {
  Future<List<RecentMovieItem>> getRecentMovies() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apIKey&language=en-US&page=1');

    if (response.statusCode == 401) {
      final responseBody = json.decode(response.body);
      final extracted401Response = NowPlayingError.fromJson(responseBody);
      throw Exception(extracted401Response.statusMessage);
    } else if (response.statusCode == 404) {
      final responseBody = json.decode(response.body);
      final extracted404Response = NowPlayingError.fromJson(responseBody);
      throw Exception(extracted404Response.statusMessage);
    } else {
      final responseBody = json.decode(response.body);
      final extractedRecentMoviesResponse =
          RecentMoviesList.fromJson(responseBody);
      final recentMovies = extractedRecentMoviesResponse.results;
      return recentMovies;
    }
  }
}
