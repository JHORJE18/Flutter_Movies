import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/provider/movies_provider.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';
  final MovieProvider movieProvider = new MovieProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: theme.primaryTextTheme.title.color)),
      primaryColor: theme.primaryColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda en Appbar
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultado a mostrar
    return _surgerencias();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Surgerencias que aparecen cuando la persona escribe
    if (query.isEmpty) {
      return _surgerencias();
    }

    return FutureBuilder(
      future: movieProvider.searchMovies(query),
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;

          if (peliculas.length == 0) {
            return _notFound();
          }

          return ListView(
            children: peliculas.map((peli) {
              peli.uiHero = '${peli.id}-Seach';

              return ListTile(
                leading: Hero(
                  tag: peli.uiHero,
                  child: FadeInImage(
                    image: NetworkImage(peli.getPosterImg()),
                    placeholder: AssetImage('assets/img/loading-spinner.gif'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text(peli.title),
                subtitle: Text(peli.originalTitle),
                onTap: () {
                  Navigator.pushNamed(context, '/detalle', arguments: peli);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _surgerencias() {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Icon(Icons.movie_filter),
          SizedBox(
            height: 10.0,
          ),
          Text('Busca alguna película interesante'),
          Spacer(),
        ],
      ),
    );
  }

  Widget _notFound() {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Icon(Icons.tag_faces),
          SizedBox(
            height: 10.0,
          ),
          Text('No se ha encontrado ninguna película con el título'),
          Text(
            '$query',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
