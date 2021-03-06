import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_mode.dart';
import 'package:movies/src/pages/actor_detail_page.dart';
import 'package:movies/src/pages/home_page.dart';
import 'package:movies/src/pages/image_page.dart';
import 'package:movies/src/pages/movie_detail_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    '/detalle': (BuildContext context) => MovieDetailPage(),
    '/image': (BuildContext context) => ImagePage(),
    '/actor': (BuildContext context) => ActorDetailPage(),
  };
}
