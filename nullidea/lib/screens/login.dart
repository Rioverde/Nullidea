import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/handleRequests.dart';

import '../constants.dart';
import '../mechanics.dart';
import '../theme.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

bool success = true;
bool passwordVisible = true;

class LoginState extends State<Login> {
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      setState(() {
        success = false;
        toWait();
      });

      postUser(email, password);

      setState(() {
        success = true;
      });
    } else {}
  }

  void toLogin() => setState(() {
        formtype = FormType.login;
      });

  Future<void> toWait() async => setState(() {
        Future.delayed(const Duration(seconds: 3), () {

          setState(() {
            formtype = FormType.register;

          });
        });
        formtype = FormType.waiting;
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
      //use setState to rebuild the widget
      setState(() {});
    });

    passwordController.addListener(() {
      //use setState to rebuild the widget
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: toggleInputs() + toggleButtons(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> toggleInputs() {
    if (formtype == FormType.login) {
      return [
        nullideaText(),
        loginEmailField(),
        loginPasswordField(),
      ];
    } else {
      return [
        nullideaText(),
        registerEmailField(),
        registerPasswordField(),
      ];
    }
  }

  List<Widget> toggleButtons() {
    if (formtype == FormType.login) {
      return [
        forgotPassword(),
        signInButton(),
        dontHaveAccount(),
      ];
    } else
      return [
        loadingbutton(success ? FormType.register : FormType.waiting),
        alreadyHaveAccount(),
      ];
  }

  dynamic loadingbutton(FormType waiting) {
    if (formtype == waiting) {
      return ButtonTheme(
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
                  ? validateAndSubmit
                  : null),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          height: 55,
          child: SpinKitWanderingCubes(
            duration: Duration(seconds: 2),
            color: primaryColor,
            size: 50.0,
          ),
        ),
      );
    }
  }

  Center nullideaText() {
    return Center(
      child: Container(
        child: Text("Nullidea",
            style: GoogleFonts.pacifico(
                fontSize: 70.0,
                fontWeight: FontWeight.normal,
                color: primaryColor)),
      ),
    );
  }

  Padding alreadyHaveAccount() {
    return Padding(
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
              TextSpan(text: " SIGN IN", style: TextStyle(color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }

  Padding registerEmailField() {
    return Padding(
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
    );
  }

  Padding loginEmailField() {
    return Padding(
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
    );
  }

  Padding dontHaveAccount() {
    return Padding(
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
              TextSpan(text: " SIGN UP", style: TextStyle(color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }

  ButtonTheme signInButton() {
    return ButtonTheme(
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
    );
  }

  Container forgotPassword() {
    return Container(
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
        ));
  }

  Padding loginPasswordField() {
    return Padding(
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
    );
  }

  Padding registerPasswordField() {
    return Padding(
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
    );
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
