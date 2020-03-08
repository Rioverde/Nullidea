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
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: primaryColor),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // labelText: 'Email',
        // labelStyle: TextStyle(color: PrimaryColor),
        hintText: "Email",
      ),
    ),
  );
}

//Returns password field


//returns button with string that we need
Padding customButton(var functionality) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16,),
    child: ButtonTheme(
      minWidth: double.infinity,
      height: 50,
      child: FlatButton(
        padding: const EdgeInsets.only(left: 16, right: 16,),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
        color: primaryColor,
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
    padding: EdgeInsets.only(top: 0,left: 16),
    child: IconButton(
      icon: Icon(iconCustom, size: 32),
      splashColor: Colors.transparent,
      color: primaryColor,
      onPressed: () {},
    ),
  );
}

Container forgotPassword() {
  return Container(
    alignment: Alignment.topRight,
    child: FlatButton(
      onPressed: () {print("Forgot Password Screen");},
      child: Text(
        "Forgot password ?",
        style: TextStyle(
          fontSize: 12.0,
          color: primaryColor,
        ),
      ),
    ),
  );
}

Padding alreadyExist() {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: FlatButton(
      onPressed: () {print('SIGN UP screen');},
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          children: <TextSpan>[
            TextSpan(text: ' SIGN UP', style: TextStyle(color: primaryColor)),
          ],
        ),
      ),
    ),
  );
}
