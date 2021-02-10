// Dart Imports
import 'dart:async';
import 'dart:convert';

// Package Imports
import 'package:http/http.dart' as http;
import 'package:movies_app/models/get_images_error.dart';

// Inner Imports
import '../constants/constants.dart';
import '../models/models.dart';

class MovieImagesRepository {
  Future<GetImagesResponse> getMovieImages(int movieId) async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/$movieId/images?api_key=$apIKey&language=en-US');

    if (response.statusCode == 401) {
      final responseBody = json.decode(response.body);
      final fetched401Error = GetImagesError.fromJson(responseBody);
      throw Exception(fetched401Error.statusMessage);
    } else if (response.statusCode == 404) {
      final responseBody = json.decode(response.body);
      final fetched404Error = GetImagesError.fromJson(responseBody);
      throw Exception(fetched404Error.statusMessage);
    } else {
      final responseBody = json.decode(response.body);
      final fetchedGetMovieImagesResponse =
          GetImagesResponse.fromJson(responseBody);
      return fetchedGetMovieImagesResponse;
    }
  }
}
