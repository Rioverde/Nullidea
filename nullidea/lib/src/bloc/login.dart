import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const PrimaryColor = const Color.fromRGBO(255, 203, 50, 1);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nullidea',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 60.0,
                      color: PrimaryColor),
                ),
                Padding(
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
                ),
                Padding(
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
                ),
                Container(
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
                ),
                Padding(
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
                        "LOG IN",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' SIGN UP',
                            style: TextStyle(color: PrimaryColor)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(MdiIcons.facebook, size: 32),
                          splashColor: Colors.transparent,
                          color: PrimaryColor,
                          onPressed: () {},
                        ),
                        SizedBox(width: 16),
                        IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(MdiIcons.google, size: 32),
                          color: PrimaryColor,
                          onPressed: () {},
                        ),
                        SizedBox(width: 16),
                        IconButton(
                          splashColor: Colors.transparent,
                          icon: Icon(MdiIcons.githubCircle, size: 32),
                          color: PrimaryColor,
                          onPressed: () {},
                        ),
                      ]),
                ),
              ]),
        ),
      ),
    );
  }
}
