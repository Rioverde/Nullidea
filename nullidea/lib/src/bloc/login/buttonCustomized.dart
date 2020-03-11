import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nullidea/src/bloc/login/passwordField.dart';

class CustomButton extends StatefulWidget {
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
  _CustomButtonState createState() => _CustomButtonState();
}


class _CustomButtonState extends State<CustomButton> {
  @override
  void setState(fn) {
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      
      
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 0),
      child: ButtonTheme(
        height: widget.height,
        minWidth: widget.width,
        child: FlatButton(
        
          
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(widget.borderRadius)),
          color: buttonState ? Color.fromRGBO(255, 203, 50, 90) : Color.fromRGBO(255, 203, 50, 1),
          textColor: Colors.black,
          onPressed: widget.action,
          child: Text(widget.functionality,
              style: GoogleFonts.ubuntu(
                  fontSize: widget.fontSize, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
