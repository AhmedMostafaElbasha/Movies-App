import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/models.dart';
import '../models/models.dart';
import '../models/models.dart';
import '../models/models.dart';
import './../models/models.dart';
import '../constants/constants.dart';

class MovieCreditsRepository {
  Future<GetCreditsResponse> getMovieCredits(int movieId) async {
    final response = await http.get(
      'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apIKey&language=en-US',
    );

    final responseBody = json.decode(response.body);

    if (response.statusCode == 401 || response.statusCode == 404) {
      final fetchedError = GetCreditsError.fromJson(responseBody);
      throw Exception(fetchedError.statusMessage);
    }

    print(responseBody);
    final fetchedMovieCredits = GetCreditsResponse.fromJson(responseBody);
    return fetchedMovieCredits;
  }
}
