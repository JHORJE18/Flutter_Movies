import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_mode.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/provider/movies_provider.dart';

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
              Divider(),
              _crearCasting(context, movie),
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

  Widget _crearCasting(BuildContext context, Movie movie) {
    final MovieProvider movieProvider = new MovieProvider();

    return FutureBuilder(
      future: movieProvider.getCast(movie.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _crearActoresPageView(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> cast) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        itemCount: cast.length,
        itemBuilder: (context, index) {
          return _crearCardActor(cast[index]);
        },
      ),
    );
  }

  Widget _crearCardActor(Actor actor) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FadeInImage(
              image: NetworkImage(actor.getPicture()),
              placeholder: AssetImage('assets/img/loading-spinner.gif'),
              fit: BoxFit.cover,
              height: 150.0,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
