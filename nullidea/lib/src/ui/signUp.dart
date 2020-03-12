import 'package:flutter/material.dart';

import 'package:nullidea/src/constants/nullideaTheme.dart';

import 'package:nullidea/src/bloc/patternBuilders.dart';

class SignUp extends StatefulWidget {


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  void setState(fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: nullideatheme(),
      home: Scaffold(
        //Resize the scaffold if keyboard appears
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Create Nice view of Nullidea
                primaryText(60.0, primaryColor),
                emailFieldRegister(),
                passwordFieldRegister(),
                customButtonRegister(),
                buildTextButtonRegister(context),
                buildRowofLoginIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
