import 'package:flutter/material.dart';
import 'package:yours/pages/splash_screen/splash_services.dart';

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
        child: Container(
          height: 200,
          width: 200,
          child: Image(image: AssetImage('assets/yours-high-resolution-logo-transparent.png'), fit: BoxFit.cover,),
        ),
      ),
    );
  }
}