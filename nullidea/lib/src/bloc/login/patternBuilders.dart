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
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: ButtonTheme(
      height: 50,
      minWidth: double.infinity,
      child: FlatButton(
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0)),
        color: primaryColor,
        textColor: Colors.black,
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

Container forgotPassword() {
  return Container(
    alignment: Alignment.topRight,
    child: FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {
        print("Forgot Password Screen");
      },
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
      onPressed: () {
        print('SIGN UP screen');
      },
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

//passwordtype pattern
bool passwordVisible = true;
TextEditingController passwordController = new TextEditingController();

@override
void initState() {
  passwordVisible = false;
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextFormField(
        controller: passwordController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
                if (!passwordVisible)
                  hidecolor = Colors.grey;
                else
                  hidecolor = primaryColor;
              });
            },
          ),
          prefixIcon: Icon(Icons.lock),
          // labelText: 'Password',
          // labelStyle: TextStyle(color: PrimaryColor),
          hintText: "Password",
        ),
      ),
    );
  }
}
