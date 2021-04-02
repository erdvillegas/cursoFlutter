import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
  
}

//Estado que va a manejarse
class _ContadorPageState extends State<ContadorPage>{

  //Se agrega como final ya que no cambiara
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('Numero de Taps:',style: _estiloTexto),
             Text('$_conteo',style: _estiloTexto),
          ],
        )
        ),
        floatingActionButton: _crearBotones(),
    );
}

Widget _crearBotones(){

  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
    SizedBox(width: 30.0,),
    FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: _reset,),
    Expanded(child: SizedBox()),
    FloatingActionButton( child: Icon(Icons.remove), onPressed: _sustraer),
    SizedBox(width: 5.0),
    FloatingActionButton( child: Icon(Icons.add), onPressed: _agregar),
    SizedBox(width: 5.0),
  ],
  );
}

void _agregar(){
  setState(()=> _conteo++);
}

void _sustraer(){
  setState(()=> _conteo--);
}

void _reset(){
  setState(()=>_conteo = 0);
}

}