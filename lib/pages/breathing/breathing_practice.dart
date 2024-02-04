import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:yours/pages/victory_page/victory_page.dart';

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
  bool val = false;
  int count = 120;
  Widget? timerReturner(bool val){
    if(val){
      return Column(
        children: [
          Container(
              child: Lottie.asset('assets/xvEoTtb4Pg.json'),
            ),
                Text(
                  "${count--}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                )
        ],
      );
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 11, 54),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: (){
        if(val == false){
        setState(() {
            val = true;
          });
          Timer(Duration(seconds: 120), () {
              if(count < 0)
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VictoryPage()));
              else{
                Timer.periodic(Duration(seconds: 1), (ti){
                  if(count < 0){
                    ti.cancel();
                  }
                  setState(() {
                  });
                });

              }
          });
        }
      }, child: Icon(Icons.play_arrow),),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 11, 54),
        automaticallyImplyLeading: false,
        title: Center(child: Text("Breathing Practice", style: TextStyle(fontSize: 20, color: Colors.white),)),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Anxiety", style: TextStyle(color: Colors.white),),
            Container(
              alignment: Alignment.center,
              height: 500,
              child: timerReturner(val),
            )
          ],
        ),
      ),
    );
  }
}