import 'dart:async';

import 'package:formvalidation/src/pages/bloc/validators.dart';

class LoginBloc with Validators {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassowrd);

  //Insertar valores al stream controller
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
