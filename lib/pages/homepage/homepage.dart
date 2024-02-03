import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:yours/pages/homepage/widgets/customappbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      body: SliderDrawer(
          slideDirection: SlideDirection.RIGHT_TO_LEFT,
           key: _key,
           appBar: SliderAppBar(
            appBarHeight: 90,
              drawerIconColor: Colors.white,
               appBarColor: Color.fromARGB(255, 28, 36, 82).withOpacity(1),
               title: Text("Arunav",
                   style: TextStyle(
                       fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white))),
           slider: Container(color: Colors.indigoAccent),
           child: Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Color.fromARGB(255, 8, 20, 86).withOpacity(0.7),
                    child: Row(
                      children: [
                        Text("")
                      ],
                    ),
                  )
                ],
              ),
            ),
           ),
         ));
  }
} 