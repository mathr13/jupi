import 'package:flutter/material.dart';
import 'package:jupiter/Screens/Views/splash_screen.dart';
import 'package:jupiter/Screens/Views/sign_in.dart';
import 'package:jupiter/Screens/Views/forgot_password.dart';


final routes = {
  '/' :          (BuildContext context) => new SplashScreen(),
  '/forget':         (BuildContext context) => new ForgetPassword(),

  '/signin':         (BuildContext context) => new SignIn(),

};