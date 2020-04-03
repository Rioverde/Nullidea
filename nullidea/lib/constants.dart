import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

//email string 
String email;
//password string
String password;
//pincode string 
String pincode;
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
var emailController = TextEditingController();
var pincodeController = TextEditingController();
var passwordController = TextEditingController();
var changepasswordController = TextEditingController();
var changepasswordControllerFirst = TextEditingController();
