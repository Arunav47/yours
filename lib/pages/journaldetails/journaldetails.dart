import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class JournalDetails extends StatefulWidget {
  const JournalDetails({super.key});

  @override
  State<JournalDetails> createState() => _JournalDetailsState();
}

class _JournalDetailsState extends State<JournalDetails> {
  final journalRef = FirebaseDatabase.instance.ref('Journal');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 11, 54),
        title: Center(child: Text("Journals", style: TextStyle(color: Colors.white),)),
      ),
      backgroundColor: Color.fromARGB(255, 4, 11, 54),
      body: FirebaseAnimatedList(
        query: journalRef, 
           defaultChild: Container(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        itemBuilder: (context, snapshot, animation, index) {
            return ListTile(
              subtitle:  Text(snapshot.child('date').value.toString(), style: TextStyle(color: Colors.white),),
              title: Text(snapshot.child('journal').value.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onTap: () {
                
              },
            );
          }
      ),
    );
  }
}