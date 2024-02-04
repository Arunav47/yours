import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:yours/pages/breathing/breathing_practice.dart';
import 'package:yours/pages/journal/journal.dart';

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
          title: const Text("Home",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white))),
      slider: Container(color: Colors.indigoAccent),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Animate(
                    effects: [
                      FadeEffect(duration: Duration(seconds: 1), delay: Duration(seconds: 0))
                    ],
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreathingPractice(practiceFor: "Anxiety")));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 8, 20, 86).withOpacity(0.7),
                        ),
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add_circle_outline,
                                              size: 25,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Breathing",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "Anxiety",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Lottie.asset('assets/g7CHkkyoc1.json'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Animate(
                    effects: [ 
                      FadeEffect(duration: Duration(seconds: 1), delay: Duration(seconds: 1))
                    ],
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 8, 20, 86).withOpacity(0.7),
                        ),
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.bed,
                                          color: Colors.cyanAccent,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Bed time story",
                                          style: TextStyle(
                                              color: Colors.cyanAccent,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Insomnia",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              child: Lottie.asset(
                                  'assets/Animation - 1706937546672.json'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Animate(
                    effects: [
                      FadeEffect(duration: Duration(seconds: 1), delay: Duration(seconds: 2)),
                    ],
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Journal()));  
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 8, 20, 86).withOpacity(0.7),
                        ),
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.book,
                                              size: 25,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Jot down",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "Journal",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Lottie.asset(
                                'assets/Animation - 1706942016171.json',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Animate(
                    effects: [
                      FadeEffect(duration: Duration(seconds: 1), delay: Duration(seconds: 3)),
                    ],
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 8, 20, 86).withOpacity(0.7),
                        ),
                        height: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.music_note,
                                              size: 25,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Soothing Sound",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "Relaxing Music",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Lottie.asset(
                                'assets/Animation - 1706942016171.json',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 4, color: Colors.green)),
                child: Text(
                  "17",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent),
                ),
              )
            ),
        ],
      ),
    ));
  }
}
