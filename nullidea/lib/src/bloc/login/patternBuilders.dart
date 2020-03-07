import 'package:flutter/material.dart';
import 'package:nullidea/src/constants/materialsData.dart';

//Returns Nullidea with pacifico fonts
Text primaryText(double fontSizeCustom, dynamic colorCustom) {
  return Text(
    'Nullidea',
    style: TextStyle(
        fontFamily: 'Pacifico', fontSize: fontSizeCustom, color: colorCustom),
  );
}

//Returns field of emaill
Padding fieldEmail() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: TextFormField(
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white),
      cursorColor: PrimaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: PrimaryColor),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: PrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // labelText: 'Email',
        // labelStyle: TextStyle(color: PrimaryColor),
        hintText: "Email",
      ),
    ),
  );
}

//Returns password field
Padding fieldPassword() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
    child: TextFormField(
      obscureText: true,
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.white),
      cursorColor: PrimaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: PrimaryColor),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: PrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // labelText: 'Password',
        // labelStyle: TextStyle(color: PrimaryColor),
        hintText: "Password",
      ),
    ),
  );
}

//returns button with string that we need
Padding signinButton(var functionality) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: ButtonTheme(
      minWidth: 330.0,
      height: 50,
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
        color: PrimaryColor,
        textColor: Colors.black,
        disabledColor: Colors.yellow.shade700,
        disabledTextColor: Colors.black,
        splashColor: Colors.yellow.shade700,
        onPressed: () {
          /*...*/
          print('Will go to Register soon');
        },
        child: Text(
          functionality,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Padding accessIcons(dynamic iconCustom) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: IconButton(
      icon: Icon(iconCustom, size: 32),
      splashColor: Colors.transparent,
      color: PrimaryColor,
      onPressed: () {},
    ),
  );
}

Container forgotPassword() {
  return Container(
    alignment: Alignment.topRight,
    child: FlatButton(
      onPressed: () {},
      child: Text(
        "Forgot password ?",
        style: TextStyle(
          fontSize: 12.0,
          color: PrimaryColor,
        ),
      ),
    ),
  );
}

Padding alreadyExist() {
  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
        children: <TextSpan>[
          TextSpan(text: ' SIGN UP', style: TextStyle(color: PrimaryColor)),
        ],
      ),
    ),
  );
}
