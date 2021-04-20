import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instance =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instance;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }
}
