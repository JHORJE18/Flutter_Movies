import 'package:flutter/material.dart';
import 'package:movies/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Películas 🎬',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      theme: ThemeData(
        //    primarySwatch: primaryColor,
        brightness: Brightness.dark,
        cardTheme: CardTheme(
          color: Color(0xFF08113F),
        ),
        appBarTheme: AppBarTheme(elevation: 0.0),
        primaryColor: Color(0xFF070E34),
        accentColor: Color(0xFFFFFF00),
        backgroundColor: Color(0xFF08113F),
        scaffoldBackgroundColor: Color(0xFF08113F),
        buttonColor: Color(0xFF00C569),
        // scaffoldBackgroundColor: backgroundColor,
        cardColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
