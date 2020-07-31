import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nullidea/screens/Account/accountRouter.dart';
import 'package:nullidea/screens/Login/login.dart';
import 'package:nullidea/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../handleRequests.dart';
import '../user.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        getSession();
      });
    });
  }

  Future<void> getSession() async {
    SharedPreferences sessionStatus = await SharedPreferences.getInstance();
    SharedPreferences sessionMail = await SharedPreferences.getInstance();
    if (sessionStatus.getBool('isLogged') == null) {
      sessionStatus.setBool('isLogged', false);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
    if (sessionStatus.getBool('isLogged')) {
      User.email = sessionMail.getString('userMail');
      returnUsername();
      checkUsername(User.username);
      print(User.username);

      await getImageFromAWS(User.email);
      print("here");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AccountRouter()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                child: nullideaText(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: 55,
                child: SpinKitWanderingCubes(
                  duration: Duration(seconds: 2),
                  color: primaryColor,
                  size: 50.0,
                ),
              ),
            ),
          ),
        ],
      )),
      backgroundColor: Colors.black,
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
