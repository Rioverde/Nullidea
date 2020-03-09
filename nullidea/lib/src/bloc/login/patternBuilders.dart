import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/fields.dart';
import 'package:nullidea/src/bloc/login/textButton.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';
import 'buttomCustomized.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//Returns Nullidea with pacifico fonts
Text primaryText(double fontSizeCustom, dynamic colorCustom) {
  return Text(
    'Nullidea',
    style: TextStyle(
        fontFamily: 'Pacifico', fontSize: fontSizeCustom, color: colorCustom),
  );
}

Padding accessIcons(dynamic iconCustom, dynamic func()) {
  return Padding(
    padding: EdgeInsets.only(top: 0, left: 16),
    child: IconButton(
      icon: Icon(iconCustom, size: 32),
      splashColor: Colors.transparent,
      color: primaryColor,
      onPressed: () {},
    ),
  );
}

TextButton buildForgetPassword() {
  return TextButton(
      alignment: Alignment.centerRight,
      fontSize: 12,
      yellowText: "Forget password ?");
}

CustomField emailField() {
  return CustomField(
      prefixIcon: Icon(Icons.person), fieldRadius: 8, hinttext: 'Email');
}

CustomButton signInButton() {
  return CustomButton(
    borderRadius: 8,
    color: primaryColor,
    functionality: 'SIGN IN',
    fontSize: 16,
    height: 50,
    width: double.infinity,
  );
}

TextButton buildSignUp() {
  return TextButton(
    alignment: Alignment.center,
    fontSize: 12,
    contentText: "Don`t have an account ? ",
    yellowText: ' SIGN UP',
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
