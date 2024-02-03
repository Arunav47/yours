import 'package:flutter/material.dart';
import 'package:yours/pages/splash_screen/splash_services.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor:Colors.white,
      body:
       
      Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
        ),
        child: Animate(
          effects: [FadeEffect(duration: Duration(seconds: 2)), ScaleEffect(duration: Duration(seconds: 2))],
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              child: Image(image: AssetImage('assets/yours-high-resolution-logo-transparent.png'), fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}