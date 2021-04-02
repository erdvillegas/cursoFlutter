import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  //Se agrega como final ya que no cambiara
  final estiloTexto = new TextStyle(fontSize: 25);
  final conteo = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('Numero de Taps:',style: estiloTexto),
             Text('$conteo',style: estiloTexto),
          ],
        )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){print('10');},
        ),
    );
  }
}