import 'package:flutter/material.dart';
import 'package:contador/src/Paginas/contador_page.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build( context ){
    return MaterialApp(
      home: Center(
        child: ContadorPage()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}