import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nullidea/myCustomIcons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../constants.dart';

import '../../handleRequests.dart';
import '../../mechanics.dart';
import '../../theme.dart';
import '../../user.dart';
import 'profilePage.dart';

class AccountRouter extends StatefulWidget {
  AccountRouter({Key key}) : super(key: key);

  @override
  _AccountRouterState createState() => _AccountRouterState();
}

class _AccountRouterState extends State<AccountRouter> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SafeArea(
        child: Container(
          width: 250,
          child: rightBar(context),
        ),
      ),
      key: scaffoldKeyAccountRouter,
      bottomNavigationBar: navigationBar(),
      appBar: appBar(context),
      resizeToAvoidBottomInset: false,
      body: showPage,
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[
        // action button
        IconButton(
          iconSize: 24,
          color: Colors.black,
          onPressed: () {
            openEndDrawer();
          },
          icon: Icon(Icons.dehaze),
        ),
      ],
      title: Form(
        key: formKeyAccountRouter,
        child: FlatButton(
          onPressed: () => onAlertWithCustomContentPressed(context),
          child: Text(User.username,
              style: GoogleFonts.pacifico(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
        ),
      ),
    );
  }

  void usernameCheck() {
    if (formKeyAccountRouter.currentState.validate()) {
      if (validateUsername(username.text) == null) {
        changeUsername(User.email, username.text);
        setState(() {
          User.username = username.text;
          Navigator.pop(context);
        });
      } else if (User.username == username.text) {
        print("Same");
        //_scaffoldKeyAccountRouter.currentState.showSnackBar(snackBar);
      }
    }
  }

  bool validateAndSave() {
    final form = formKeyAccountRouter.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  onAlertWithCustomContentPressed(context) {
    Alert(
        style: AlertStyle(
            backgroundColor: Colors.black,
            titleStyle: TextStyle(color: primaryColor)),
        context: context,
        title: "Change your username",
        content: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 0, 8),
          child: Column(
            children: <Widget>[
              TextFormField(
                autovalidate: true,
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

  CurvedNavigationBar navigationBar() {
    return CurvedNavigationBar(
        index: 4,
        key: bottomNavigationKey,
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
            MyCustomIcons.postidea,
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
        onTap: (int tappedPage) {
          setState(() {
            showPage = pageChooser(tappedPage);
          });
        }
        //Handle button tap
        );
  }
}
