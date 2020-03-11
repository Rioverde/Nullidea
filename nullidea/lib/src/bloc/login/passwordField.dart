import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';

//passwordtype pattern
bool error = true;
bool passwordVisible = true;
bool buttonState = false;
TextEditingController passwordController = new TextEditingController();

@override
void initState() {
  buttonState = false;
  passwordVisible = false;
}

@override
void dispose() {
  // Clean up the controller when the widget is disposed.
  passwordController.dispose();
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
      child: Form(
        key: formPasswordKey,
        child: TextFormField(
          controller: passwordController,
          obscureText: passwordVisible,
          decoration: buildInputDecoration(),
          onChanged: onchangeMethod,
          validator: (value) => validateCases(value),
        ),
      ),
    );
  }

  String validateCases(String value) {
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
      error = false;
    buttonState = true;
    return null;
  }

  void onchangeMethod(passwordController) {
    if (passwordController.isEmpty || passwordController == " ") {
      setState(() {
        print("Zero Chars");
      });
    }
    if (passwordController.isNotEmpty) {
      setState(() {
        print(passwordController);
      });
    }
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          // Based on passwordVisible state choose the icon
          passwordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          // Update the state i.e. toogle the state of passwordVisible variable
          setState(() {
            passwordVisible = !passwordVisible;
            !passwordVisible
                ? iconPrimaryColor = Colors.grey
                : iconPrimaryColor = Color.fromRGBO(255, 203, 50, 1);
          });
        },
      ),
      prefixIcon: Icon(Icons.lock),
      hintText: "Password",
    );
  }
}
