import 'package:flutter/material.dart';
import 'package:yours/splash_screen/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();

void initState(){
  super.initState();
  splashScreen.isLogin(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:
       
      Center(
        child: Image.asset(
          "assets/yours-high-resolution-logo.png", // Replace with the path to your PNG file
          width: 200, // Adjust the width as needed
          height: 200, // Adjust the height as needed
        ),
      ),
    );
  }
}