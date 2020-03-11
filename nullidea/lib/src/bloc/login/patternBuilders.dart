import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/buttonCustomized.dart';
import 'package:nullidea/src/bloc/login/fields.dart';

import 'package:nullidea/src/bloc/login/textButton.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';
import 'buttonCustomized.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//Returns Nullidea with pacifico fonts
final formPasswordKey = new GlobalKey<FormState>();
final formEmailKey = new GlobalKey<FormState>();




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
      prefixIcon: Icon(Icons.person),
      fieldRadius: 8,
      hinttext: 'Email',
      maxLines: 1);
}

TextButton buildSignUp() {
  return TextButton(
    alignment: Alignment.center,
    fontSize: 14,
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
    final form = formPasswordKey.currentState;
    final form2 = formEmailKey.currentState;
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


