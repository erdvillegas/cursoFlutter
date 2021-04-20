import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(title: Text('Preferencias de usuario')),
      drawer: MenuWidget(),
      backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre de usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
