import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextButton extends StatelessWidget {
  final Alignment alignment;
  final String contentText;
  final String yellowText;
  final double fontSize;
  void pressed() {}

  TextButton(
      {this.alignment, this.fontSize, this.contentText, this.yellowText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          pressed();
        },
        child: RichText(
          text: TextSpan(
            text: contentText,
            style: GoogleFonts.ubuntu( color: Colors.grey.shade700,
                  fontSize: fontSize, fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                  text: yellowText,
                  style: TextStyle(color: Color.fromRGBO(255, 203, 50, 1))),
            ],
          ),
        ),
      ),
    );
  }
}
