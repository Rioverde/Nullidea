import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nullidea/screens/Account/allIdeas.dart';
import 'package:nullidea/screens/Account/ideaScreen.dart';
import 'package:nullidea/screens/Account/profilePage.dart';
import 'package:nullidea/screens/Account/search.dart';
import 'package:nullidea/screens/Account/userNotification.dart';

//Feed list
List<dynamic> feed = new List();

//GLobal keys
GlobalKey bottomNavigationKey = GlobalKey();
GlobalKey<ScaffoldState> scaffoldKeyAccountRouter = GlobalKey<ScaffoldState>();
final formKeyAccountRouter = GlobalKey<FormState>();
final formKey = GlobalKey<FormState>();

//Classes for account router
final Search search = Search();
final UserNotification userNotification = UserNotification();
final Allideas allideas = Allideas();
final ProfilePage profilePage = ProfilePage();
final Idea idea = Idea();

//ShowPage needed to provide widget or any page
Widget showPage = new ProfilePage();
//Choose any page from bottom bar
Widget pageChooser(int page) {
  switch (page) {
    case 0:
      return allideas;
      break;

    case 1:
      return search;
      break;

    case 2:
      return idea;
      break;

    case 3:
      return userNotification;
      break;

    case 4:
      return profilePage;
      break;

    default:
      return allideas;
  }
}

//Take the file that is already cropped
File cropped;
//Check the session if its end we clear or data from application, it comes whe we log out
bool sessionEnded = false;
//should the button be cunverted to loading
bool loading = false;
//Url of image
String tempImageUrl = '';
//email string
String temp = '';
//password string
String password;
//pincode string
String pincode;
//FCM token is the token of device
String fcmToken;
//success state of responce
bool success = true;
//state of visibility of password
bool passwordVisible = true;
//start point of clock
int start = 60;
//current value of clock
int current = 60;
//states of screens for login
bool changePass = false;

//Setting initial formtype
FormType formtype = FormType.login;
//Formtypes that are exists in Login Page
enum FormType {
  login,
  register,
  pincode,
  changePassword,
}

//Editing controllers to listen and fetch data
TextEditingController emailController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController changepasswordController = TextEditingController();
TextEditingController changepasswordControllerFirst = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController username = TextEditingController();
