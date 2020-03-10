import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';

//passwordtype pattern

bool passwordVisible = true;
Color buttonStateColor = Color.fromRGBO(255, 203, 50, 90);
TextEditingController passwordController = new TextEditingController();

@override
void initState() {
  buttonStateColor = Color.fromRGBO(255, 203, 50, 90);
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
      child: TextFormField(
        controller: passwordController,
        obscureText: passwordVisible,
        decoration: buildInputDecoration(),
        onChanged: (passwordController) {
          if (passwordController.isEmpty || passwordController == " ") {
            setState(() {
              buttonStateColor = Color.fromRGBO(255, 203, 50, 90);
              print("Zero Chars");
            });
          } if (passwordController.isNotEmpty){
            setState(() {
              print(passwordController);
              buttonStateColor = Color.fromRGBO(255, 203, 50, 1);
            });
          }
        },
      ),
    );
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
