import 'package:flutter/material.dart';
import 'package:nullidea/screens/login.dart';
import 'package:nullidea/theme.dart';

void main() {
  runApp(Nullidea());
}

class Nullidea extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: nullideatheme(),
      home: Login(),
    );
  }
}

