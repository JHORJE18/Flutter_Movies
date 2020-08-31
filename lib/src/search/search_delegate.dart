import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = '';

  final peliculas = [
    'Spiderman',
    'Regreso al futuro',
    'Doctor Who',
    'Cars',
    'Cars 2',
    'Cars 3'
  ];
  final peliculasRecientes = ['Spiderman', 'Capitan america'];

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
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda en Appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultado a mostrar
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.amberAccent,
        child: Center(child: Text(seleccion)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Surgerencias que aparecen cuando la persona escribe

    final listaSurgerencia = (query.isEmpty)
        ? peliculasRecientes
        : peliculas
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    if (listaSurgerencia.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mood_bad),
            SizedBox(
              height: 10,
            ),
            Text('Sin resultados'),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: listaSurgerencia.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.movie_filter),
          title: Text(listaSurgerencia[index]),
          onTap: () {
            seleccion = listaSurgerencia[index];
            showResults(context);
          },
        );
      },
    );
  }
}
