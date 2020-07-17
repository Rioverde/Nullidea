import 'package:flutter/material.dart';
import 'package:nullidea/screens/allIdeas.dart';
import 'package:nullidea/screens/ideas.dart';
import 'package:nullidea/screens/profilePage.dart';
import 'package:nullidea/screens/search.dart';
import 'package:nullidea/screens/userNotification.dart';

final formKey = GlobalKey<FormState>();

List<dynamic> achievements = new List();
GlobalKey bottomNavigationKey = GlobalKey();

final GlobalKey<ScaffoldState> scaffoldKeyAccountRouter =
    new GlobalKey<ScaffoldState>();
final formKeyAccountRouter = GlobalKey<FormState>();

bool usernameExist = false;


final Search search = Search();
final UserNotification userNotification = UserNotification();
final Allideas allideas = Allideas();
final ProfilePage profilePage = ProfilePage();
final Ideas ideas = Ideas();

Widget showPage = new ProfilePage();

Widget pageChooser(int page) {
  switch (page) {
    case 0:
      return allideas;
      break;

    case 1:
      return search;
      break;

    case 2:
      return ideas;
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

String tempImageUrl = '';
//email string
String temp = '';
//password string
String password;
//pincode string
String pincode;
String fcmToken;
//success state of responce
bool success = true;
//state of visibility of password
bool passwordVisible = true;
//start point of clock
int start = 10;
//current value of clock
int current = 10;
//states of screens for login
bool changePass = false;
enum FormType { login, register, waiting, pincode, changePassword }

FormType formtype = FormType.login;

TextEditingController emailController = TextEditingController();
TextEditingController pincodeController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController changepasswordController = TextEditingController();
TextEditingController changepasswordControllerFirst = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController username = TextEditingController();
