import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color color;

  final String functionality;
  final double height;
  final double width;
  final double borderRadius;
  final double fontSize;
  final Function() action;
  final EdgeInsets padding;

  CustomButton(
      {this.padding,
      this.color,
      this.action,
      this.functionality,
      this.borderRadius,
      this.fontSize,
      this.height,
      this.width});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: ButtonTheme(
        height: widget.height,
        minWidth: widget.width,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(widget.borderRadius)),
          color: widget.color,
          textColor: Colors.black,
          onPressed: () {
            setState(widget.action);
          },
          child: Text(widget.functionality,
              style: GoogleFonts.ubuntu(
                  fontSize: widget.fontSize, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
