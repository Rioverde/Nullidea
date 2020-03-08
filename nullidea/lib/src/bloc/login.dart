import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/constants/materialsData.dart';
import 'package:nullidea/src/bloc/login/passwordField.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
      ),
      labelStyle: TextStyle(
        color: primaryColor,
      ),
    ),
  );
}


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      theme: buildTheme(),
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                primaryText(60.0, primaryColor),
                fieldEmail(),
                PasswordField(),
                forgotPassword(),
                customButton('SIGN IN'),
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

