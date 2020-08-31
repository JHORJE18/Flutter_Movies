import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _imageUrl = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF08113F),
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(_imageUrl),
          placeholder: AssetImage('assets/img/loading-infinite.gif'),
        ),
      ),
    );
  }
}
