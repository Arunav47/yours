import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:yours/pages/homepage/widgets/customappbar.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  String s = DateFormat('d MMM yyyy').format(DateTime.now());
  final _key = GlobalKey<SliderDrawerState>();
  final journalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 11, 54),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.save),),
        body: SliderDrawer(
      slideDirection: SlideDirection.RIGHT_TO_LEFT,
      key: _key,
      appBar: SliderAppBar(
          appBarHeight: 90,
          drawerIconColor: Colors.white,
          appBarColor: Color.fromARGB(255, 28, 36, 82).withOpacity(1),
          title: Text("Home",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))),
      slider: Container(color: Colors.indigoAccent),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(s),
              TextFormField(
                style: TextStyle(fontSize: 18, color: Colors.grey),
                controller: journalController,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Write here......",
                ),
              )
            ],
          ),
        ),
      )
    ));
  }
}
