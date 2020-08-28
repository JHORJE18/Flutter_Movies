import 'dart:convert';

import 'package:movies/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String _apiKey = '06ae02a156f3a61ca9b45d88e2e6def2';
  String _apiVersion = '3';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future<List<Movie>> getEnCines() async {
    final Uri llamada_url =
        Uri.https(_url, _apiVersion + '/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(llamada_url);
    final decodedData = json.decode(resp.body);

    Movies list = new Movies.fromJsonList(decodedData['results']);

    return list.items;
  }
}
