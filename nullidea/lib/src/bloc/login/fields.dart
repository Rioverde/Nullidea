import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/patternBuilders.dart';

TextEditingController emailController = new TextEditingController();

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


  