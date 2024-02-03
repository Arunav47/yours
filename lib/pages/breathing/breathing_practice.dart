import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_builder/timer_builder.dart';

class BreathingPractice extends StatefulWidget {
  BreathingPractice(
    {super.key,
     required this.practiceFor,
  });
  String practiceFor;

  @override
  State<BreathingPractice> createState() => _BreathingPracticeState();
}

class _BreathingPracticeState extends State<BreathingPractice> {
  @override
  Widget build(BuildContext context) {
    int count = 120;
    return Scaffold(
      appBar: AppBar(
        title: Text("Breathing Practice", style: TextStyle(fontSize: 20),),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Anxiety"),
            Container(
              child: Lottie.asset('assets/xvEoTtb4Pg.json'),
            ),
            TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {

                return Text(
                  "${count--}",
                  style: TextStyle(
                      color: Color(0xff2d386b),
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                );
              }),
          ],
        ),
      ),
    );
  }
}