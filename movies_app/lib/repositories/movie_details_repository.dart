import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/models.dart';

class MovieDetailsRepository {
  Future<MovieItem> getMovieDetails(int movieId) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$apIKey&language=en-US');

    if (response.statusCode == 401) {
      final responseBody = json.decode(response.body);
      final fetched401Error = GetDetailsError.fromJson(responseBody);
      throw Exception(fetched401Error.statusMessage);
    } else if (response.statusCode == 404) {
      final responseBody = json.decode(response.body);
      final fetched404Error = GetDetailsError.fromJson(responseBody);
      throw Exception(fetched404Error.statusMessage);
    } else {
      final responseBody = json.decode(response.body);
      final fetchedMovie = MovieItem.fromJson(responseBody);
      return fetchedMovie;
    }
  }
}
