import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nullidea/my_flutter_app_icons.dart';

import '../theme.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: const Duration(milliseconds: 1000),
        height: 55,
        color: primaryColor,
    backgroundColor: Colors.transparent,
    items: <Widget>[
      Icon(Icons.home, size: 30,color: Colors.black,),
      Icon(Icons.search, size: 30,color: Colors.black,),
      Icon(MyFlutterApp.postidea, color: Colors.black, size: 36,),
      Icon(Icons.notifications, size: 30, color: Colors.black,),
      Icon(Icons.person, size: 30, color: Colors.black,),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
      appBar: AppBar(
        actions: <Widget>[
          // action button
          IconButton(
            iconSize: 24,
            color: Colors.black,
            onPressed: () {},
            icon: Icon(Icons.dehaze),
          ),
        ],
        title: Text("Nullidea",
            style: GoogleFonts.pacifico(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.black)),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Folowers",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: primaryColor),
                          ),
                          Text(
                            "145",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CircleAvatar(
                          child: CircleAvatar(
                            radius: 56,
                            backgroundColor: Colors.black,
                          ),
                          backgroundColor: primaryColor,
                          radius: 60,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Folowing",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: primaryColor),
                          ),
                          Text(
                            "345",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ideas",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: primaryColor),
                      ),
                      Text(
                        "34 ",
                        style: GoogleFonts.ubuntu(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userdata("Name", primaryColor),
                  userdata("Actual Name", Colors.white),
                  userdata("Username", primaryColor),
                  userdata("Email Address", Colors.white),
                  userdata("Phone number", primaryColor),
                  userdata("+905428873591", Colors.white),
                  userdata("Bio", primaryColor),
                  userdata("Some text", Colors.white),
                  userdata("Website", primaryColor),
                  userdata("www.nullidea.com", Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Padding userdata(String text, Color color) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
      text,
      style: GoogleFonts.ubuntu(
          fontSize: 16.0, fontWeight: FontWeight.normal, color: color),
    ),
  );
}
