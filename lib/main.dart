import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yours/pages/homepage/homepage.dart';
import 'package:yours/pages/splash_screen/splash_screen.dart';
import 'package:yours/pages/authentication/loginpage/login_page.dart';
import 'package:yours/pages/victory_page/victory_page.dart';
// <<<<<<< HEAD



// =======
// >>>>>>> 20f2735a4b56db423aa8cf498cab0d34e0e812c4


void main() async{
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
      home: const SplashScreen(),
    );
  }
}

