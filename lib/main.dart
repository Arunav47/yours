import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yours/pages/breathing/breathing_practice.dart';
import 'package:yours/pages/authentication/signup_page/signup_page.dart';
import 'package:yours/pages/emotion_analysis_page/emotionanalysis_page.dart';
import 'package:yours/pages/homepage/homepage.dart';
import 'package:yours/pages/homepage/landing_page.dart';
import 'package:yours/pages/journal/journal.dart';
import 'package:yours/pages/profile/profile_page.dart';
import 'package:yours/pages/soundPlayer/soundPlayer.dart';
import 'package:yours/pages/splash_screen/splash_screen.dart';
import 'package:yours/pages/authentication/loginpage/login_page.dart';
import 'package:yours/pages/victory_page/victory_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yours',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}
