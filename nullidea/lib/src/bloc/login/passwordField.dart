import 'package:flutter/material.dart';
import 'package:nullidea/src/constants/materialsData.dart';

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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: passwordVisible,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white),
        cursorColor: primaryColor,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: hidecolor,
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
    );
  }
}
