import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/constants/materialsData.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: nullideatheme(),
      home: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomPadding: false,
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
                    accessIcons(MdiIcons.facebook,futureFunc()),
                    accessIcons(MdiIcons.google, futureFunc()),
                    accessIcons(MdiIcons.githubCircle,futureFunc() ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

futureFunc(){}
