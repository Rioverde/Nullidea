import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(fieldRadius))),
          // labelStyle: TextStyle(color: PrimaryColor),
          hintText: hinttext,
        ),
      ),
    );
  }
}
