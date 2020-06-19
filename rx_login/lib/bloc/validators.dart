import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
        if (username.contains("@")) {
          sink.add(username);
        } else {
          sink.addError("Isilah username dengan email Anda");
        }
      });

  final validateNim = StreamTransformer<String, String>.fromHandlers(
      handleData: (nim, sink) {
        if (nim.length == 10) {
          sink.add(nim);
        } else {
          sink.addError("Isilah dengan 10 digit angka");
        }
      });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length > 6) {
          sink.add(password);
        } else {
          sink.addError("Minimal password 6 karakter");
        }
      });
}

