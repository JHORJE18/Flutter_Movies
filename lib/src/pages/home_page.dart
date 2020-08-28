import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
          children: [_swipeTarjetas(context)],
        ),
      ),
    );
  }

  Widget _swipeTarjetas(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              "http://via.placeholder.com/350x150",
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          itemWidth: 300.0,
          layout: SwiperLayout.STACK),
    );
  }
}
