import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/screens/Login/login.dart';
import 'package:nullidea/theme.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      title: nullideaText(),
      navigateAfterSeconds: new Login(),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: primaryColor,
    );
  }
}

Text nullideaText() {
  return Text(
    "Nullidea",
    style: GoogleFonts.pacifico(
        fontSize: 70.0, fontWeight: FontWeight.normal, color: primaryColor),
  );
}
