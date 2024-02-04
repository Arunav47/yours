// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:yours/pages/homepage/widgets/customappbar.dart';
// import 'package:lottie/lottie.dart';
// import 'package:intl/intl.dart';

// class Journal extends StatefulWidget {
//   const Journal({super.key});

//   @override
//   State<Journal> createState() => _JournalState();
// }

// class _JournalState extends State<Journal> {
  // String s = DateFormat('d MMM yyyy').format(DateTime.now());
//   String text = "Hold the the Button to speak";
//   final _key = GlobalKey<SliderDrawerState>();
//   late SpeechToText speechToText;
//   final journalController = TextEditingController();

//   final journalRef = FirebaseDatabase.instance.ref('Journal');
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     speechToText = SpeechToText();
//   }

//   @override
//   Widget build(BuildContext context) {

//     bool isRecording = false;
//     final size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;

//     // return Scaffold(
//     //   backgroundColor: Color.fromARGB(255, 4, 11, 54),
//     //   floatingActionButton: FloatingActionButton(onPressed: (){
//     //     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     //       journalRef.child(id).set({
//     //         'Date' : s,
//     //         'Note' : journalController.text,
//     //         'id' : id,
//     //       });},
//     //     child: const Icon(Icons.save),),
//     //     body: SliderDrawer(
//     //   slideDirection: SlideDirection.RIGHT_TO_LEFT,
//     //   key: _key,
//     //   appBar: SliderAppBar(
//     //       appBarHeight: 90,
//     //       drawerIconColor: Colors.white,
//     //       appBarColor: Color.fromARGB(255, 28, 36, 82).withOpacity(1),
//     //       title: Text("Journal",
//     //           style: TextStyle(
//     //               fontSize: 22,
//     //               fontWeight: FontWeight.w700,
//     //               color: Colors.white))),
//     //   slider: Container(color: Colors.indigoAccent),
//     //   child: Container(
//     //     padding: EdgeInsets.symmetric(horizontal: 20),
//     //     child: SingleChildScrollView(
//     //       child: Column(
//     //         mainAxisAlignment: MainAxisAlignment.start,
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         children: [
//     //           Text('Date: $s', style: TextStyle(color: Colors.white, fontSize: 17),),
//     //           SizedBox(height: 10,),
//     //           TextFormField(
//     //             style: TextStyle(fontSize: 18, color: Colors.white, ),
//     //             controller: journalController,
//     //             maxLines: null,
//     //             decoration: const InputDecoration(
//     //               border: InputBorder.none,
//     //               hintText: "Write here......",
//     //               hintStyle: TextStyle(color: Colors.white)
//     //             ),
//     //           )
//     //         ],
//     //       ),
//     //     ),
//     //   )
//     // ));
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("Journal", style: TextStyle(fontSize: 20),)),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){},
//         child: GestureDetector(
//           onTapDown: (details)async{
            
//             if(!isRecording){
//               var available = await speechToText.initialize(); 
//               if(available){
//                 setState(() {
//               isRecording = true;
//               speechToText.listen(
//                 onResult: (result) {
//                   setState((){
//                     text = result.recognizedWords;
//                   });
//                 },
//               );
//             });
//               }
//             }
//           },
//           onTapUp: (details){
//             setState(() {
//               isRecording = false;
//             });
//             speechToText.stop();
//           },
//           child: CircleAvatar(
//             radius: 35,
//             child: Icon(Icons.mic),
//           ),
//         ),
//       ),
//       body: Container(
//         child: Text(text)
//       ),
//     );
//   }
// }

import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:intl/intl.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;






class Journal extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<Journal> {
  String s = DateFormat('d MMM yyyy').format(DateTime.now());
  final journalRef = FirebaseDatabase.instance.ref('Journal');
  final Map<String, HighlightedWord> _highlights = {
    'happy': HighlightedWord(
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'sad': HighlightedWord(
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'angry': HighlightedWord(
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'depressed': HighlightedWord(
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'calm': HighlightedWord(
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 11, 54),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 11, 54),
        title: Center(child: Text("Journal", style: TextStyle(color: Colors.white),)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        // endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        // repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 20.0),
                child: Text('Date: $s', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                child: TextHighlight(
                  text: _text,
                  words: _highlights,
                  textStyle: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      String id = DateTime.now().millisecondsSinceEpoch.toString();
          journalRef.child(id).set({
            'journal' : _text,
            'id' : id,
            'date': s
          });
    }
  }
}
