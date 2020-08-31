import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              _posterTitulo(context, movie),
              Divider(
                height: 10.0,
              ),
              _descripcion(context, movie),
              _descripcion(context, movie),
              _descripcion(context, movie),
              _descripcion(context, movie),
              _descripcion(context, movie),
              _descripcion(context, movie),
            ]),
          )
        ],
      ),
    );
  }

  Widget _crearAppBar(Movie movie) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(movie.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading-infinite.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 3.0,
            child: Image(
              image: NetworkImage(movie.getPosterImg()),
              height: 150.0,
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.confirmation_number),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(movie.releaseDate.toString())
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(movie.voteAverage.toString())
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
