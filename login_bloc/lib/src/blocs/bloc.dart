import 'dart:async';

import '../mixins/loginValidatorMixin.dart';

class Bloc extends Object with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  //get data from steam
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _email.stream.transform(validatePassword);

  //Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _email.sink.add;

  dispose() {
    _email.close();
    _password.close();
  }
}
