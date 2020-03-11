import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';



TextEditingController emailController = new TextEditingController();
bool error = true;
bool passwordVisible = true;
TextEditingController passwordController = new TextEditingController();

class CustomField extends StatefulWidget {
  final Icon prefixIcon;
  final Icon suffixIcon;
  final double fieldRadius;
  final String hinttext;
  final int maxLines;
  final int minLines;

  CustomField(
      {this.hinttext,
      this.fieldRadius,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.minLines});

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Form(
        key: formEmailKey,
        child: TextFormField(
          validator: (value) => validateEmailCases(value),
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.fieldRadius))),
            // labelStyle: TextStyle(color: PrimaryColor),
            hintText: widget.hinttext,
          ),
        ),
      ),
    );
  }
}

  String validateEmailCases(String value) {
    Pattern pattern =
        r'(?=.*?[@])';
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

//===============================passwordtype pattern======================================


class PasswordField extends StatefulWidget {
  final Icon prefixIcon;
  final String hinttext;

  PasswordField({
    this.hinttext,
    this.prefixIcon,
  });

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
          validator: (value) => validateCases(value),
        ),
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
                : iconPrimaryColor = primaryColor;
          });
        },
      ),
      prefixIcon: widget.prefixIcon,
      hintText: "Password",
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
    return null;
  }
}
