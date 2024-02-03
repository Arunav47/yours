import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yours/pages/authentication/loginpage/login_page.dart';
import 'package:yours/pages/homepage/homepage.dart';

class SplashServices {
  final _auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    if (_auth.currentUser != null) {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage())));
    } else {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage())));
    }
  }
}
