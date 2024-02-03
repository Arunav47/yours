import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VictoryPage extends StatefulWidget {
  const VictoryPage({super.key});

  @override
  State<VictoryPage> createState() => _VictoryPageState();
}

class _VictoryPageState extends State<VictoryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: Color.fromARGB(255, 19, 207, 191)
              ),
              child: Lottie.asset('assets/LottieLogo1.json')
            ),
            SizedBox(height: 80,),
            Text("Congrats!", style: TextStyle(fontSize: 40, color: Colors.white),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.home, color: Colors.white, size: 40,),),
                    Text("Home", style: TextStyle(color: Colors.white),)
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.email, color: Colors.white, size: 40,),),
                    Text("Email", style: TextStyle(color: Colors.white),)
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.white, size: 40,)),
                    Text("Share", style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      
    );
  }
}