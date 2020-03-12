import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';

String email = '1';
String password = '1';
bool passwordVisible = true;
bool enablesuffix;

class CustomField extends StatefulWidget {
  final TextEditingController editingController;
  final Icon prefixIcon;
  final double fieldRadius;
  final String hinttext;
  final int maxLines;
  final int minLines;
  final Key key;
  final EdgeInsets padding;
  final String Function(String) validate;
  final bool enableSuffix;

  CustomField(
      {this.validate,
      this.editingController,
      this.enableSuffix,
      this.hinttext,
      this.fieldRadius,
      this.prefixIcon,
      this.padding,
      this.maxLines,
      this.minLines,
      this.key});

  @override
  _CustomFieldState createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        validator: widget.validate,
        controller: widget.editingController,
        obscureText: enabled(widget.enableSuffix),
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: buildmeIcon(widget.enableSuffix),
          border: buildOutlineInputBorder(),
          // labelStyle: TextStyle(color: PrimaryColor),
          hintText: widget.hinttext,
        ),
      ),
    );
  }

  bool enabled(bool enabled) {
    if (enabled) {
      return passwordVisible;
    } else {
      return false;
    }
  }

  IconButton buildmeIcon(bool enableSuffix) {
    if (enableSuffix) {
      return IconButton(
        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            if (!mounted) return;
            passwordVisible = !passwordVisible;
            !passwordVisible
                ? iconPrimaryColor = Colors.grey
                : iconPrimaryColor = primaryColor;
          });
        },
      );
    } else
      return null;
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.fieldRadius)));
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
  if (value == email) {
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
