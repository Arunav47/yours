import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yours/pages/homepage/homepage.dart';
import 'package:yours/pages/homepage/landing_page.dart';
class FeelingAnalysis extends StatefulWidget {
  const FeelingAnalysis({super.key});

  @override
  State<FeelingAnalysis> createState() => _FeelingAnalysisState();
}

class _FeelingAnalysisState extends State<FeelingAnalysis> {
  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  @override
  void initState() {
    super.initState();
    initRecorder();
  }
  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }
  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    await recorder.openRecorder();
    isRecorderReady = true;
    recorder.setSubscriptionDuration(
      const Duration(microseconds: 500),
    );
  }
  bool val = false;
  Widget? recordingStart(bool val){
    if(val){
      return Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.orange, width: 3), right: BorderSide(color: Colors.orange, width: 3))
        ),
        width: 200,
        height: 50,
        child: Lottie.asset('assets/BgwHKVIBvm.json')
      );
    }
    else{
      return SizedBox(
        height: 50,
      );
    }
  }
  Future record() async{
    if(!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }
  Future stop() async {
    if(!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);

    print('Recorded audio: $audioFile');
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 11, 54),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tell us how are you feeling in one line", style: TextStyle(fontSize: 20, color: Colors.white),),
            InkWell(
              child: Container(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/Animation - 1706956849389.json'),
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: recordingStart(val),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.yellow
              ),
              child: IconButton(
                onPressed: () async {
                  if(recorder.isRecording){
                    val = false;
                    await stop();
                    setState((){
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                  }
                  else{
                    val = true;
                    await record();
                    
                    setState((){});
                  }
                  },
                icon: (!val)?Icon(Icons.play_arrow, size: 60,):Icon(Icons.pause, size: 60,)),
            )
          ],
        ),
      ),
    );
  }
}