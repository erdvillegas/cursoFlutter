import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 20.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
          _crearTexto(),
        ],
      ),
    ));
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            'https://media-exp1.licdn.com/dms/image/C561BAQGEbvT3SFyR9Q/company-background_10000/0/1582050035728?e=2159024400&v=beta&t=xwPLRsVBBNXQQS3HN3q7hsYXmt6JxJsH6lpnbh9Y1ko'),
        height: 180.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lago con un puente',
                    style: estiloTitulo,
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Un lago en México',
                    style: estiloSubTitulo,
                  )
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
            Text('41', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _crearAccion(Icons.call, 'CALL'),
          _crearAccion(Icons.near_me, 'ROUTE'),
          _crearAccion(Icons.share, 'SHARE')
        ]);
  }

  Widget _crearAccion(IconData icon, String texto) {
    return Column(children: <Widget>[
      Icon(icon, color: Colors.blue, size: 40.0),
      SizedBox(height: 5.0),
      Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue))
    ]);
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fermentum condimentum tincidunt. Vivamus in arcu sem. Fusce a tempus dui. Mauris convallis dignissim nisl ac vulputate. Vivamus elementum rhoncus auctor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut id massa eros. Vivamus tincidunt posuere dapibus. Quisque sed enim quis orci iaculis fermentum non eu mauris. Ut enim nisi, molestie vitae fringilla tempor, fringilla id arcu. Quisque sollicitudin vestibulum nunc. Nunc vel vulputate orci. Donec mattis eget metus quis aliquet. Phasellus aliquet nisi dui, sed tristique purus malesuada id. Aenean elementum turpis leo, id semper est cursus eget. Praesent feugiat ligula vel arcu mollis, id varius enim accumsan.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
