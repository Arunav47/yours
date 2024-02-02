import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VictoryPage extends StatefulWidget {
  const VictoryPage({super.key});

  @override
  State<VictoryPage> createState() => _VictoryPageState();
}

class _VictoryPageState extends State<VictoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/LottieLogo1.json'),
      )
      // appBar: AppBar(
      //   title: Text("Arunav"),
      //   actions: [
      //     InkWell(
            
      //     )
      //   ],
      // ),
      // body: Column(

      // ),
    //   bottomNavigationBar: BottomNavigationBar(items: [],),
    // );
    );
  }
}