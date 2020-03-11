import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/mainButton.dart';
import 'package:nullidea/src/bloc/login/textButton.dart';

import 'package:nullidea/src/constants/nullideaTheme.dart';

import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/ui/login.dart';

class SignUp extends StatelessWidget {
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
                signUpEmailField(),
                signUpPasswordField(),
                SizedBox(height: 16),

                //TODO add nice functions to return object, work on key variables, try to change TextButton on Login, add padding and etc

                buildCustomButtonSignUp(),
                buildTextButtonSignIn(context),
                buildRowofLoginIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomButton buildCustomButtonSignUp() {
    return CustomButton(
      action: validateAndSave,
      color: primaryColor,
      borderRadius: 8,
      functionality: 'SIGN UP',
      fontSize: 18,
      height: 50,
      width: double.infinity,
    );
  }

  TextButton buildTextButtonSignIn(BuildContext context) {
    return TextButton(
      alignment: Alignment.center,
      fontSize: 14,
      contentText: "Already have an account ? ",
      yellowText: " SIGN IN",
      pressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Login();
        }));
      },
    );
  }
}

validateAndSave() {
  if (form3.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }

  if (form4.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }
}
