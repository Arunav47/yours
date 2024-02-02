import 'package:flutter/material.dart';
import 'package:yours/pages/splash_screen/splash_screen.dart';
import 'package:yours/pages/authentication/loginpage/login_page.dart';
import 'package:yours/victory_page/victory_page.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const VictoryPage(),
    );
  }
}

