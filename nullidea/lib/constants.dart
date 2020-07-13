import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();


String holder = '';
//email string
String email;
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
