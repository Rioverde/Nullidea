import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

String email;
String password;

enum FormType {
  login,
  register,
  waiting
}

FormType formtype = FormType.login;
var emailController = TextEditingController();
var passwordController = TextEditingController();