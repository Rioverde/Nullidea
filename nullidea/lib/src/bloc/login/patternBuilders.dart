import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/fields.dart';

import 'package:nullidea/src/bloc/login/textButton.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';
import 'mainButton.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/ui/signUp.dart';

final formKeyEmail = new GlobalKey<FormState>();
final formKeyPassword = new GlobalKey<FormState>();
final formEmail = formKeyEmail.currentState;
final formPassword = formKeyPassword.currentState;

validateAndSave() {
  if (formEmail.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }

  if (formPassword.validate()) {
    print("Is valide");
  } else {
    print("Not valid");
  }

  if (formEmail.validate() && formPassword.validate()) {
    print(passwordController.text);
    print(emailController.text);
    print("SUCCESS");
  }
}

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

TextEditingController emailController = new TextEditingController();

Form emailField() {
  return Form(
    key: formKeyEmail,
    child: CustomField(
      validate: (value) => validateEmailCases(value),
      editingController: emailController,
      enableSuffix: false,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      prefixIcon: Icon(Icons.person),
      fieldRadius: 8,
      hinttext: 'Email',
    ),
  );
}

TextEditingController passwordController = new TextEditingController();

Form newPasswordField() {
  return Form(
    key: formKeyPassword,
    child: CustomField(
      fieldRadius: 8,
      editingController: passwordController,
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      validate: (value) => validateCases(value),
      hinttext: 'Password',
      prefixIcon: Icon(Icons.lock),
      enableSuffix: true,
    ),
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

TextButton buildTextButtonSignIn(BuildContext context) {
  return TextButton(
    alignment: Alignment.center,
    fontSize: 14,
    contentText: "Already have an account ? ",
    yellowText: " SIGN IN",
    pressed: () {
      Navigator.of(context).pop();
    },
  );
}
