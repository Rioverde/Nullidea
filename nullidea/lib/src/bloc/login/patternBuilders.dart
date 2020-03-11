import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/fields.dart';

import 'package:nullidea/src/bloc/login/textButton.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';

import 'mainButton.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/ui/signUp.dart';

//Returns Nullidea with pacifico fonts
final formPasswordKey = new GlobalKey<FormState>();
final formEmailKey = new GlobalKey<FormState>();
final formPasswordKeySignUp = new GlobalKey<FormState>();
final formEmailKeySignUp = new GlobalKey<FormState>();

final form = formPasswordKey.currentState;
final form2 = formEmailKey.currentState;
final form3 = formPasswordKeySignUp.currentState;
final form4 = formEmailKeySignUp.currentState;

Text primaryText(double fontSizeCustom, dynamic colorCustom) {
  return Text('Nullidea',
      style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: fontSizeCustom,
          color: colorCustom));
}

Padding accessIcons(dynamic iconCustom, dynamic func()) {
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 16),
    child: IconButton(
      icon: Icon(iconCustom, size: 32),
      splashColor: Colors.transparent,
      onPressed: () {},
    ),
  );
}

TextButton buildForgetPassword() {
  return TextButton(
      alignment: Alignment.centerRight,
      fontSize: 14,
      yellowText: "Forgot password ?");
}

CustomField emailField() {
  return CustomField(
      key: formEmailKey,
      prefixIcon: Icon(Icons.person),
      fieldRadius: 8,
      hinttext: 'Email',
      maxLines: 1);
}

PasswordField passwordField() {
  return PasswordField(
    key: formPasswordKey,
    hinttext: 'Password',
    prefixIcon: Icon(Icons.lock),
  );
}

Row buildRowofLoginIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      accessIcons(MdiIcons.facebook, futureFunc()),
      accessIcons(MdiIcons.google, futureFunc()),
      accessIcons(MdiIcons.githubCircle, futureFunc()),
    ],
  );
}

futureFunc() {}

Container customButton() {
  return Container(
    child: CustomButton(
      action: validateAndSave,
      color: primaryColor,
      borderRadius: 8,
      functionality: 'SIGN IN',
      fontSize: 18,
      height: 50,
      width: double.infinity,
    ),
  );
}

validateAndSave() {
  if (form.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }

  if (form2.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }
}

CustomField signUpEmailField() {
  return CustomField(
      key: formEmailKeySignUp,
      prefixIcon: Icon(Icons.person),
      fieldRadius: 8,
      hinttext: 'Email',
      maxLines: 1);
}

PasswordField signUpPasswordField() {
  return PasswordField(
    key: formPasswordKeySignUp,
    hinttext: 'Password',
    prefixIcon: Icon(Icons.lock),
  );
}

TextButton buildTextButton(BuildContext context) {
  return TextButton(
    pressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SignUp();
      }));
    },
    alignment: Alignment.center,
    fontSize: 14,
    contentText: "Don`t have an account ? ",
    yellowText: ' SIGN UP',
  );
}
