import 'package:flutter/material.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: PrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
      ),
      labelStyle: TextStyle(
        color: PrimaryColor,
      ),
    ),
  );
}

void main() {
  runApp(Nullidea());
}

const PrimaryColor = const Color.fromRGBO(255, 203, 50, 1);

class Nullidea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
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
                  padding: const EdgeInsets.all(16.0),
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
                  padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                      color: PrimaryColor,
                    ),
                  ),
                ),
                FlatButton(
                  color: PrimaryColor,
                  textColor: Colors.black,
                  disabledColor: Colors.grey, 
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(16.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Flat Button",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
