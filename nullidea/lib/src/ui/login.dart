import 'package:flutter/material.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';
import 'package:nullidea/src/bloc/patternBuilders.dart';

class Login extends StatelessWidget {
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
                //email Field
                emailFieldLogin(),
                //Password field which is stateful widget
                passwordFieldLogin(),
                //Forgot password button
                buildForgetPassword(),
                //Sign in Button
                customButton(),
                //are you already exist button. Sign Up with giving some padding using SizeBox
                buildTextButton(context),
                //Enter via google, facebook or git
                buildRowofLoginIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
