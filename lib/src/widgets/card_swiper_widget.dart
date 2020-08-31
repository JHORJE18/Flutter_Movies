import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/movie_model.dart';

class CardSwiperWidget extends StatelessWidget {
  final List<Movie> listadoPeliculas;

  CardSwiperWidget({@required this.listadoPeliculas});

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: new Swiper(
          itemBuilder: (context, index) {
            return _crearCard(context, index);
          },
          itemCount: listadoPeliculas.length,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          layout: SwiperLayout.STACK),
    );
  }

  Widget _crearCard(BuildContext context, int i) {
    listadoPeliculas[i].uiHero = '${listadoPeliculas[i].id}-Poster';

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detalle',
          arguments: listadoPeliculas[i]),
      child: Hero(
        tag: listadoPeliculas[i].uiHero,
        child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: new FadeInImage(
                placeholder: AssetImage('assets/img/loading-spinner.gif'),
                image: NetworkImage(listadoPeliculas[i].getPosterImg()),
                fit: BoxFit.fill)),
      ),
    );
  }
}
