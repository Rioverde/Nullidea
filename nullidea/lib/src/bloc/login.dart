import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';

import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/bloc/login/passwordField.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: nullideatheme(),
      home: Scaffold(
        //Resize the scaffold if keyboard appears
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Create Nice view of Nullidea
                primaryText(60.0, primaryColor),
                //email Field
                emailField(),
                //PAssword field which is stateful widget
                PasswordField(),
                //Forgot password button
                buildForgetPassword(),
                //Sign in Button
                signInButton(),
                //are you already exist button. Sign Up with giving some padding using SizeBox
                SizedBox(height: 4),
                buildSignUp(),
                //Enter via google, facebook or git
                buildRowofLoginIcons(),
              ]),
        ),
      ),
    );
  }




}
