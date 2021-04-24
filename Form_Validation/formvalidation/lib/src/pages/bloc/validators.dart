import 'dart:async';

class Validators {
  final validarPassowrd = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Password must ve 6 or more characters');
      }
    },
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExt = new RegExp(pattern);
      if (regExt.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email has no correct format');
      }
    },
  );
}
