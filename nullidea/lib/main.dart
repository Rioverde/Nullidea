import 'package:flutter/material.dart';
import 'package:nullidea/screens/login.dart';
import 'package:nullidea/screens/accountRouter.dart';

import 'package:nullidea/theme.dart';

void main() {
  runApp(Nullidea());
}

class Nullidea extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/Login',

      theme: nullideatheme(),

      routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/Login': (context) => Login(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/Router': (context) => AccountRouter(),
  },
    );
  }
}

