import 'package:flutter/material.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = false;
  int _genero = 1;
  String _nomnre = 'Erik';

  TextEditingController _textController;

  @override
  void initState() {
    cargarPref();
    super.initState();
    _textController = new TextEditingController(text: _nomnre);
  }

  cargarPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genero = prefs.getInt('genero');
    setState(() {});
  }

  _setSelectedRadio(int valor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('genero', valor);
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ajustes')),
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
                  onChanged: (valor) {})),
        ]));
  }
}
