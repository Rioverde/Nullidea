import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';

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

class _PasswordFieldState extends State<PasswordField>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: TextFormField(
        controller: passwordController,
        obscureText: passwordVisible,
        decoration: buildInputDecoration(),
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
              if (!passwordVisible)
                primaryColor = Colors.grey;
              else
                primaryColor = primaryColor;
            });
          },
        ),
        prefixIcon: Icon(Icons.lock),
        hintText: "Password",
      );
  }
}