import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yours/authentication/loginpage/login_page.dart';


class SplashServices{

  void isLogin(BuildContext context){


    Timer(const Duration(seconds: 3),
    ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())));
  }
}