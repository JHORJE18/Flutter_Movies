import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<dynamic> listadoPeliculas;

  CardSwiperWidget({@required this.listadoPeliculas});

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: new Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: listadoPeliculas.length,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK),
    );
  }
}
