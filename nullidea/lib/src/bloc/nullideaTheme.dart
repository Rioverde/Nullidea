import 'package:flutter/material.dart';
import 'package:nullidea/src/constants/materialsData.dart';


ThemeData nullideatheme() {
  return ThemeData.dark().copyWith(
    buttonTheme: ButtonThemeData(buttonColor: primaryColor, height: 50, minWidth: double.infinity),
    accentColor: primaryColor,
    iconTheme: IconThemeData(color: primaryColor),
    primaryColor: primaryColor,
    cursorColor: primaryColor,
    inputDecorationTheme: InputDecorationTheme(
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
        color: Colors.grey.shade700,
      ),
      labelStyle: TextStyle(
        color: primaryColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red, //this has no effect
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
