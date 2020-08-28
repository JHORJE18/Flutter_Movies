import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
          children: [_peliculasEnCine()],
        ),
      ),
    );
  }

  Widget _peliculasEnCine() {
    final MovieProvider mp = new MovieProvider();
    mp.getEnCines();

    return CardSwiperWidget(
      listadoPeliculas: [1, 2, 3, 4, 5],
    );
  }
}
