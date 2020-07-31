import 'package:flutter/material.dart';

import 'package:nullidea/screens/Login/login.dart';
import 'package:nullidea/screens/Account/accountRouter.dart';
import 'package:nullidea/screens/Initial/splash.dart';

import 'package:nullidea/screens/Initial/theme.dart';

void main() {
  runApp(Nullidea());
}

class Nullidea extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/SplashScreen',
      theme: nullideatheme(),
      routes: {
        '/SplashScreen': (context) => SplashScreen(),
        // When navigating to the "/" route, build the FirstScreen widget.
        '/Login': (context) => Login(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Router': (context) => AccountRouter(),
      },
    );
  }
}
