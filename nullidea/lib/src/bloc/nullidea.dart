import 'package:flutter/material.dart';
import 'login.dart';


ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: PrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
      ),
      labelStyle: TextStyle(
        color: PrimaryColor,
      ),
    ),
  );
}


class Nullidea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: buildTheme(),
        home: Scaffold(
          body: Login(),
        ),
      );
  }
}