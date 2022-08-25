import 'package:flutter/material.dart';
import 'package:peliculas_v2/widgets/widgest.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          CardSwiper(),
          MovieSlider(),
        ])));
  }
}
