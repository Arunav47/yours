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
  final journalRef = FirebaseDatabase.instance.ref('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        slider: Container(color: Colors.indigo,), 
        child: Container(
          child: Expanded(child: FirebaseAnimatedList(query: query, itemBuilder: itemBuilder)),
        )
      ),
    );
  }
}