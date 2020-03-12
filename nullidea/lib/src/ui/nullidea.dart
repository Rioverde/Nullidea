

import 'package:flutter/material.dart';
import 'package:nullidea/src/ui/login.dart';
import 'package:nullidea/src/ui/signUp.dart';

class Nullidea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Login(),
      initialRoute: '/',
      routes: {
        '/login': (context) => Login(),
        '/signUp': (context) => SignUp(),
      },
    );
  }
}
