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
    return const Scaffold(
      backgroundColor: Color(0xFF21232B),
      body:
       
      Center(
        
        child: Text("Test")
      ),
    );
  }
}