import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';

class MoviesHorizontalWidget extends StatelessWidget {
  final List<Movie> listadoPeliculas;
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);
  final Function nextPage;

  MoviesHorizontalWidget(
      {@required this.listadoPeliculas, @required this.nextPage});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 350) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: _pageController,
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return listadoPeliculas.map((peli) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: FadeInImage(
                image: NetworkImage(peli.getPosterImg()),
                placeholder: AssetImage('assets/img/loading-spinner.gif'),
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
            Text(
              peli.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
