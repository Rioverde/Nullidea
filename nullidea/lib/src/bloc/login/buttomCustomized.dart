import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/src/bloc/nullideaTheme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String functionality;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  void pressed() {}

  CustomButton(
      {this.color,
      this.functionality,
      this.borderRadius,
      this.fontSize,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ButtonTheme(
        height: height,
        minWidth: width,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(borderRadius)),
          color: primaryColor,
          textColor: Colors.black,
          onPressed: () {
            /*...*/
            pressed();
            print('Will go to Register soon');
          },
          child: Text(functionality,
              style: GoogleFonts.ubuntu(
                  fontSize: fontSize, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
