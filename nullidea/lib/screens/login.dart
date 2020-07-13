import 'dart:async';
import 'package:nullidea/screens/profile.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quiver/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/handleRequests.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants.dart';
import '../mechanics.dart';
import '../theme.dart';
import '../user.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //===================================Fuctions==================================//
  void postResend() {
    postUser(User.email);
    startTimer();
  }

  Future<void> validateAndSignIn() async {
    setState(() {
      formtype = FormType.waiting;
    });
    if (validateAndSave()) {
      String preload = (User.username);
      print(preload);
      await getSignIn(User.email, password, fcmToken);
      setState(() => _scaffoldKey.currentState.showSnackBar(snackBar(
          responceState ? "Logging In" : 'Incorrect email or password')));
      formtype = FormType.login;
    }
    if (responceState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
  }

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
      await postUser(User.email);
      setState(() {
        success = false;
        toWait();
      });

      setState(() {
        success = true;
      });
    } else {}
  }

  Future<void> submitChangedPassword() async {
    if (validateAndSave()) {
      if (changepasswordController.text != changepasswordControllerFirst.text) {
        setState(() => _scaffoldKey.currentState
            .showSnackBar(snackBar('Password fields do not match')));
      } else if (changepasswordController.text ==
          changepasswordControllerFirst.text) {
        setState(() {
          startTimer();
        });
        await changePasswordSendVerificarion(User.email);
        toPin();
        changePass = true;
      }
    }
  }

  void toLogin() => setState(() {
        formtype = FormType.login;
      });

  void toPin() => setState(() {
        formtype = FormType.pincode;
      });

  void toChangepassword() => setState(() {
        formtype = FormType.changePassword;
      });

  Future<void> toWait() async => setState(() {
        Future.delayed(const Duration(seconds: 4), () {
          setState(() {
            if (sendingPin) {
              formtype = FormType.pincode;
              startTimer();
            } else if (!sendingPin) {
              formtype = FormType.register;
              _scaffoldKey.currentState.showSnackBar(
                  snackBar('User with this email already exists'));
            }
          });
        });
        formtype = FormType.waiting;
      });

  void toRegister() => setState(() {
        formtype = FormType.register;
      });

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  @override
  void initState() {
    firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
      fcmToken = token;
    });

    changepasswordController.addListener(() {
      //use setState to rebuild the widget
      setState(() {});
    });
    changepasswordControllerFirst.addListener(() {
      //use setState to rebuild the widget
      setState(() {});
    });
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

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: start),
      new Duration(milliseconds: 300),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        current = start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  Future<void> proceed() async {
    pincode = pincodeController.text;
    if (changePass) {
      await checkPintoChangePassword(User.email, pincode, password);
      setState(() => _scaffoldKey.currentState.showSnackBar(snackBar(patched
          ? 'Password Changed'
          : 'Verification code is incorrect, try again')));
    } else {
      await checkPin(User.email, pincode, password);
      setState(() => _scaffoldKey.currentState.showSnackBar(snackBar(
          responceState
              ? 'You registered'
              : 'Verification code is incorrect, try again')));
    }
    if (responceState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    }
  }

  //===============================================================================//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
    } else if (formtype == FormType.register || formtype == FormType.waiting) {
      return [
        nullideaText(),
        registerEmailField(),
        registerPasswordField(),
      ];
    } else if (formtype == FormType.changePassword) {
      return [
        changepasswordimage(),
        loginEmailField(),
        changePasswordField(),
        changePasswordFieldconfirm(),
      ];
    } else
      return [
        verify(),
        emailTextForPincode(),
        textforPincode(),
      ];
  }

  List<Widget> toggleButtons() {
    if (formtype == FormType.login || formtype == FormType.waiting) {
      return [
        forgotPassword(),
        signInButton(),
        dontHaveAccount(),
      ];
    } else if (formtype == FormType.changePassword) {
      return [
        changePasswordButton(),
        backtoLogin(),
      ];
    } else if (formtype == FormType.register || formtype == FormType.waiting) {
      return [
        loadingbutton(success ? FormType.register : FormType.waiting),
        alreadyHaveAccount(),
      ];
    } else
      return [
        Column(
          children: <Widget>[
            pinCodeTextField(),
            proceedButton(),
            didntReceivedCode(),
            countDown(),
          ],
        )
      ];
  }

  //===================================Builders==================================//

  Padding pinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      child: PinCodeTextField(
        textStyle: TextStyle(color: primaryColor, fontSize: 32.0),
        selectedColor: primaryColor,
        selectedFillColor: primaryColor,
        length: 6,
        activeColor: primaryColor,
        backgroundColor: Colors.black,
        inactiveColor: Colors.grey.shade600,
        disabledColor: Colors.grey.shade600,
        obsecureText: false,
        animationType: AnimationType.fade,
        shape: PinCodeFieldShape.box,
        animationDuration: Duration(milliseconds: 300),
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 47,
        fieldWidth: 43,
        controller: pincodeController,
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }

  FlatButton didntReceivedCode() {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: current == 0 ? postResend : null,
      child: RichText(
        text: TextSpan(
          text: "Didn`t receive any code ? ",
          style: GoogleFonts.ubuntu(
              color: Colors.grey.shade700,
              fontSize: 16.0,
              fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
                text: " RESEND",
                style: TextStyle(
                    color: current == 0 ? primaryColor : disabledState)),
          ],
        ),
      ),
    );
  }

  ButtonTheme proceedButton() {
    return ButtonTheme(
      disabledColor: disabledState,
      height: 55,
      minWidth: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: RaisedButton(
            color: primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            child: Text(
              "PROCEED",
              style: GoogleFonts.ubuntu(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: pincodeController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black),
            ),
            onPressed: pincodeController.text.isNotEmpty ? proceed : null),
      ),
    );
  }

  Text countDown() {
    return Text(
      "$current",
      style: GoogleFonts.ubuntu(
          color: current == 0 ? Colors.white : primaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w600),
    );
  }

  Padding verify() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "VERIFY",
            style: GoogleFonts.ubuntu(
                color: primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 24),
          Image(
            image: AssetImage('assets/images/mailsvg.png'),
            height: 100,
            width: 100,
          ),
          SizedBox(width: 24),
          Text(
            "EMAIL",
            style: GoogleFonts.ubuntu(
                color: primaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Padding emailTextForPincode() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Text(
        User.email,
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            color: Colors.yellow[800],
            fontSize: 18.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding textforPincode() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
        "Enter the 6 digit code we sent you via email to proceed. Check your Spam folder as well, Usually email comes in 2-5 min",
        textAlign: TextAlign.center,
        style: GoogleFonts.ubuntu(
            color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  FlatButton backtoLogin() {
    return FlatButton(
      splashColor: Colors.transparent,
      textColor: primaryColor,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      onPressed: () {
        setState(
          () {
            toLogin();
          },
        );
      },
      child: Text(
        "Back to Sign In",
        style: GoogleFonts.ubuntu(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Image changepasswordimage() {
    return Image(
      image: AssetImage('assets/images/lock.png'),
      height: 100,
      width: 100,
    );
  }

  ButtonTheme changePasswordButton() {
    return ButtonTheme(
      disabledColor: disabledState,
      height: 55,
      minWidth: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: RaisedButton(
            color: primaryColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            child: Text(
              "CHANGE PASSWORD",
              style: GoogleFonts.ubuntu(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: changepasswordControllerFirst.text.isNotEmpty &&
                          changepasswordController.text.isNotEmpty
                      ? Colors.black
                      : Colors.black),
            ),
            onPressed: changepasswordControllerFirst.text.isNotEmpty &&
                    changepasswordController.text.isNotEmpty
                ? submitChangedPassword
                : null),
      ),
    );
  }

  SnackBar snackBar(String text) {
    return SnackBar(
        backgroundColor: primaryColor,
        content: new Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        duration: new Duration(seconds: 3));
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
        child: Text(
          "Nullidea",
          style: GoogleFonts.pacifico(
              fontSize: 70.0,
              fontWeight: FontWeight.normal,
              color: primaryColor),
        ),
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
        onSaved: (value) => User.email = value,
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
        onSaved: (value) => User.email = value,
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

  dynamic signInButton() {
    if (formtype == FormType.login) {
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
                  ? validateAndSignIn
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

  Container forgotPassword() {
    return Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: FlatButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: toChangepassword,
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
          hintText: "Enter Password",
          suffixIcon: buildmeIcon(),
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Padding changePasswordFieldconfirm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextFormField(
        obscureText: passwordVisible,
        controller: changepasswordController,
        onSaved: (value) => password = value,
        validator: (value) => validatePasswordCases(value),
        decoration: InputDecoration(
          hintText: "Confirm new password",
          suffixIcon: buildmeIcon(),
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Padding changePasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextFormField(
        obscureText: passwordVisible,
        controller: changepasswordControllerFirst,
        onSaved: (value) => password = value,
        validator: (value) => validatePasswordCases(value),
        decoration: InputDecoration(
          hintText: "Enter new password",
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
