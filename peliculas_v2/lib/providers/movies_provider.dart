import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:peliculas_v2/models/movie.dart';
import 'package:peliculas_v2/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _apiKey = '4bec0b463e754a5eca4f268104db4010';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-MX';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies Provider inicializado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}
