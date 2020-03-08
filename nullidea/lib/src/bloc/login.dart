import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/constants/materialsData.dart';

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
      ),
      labelStyle: TextStyle(
        color: primaryColor,
      ),
    ),
  );
}

bool passwordVisible = true;

@override
void initState() {
  passwordVisible = false;
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                primaryText(60.0, primaryColor),
                fieldEmail(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: passwordVisible,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: hidecolor,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            passwordVisible = !passwordVisible;
                            if (!passwordVisible) hidecolor = Colors.grey; 
                            else hidecolor = primaryColor;
                          });
                        },
                      ),

                      prefixIcon: Icon(Icons.lock, color: primaryColor),

                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      // labelText: 'Password',
                      // labelStyle: TextStyle(color: PrimaryColor),
                      hintText: "Password",
                    ),
                  ),
                ),
                forgotPassword(),
                customButton('SIGN IN'),
                alreadyExist(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    accessIcons(MdiIcons.facebook),
                    accessIcons(MdiIcons.google),
                    accessIcons(MdiIcons.githubCircle),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
 