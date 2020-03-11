import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color.fromRGBO(255, 203, 50, 1);
Color iconPrimaryColor = Color.fromRGBO(255, 203, 50, 1);
TextStyle ubuntuSemiBold_16 = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle ubuntuSemiBold_12 = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w600);
TextStyle ubuntuRegular_16 = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w400);
TextStyle ubuntuRegular_12 = GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.w400);

ThemeData nullideatheme() {
  return ThemeData.dark().copyWith(
    accentColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    iconTheme: IconThemeData(color: primaryColor),
    primaryColor: primaryColor,
    cursorColor: primaryColor,
    inputDecorationTheme: inputDecorationhandler(),
  );
}

InputDecorationTheme inputDecorationhandler() {
  return InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    hintStyle: TextStyle(
      fontFamily: 'Ubuntu',
      color: Colors.grey.shade700,
    ),
    labelStyle: TextStyle(
      fontFamily: 'Ubuntu',
      color: primaryColor,
    ),
  );
}
