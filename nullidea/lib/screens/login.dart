import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../theme.dart';

bool passwordVisible = true;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool validateAndSave() {
  final form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  } else
    return false;
}

void validateAndSubmit() {
  if (validateAndSave()) {
  } else {}
}

class _LoginState extends State<Login> {
  void toLogin() => setState(() {
        formtype = FormType.login;
      });

  void toRegister() => setState(() {
        formtype = FormType.register;
      });

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailController.addListener(() {
      //here you have the changes of your textfield
      print("value: ${emailController.text}");
      //use setState to rebuild the widget
      setState(() {});
    });

    passwordController.addListener(() {
      //here you have the changes of your textfield
      print("value: ${passwordController.text}");
      //use setState to rebuild the widget
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: nullideatext() + toggleInputs() + toggleButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> nullideatext() {
    return [
      Center(
        child: Container(
          child: Text("Nullidea",
              style: GoogleFonts.pacifico(
                  fontSize: 70.0,
                  fontWeight: FontWeight.normal,
                  color: primaryColor)),
        ),
      )
    ];
  }

  List<Widget> toggleInputs() {
    if (formtype == FormType.login) {
      return [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextFormField(
            onSaved: (value) => email = value,
            controller: emailController,
            validator: (value) => validateEmailCases(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Email",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextFormField(
            obscureText: passwordVisible,
            controller: passwordController,
            onSaved: (value) => password = value,
            validator: (value) => validatePasswordCases(value),
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: buildmeIcon(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextFormField(
            onSaved: (value) => email = value,
            controller: emailController,
            validator: (value) => validateEmailCases(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Email",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextFormField(
            obscureText: passwordVisible,
            controller: passwordController,
            onSaved: (value) => password = value,
            validator: (value) => validatePasswordCases(value),
            decoration: InputDecoration(
              suffixIcon: buildmeIcon(),
              prefixIcon: Icon(Icons.lock),
              hintText: "Password",
            ),
          ),
        ),
      ];
    }
  }

  List<Widget> toggleButtons() {
    if (formtype == FormType.login) {
      return [
        Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: null,
                child: Text("Forgot Password ?",
                    style: GoogleFonts.ubuntu(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            )),
        ButtonTheme(
          disabledColor: disabledState,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: RaisedButton(
                color: primaryColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)),
                child: Text(
                  "SIGN IN",
                  style: GoogleFonts.ubuntu(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? Colors.black
                          : Colors.black),
                ),
                onPressed: emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty
                    ? validateAndSave
                    : null),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: toRegister,
            child: RichText(
              text: TextSpan(
                text: "Don't have an account ? ",
                style: GoogleFonts.ubuntu(
                    color: Colors.grey.shade700,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                      text: " SIGN UP", style: TextStyle(color: primaryColor)),
                ],
              ),
            ),
          ),
        ),
      ];
    } else
      return [
        ButtonTheme(
          disabledColor: disabledState,
          height: 55,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: RaisedButton(
                color: primaryColor,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10)),
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.ubuntu(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                          ? Colors.black
                          : Colors.black),
                ),
                onPressed: emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty
                    ? validateAndSave
                    : null),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: toLogin,
            child: RichText(
              text: TextSpan(
                text: "Already have an account ? ",
                style: GoogleFonts.ubuntu(
                    color: Colors.grey.shade700,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                      text: " SIGN IN", style: TextStyle(color: primaryColor)),
                ],
              ),
            ),
          ),
        ),
      ];
  }

  IconButton buildmeIcon() {
    return IconButton(
      icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        if (!mounted) return;
        setState(() {
          passwordVisible = !passwordVisible;
          !passwordVisible
              ? iconPrimaryColor = Colors.grey
              : iconPrimaryColor = primaryColor;
        });
      },
    );
  }
}

String validatePasswordCases(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Password field should not be empty";
  } else if (value.length < 8) {
    return "Password should have at least 8 characters";
  } else if (value.contains(" ")) {
    return "Password should not have spaces";
  } else if (!regex.hasMatch(value)) {
    return "Invalid password, try eg: Test123*!";
  } else
    return null;
}

String validateEmailCases(String value) {
  Pattern pattern = r'(?=.*?[@])';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) {
    return "Email field should not be empty";
  } else if (!regex.hasMatch(value)) {
    return "Email should have '@' character";
  } else if (value.contains(" ")) {
    return "Email should not have spaces";
  } else
    return null;
}


String authUserEmail(String value) {
  Pattern pattern =
      r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
  if (value == pattern) {
    return null;
  } else {
    return "Email does not exists";
  }
}

String authUserPassword(String value) {
  if (value == password) {
    return null;
  } else {
    return "Password is incorrect";
  }
}