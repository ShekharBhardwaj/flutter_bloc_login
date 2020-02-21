import 'package:flutter/material.dart';

import '../src/screens/loginScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
