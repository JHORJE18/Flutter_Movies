import 'package:flutter/material.dart';
import 'package:movies/src/provider/movies_provider.dart';
import 'package:movies/src/search/search_delegate.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';
import 'package:movies/src/widgets/movies_horizontal.dart';

class HomePage extends StatelessWidget {
  final MovieProvider moviesProvider = new MovieProvider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text('Películas en cines 🎬')],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Container(
        color: Color(0xFF070E34),
        child: SafeArea(
          child: Container(
            color: Color(0xFF08113F),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_swipeMovies(), _footer(context)],
            ),
          ),
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

  Widget _footer(BuildContext context) {
    return Container(
      color: Color(0xFF070E34),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              'Películas populares 🎖',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          StreamBuilder(
            stream: moviesProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MoviesHorizontalWidget(
                    listadoPeliculas: snapshot.data,
                    nextPage: moviesProvider.getPopulares);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
      width: double.infinity,
    );
  }
}
