import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nullidea/mechanics.dart';

import 'package:nullidea/my_flutter_app_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../handleRequests.dart';
import '../theme.dart';

List<dynamic> achievements = new List();
bool usernameExist = false;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  void usernameCheck() {
    if (username.text.isNotEmpty && holder != username.text) {
      changeUsername(email, username.text);
      setState(() {
        holder = username.text;
        Navigator.pop(context);
      });
    }
  }

  onAlertWithCustomContentPressed(context) {
    Alert(
        style: AlertStyle(
            backgroundColor: Colors.black,
            titleStyle: TextStyle(color: primaryColor)),
        context: context,
        title: "Change your username",
        content: Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) => validateUsername(value),
                controller: username,
                onSaved: (value) => username.text = value,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: 'Username',
                ),
              ),
            ],
          ),
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              usernameCheck();
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ]).show();
  }

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
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            MyFlutterApp.postidea,
            color: Colors.black,
            size: 36,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.black,
          ),
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
        title: FlatButton(
          onPressed: () => onAlertWithCustomContentPressed(context),
          child: Text(holder,
              style: GoogleFonts.pacifico(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  alignment: Alignment.center,
                  child: SafeArea(
                    child: Row(children: [
                      CircleAvatar(
                        child: CircleAvatar(
                          radius: 62,
                          backgroundColor: Colors.black,
                        ),
                        backgroundColor: primaryColor,
                        radius: 66,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: userextradata("Entries", primaryColor, 14.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: userextradata("234", Colors.white, 16.0),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(18, 18, 0, 0),
                              child:
                                  userextradata("Rating", Colors.yellow, 16.0)),
                          Padding(
                              padding: EdgeInsets.fromLTRB(18, 0, 0, 18),
                              child: userextradata("4553", Colors.white, 20.0)),
                          Padding(
                              padding: EdgeInsets.only(right: 20),
                              child:
                                  userextradata("Earned", primaryColor, 14.0)),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: userextradata("543", Colors.white, 16.0),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        child: Image.asset(
                          'assets/images/trophy.png',
                          scale: 2,
                        ),
                        alignment: Alignment.topLeft,
                      ),
                    ]),
                  ),
                ),
              ),
              Divider(
                color: primaryColor,
                thickness: 1.5,
                endIndent: 24,
                indent: 24,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding userdata(String text, Color color, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
            fontSize: size, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  Text userextradata(String text, Color color, double size) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontSize: size, fontWeight: FontWeight.w600, color: color),
    );
  }
}
