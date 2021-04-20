import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombreUsuario;

    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int valor) async {
    setState(() {
      prefs.genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ajustes')),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        drawer: MenuWidget(),
        body: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                this._colorSecundario = value;
                prefs.colorSecundario = value;
                setState(() {});
              }),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            onChanged: _setSelectedRadio,
            groupValue: _genero,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            onChanged: _setSelectedRadio,
            groupValue: _genero,
          ),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre del propietario'),
                  onChanged: (valor) {
                    prefs.nombreUsuario = valor;
                  })),
        ]));
  }
}
