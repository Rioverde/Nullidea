import 'package:flutter/material.dart';

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();



final formKeyEmail = new GlobalKey<FormState>();
final formKeyPassword = new GlobalKey<FormState>();

final formKeyEmailRegister = new GlobalKey<FormState>();
final formKeyPasswordRegister = new GlobalKey<FormState>();

final formEmail = formKeyEmail.currentState;
final formPassword = formKeyPassword.currentState;

final formEmailRegister = formKeyEmailRegister.currentState;
final formPasswordRegister = formKeyPasswordRegister.currentState;