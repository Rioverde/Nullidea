import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/constants/materialsData.dart';

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

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                primaryText(60.0, PrimaryColor),
                fieldEmail(),
                fieldPassword(),
                forgotPassword(),
                signinButton('SIGN IN'),
                alreadyExist(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    accessIcons(MdiIcons.facebook),
                    accessIcons(MdiIcons.google),
                    accessIcons(MdiIcons.githubCircle),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
