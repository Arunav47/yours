import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:yours/pages/homepage/widgets/customappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
           key: _key,
           appBar: SliderAppBar(
               appBarColor: Colors.white,
               title: Text("Arunav",
                   style: const TextStyle(
                       fontSize: 22, fontWeight: FontWeight.w700))),
           slider: Container(color: Colors.indigoAccent[600]),
           child: Container(color: Colors.amber),
         ));
  }
} 