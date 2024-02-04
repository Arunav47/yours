import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
// import 'package:just_audio/just_audio.dart';

class soundPlayer extends StatefulWidget {
   soundPlayer({super.key});


  @override



  State<soundPlayer> createState() => _soundPlayerState();
}

class _soundPlayerState extends State<soundPlayer> {

  

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    void initState(){
      Future setAudio() async{

        // audioPlayer.setReleaseMode(ReleaseMode.loop);
        final player = AudioCache(prefix: 'assets/');
        final url = await player.load('English Stories  The Destiny  English audio story  listen and learn english.mp3');
        audioPlayer.setSourceUrl(url.path);

        // final file = File(path);
        // audioPlayer.setSourceUrl(file.path, isLocal:true);
      }
      super.initState();

      setAudio();
    

      audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
       });

       audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
        });

        audioPlayer.onPositionChanged.listen((newPosition) { 
          setState(() {
            position = newPosition;
          });
        });
    }

 

    return[
      if(duration.inHours>0) hours,
      minutes,
      seconds,
    ].join(':');
  }

    void dispose(){
    audioPlayer.dispose();

    super.dispose();
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
             child: Lottie.asset('assets/Animation - 1706993912026.json'),
          ),
          const SizedBox(height: 32),
          const Text(
            'Bed Time Story',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Author',
            style: TextStyle(fontSize: 20),
          ),
          Slider(min: 0, max: duration.inSeconds.toDouble(),
          value: position.inSeconds.toDouble(), onChanged: (value) async{
            final position = Duration(seconds: value.toInt());
            await audioPlayer.seek(position);
            await audioPlayer.resume();
          }),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(formatTime(position)),
              Text(formatTime(duration - position),)                
            ],
          ),
          ),
          CircleAvatar(
            radius: 35,
            child:  IconButton(icon: Icon(
              isPlaying? Icons.pause : Icons.play_arrow,
            ),
            iconSize: 50,
            onPressed: () async{
              if(isPlaying){
                await audioPlayer.pause();
              }
              else {String url = 'assets/English Stories  The Destiny  English audio story  listen and learn english.mp3';
                await audioPlayer.play(UrlSource(url));
                
                }
            },
            ),
          )
        ]
      ),),
      
    );
  }
}