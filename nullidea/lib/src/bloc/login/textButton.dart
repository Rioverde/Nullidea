import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/src/constants/nullideaTheme.dart';

class TextButton extends StatefulWidget {
  final Alignment alignment;
  final String contentText;
  final String yellowText;
  final double fontSize;
  final Function() pressed;

  TextButton(
      {this.alignment,
      this.fontSize,
      this.contentText,
      this.yellowText,
      this.pressed});

  @override
  _TextButtonState createState() => _TextButtonState();
}

class _TextButtonState extends State<TextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {setState(widget.pressed);},
        child: RichText(
          text: TextSpan(
            text: widget.contentText,
            style: GoogleFonts.ubuntu(
                color: Colors.grey.shade700,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600),
            children: <TextSpan>[
              TextSpan(
                  text: widget.yellowText,
                  style: TextStyle(color: primaryColor)),
            ],
          ),
        ),
      ),
    );
  }
}

