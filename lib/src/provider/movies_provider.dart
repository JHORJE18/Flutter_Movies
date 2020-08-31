import 'dart:async';
import 'dart:convert';

import 'package:movies/src/models/actor_mode.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  String _apiKey = '06ae02a156f3a61ca9b45d88e2e6def2';
  String _apiVersion = '3';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _populares = new List();
  final _popularesStreamController =
      new StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularesSink =>
      _popularesStreamController.sink.add;
  Stream<List<Movie>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Movie>> getEnCines() async {
    final Uri llamada_url =
        Uri.https(_url, _apiVersion + '/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    return _getResults(llamada_url);
  }

  Future<List<Movie>> getPopulares() async {
    if (_loading) return [];

    _loading = true;
    _popularPage++;

    final Uri llamada_url = Uri.https(_url, _apiVersion + '/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPage.toString()
    });

    // Añade info al Stream
    final resp = await _getResults(llamada_url);
    _populares.addAll(resp);
    popularesSink(_populares);

    _loading = false;
    return resp;
  }

  Future<List<Actor>> getCast(int idMovie) async {
    final Uri llamadaUrl =
        Uri.https(_url, _apiVersion + '/movie/$idMovie/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(llamadaUrl);
    final decodedData = json.decode(resp.body);

    final cast = Cast.fromJsonList(decodedData['cast']);
    return cast.actores;
  }

  Future<List<Movie>> _getResults(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    Movies list = new Movies.fromJsonList(decodedData['results']);

    return list.items;
  }
}
