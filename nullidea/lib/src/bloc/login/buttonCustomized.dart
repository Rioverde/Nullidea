import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String functionality;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final Function() action;

  CustomButton(
      {this.color,
      this. action,
      this.functionality,
      this.borderRadius,
      this.fontSize,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
      child: ButtonTheme(
        height: height,
        minWidth: width,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(borderRadius)),
          color: color,
          textColor: Colors.black,
          onPressed: action,
          child: Text(functionality,
              style: GoogleFonts.ubuntu(
                  fontSize: fontSize, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
