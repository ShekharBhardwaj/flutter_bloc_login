import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../mixins/loginValidatorMixin.dart';

class Bloc extends Object with Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //get data from steam
  Stream<String> get emailStream => _email.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Add data to stream
  Function(String) get changeEmailSink => _email.sink.add;
  Function(String) get changePasswordSink => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
