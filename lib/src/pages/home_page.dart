import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final MovieProvider moviesProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas 🎬'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [_swipeMovies()],
        ),
      ),
    );
  }

  Widget _swipeMovies() {
    return FutureBuilder(
      future: moviesProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiperWidget(
            listadoPeliculas: snapshot.data,
          );
        } else {
          return Container(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
