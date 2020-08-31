import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Center(
        child: Image(
          image: NetworkImage(movie.getPosterImg()),
        ),
      ),
    );
  }
}
