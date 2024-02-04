import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromARGB(255, 4, 11, 54),

        
            
      body: Container(
        child: Column(
          
          children: [
            
              
                
                  SizedBox(height: 200,),
                  
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.greenAccent)
  ),
  child: Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: <Widget>[
      Image.asset('assets/profile_pic.png', height: 150, width: 150),
    
   ],
  ),
)
                ],
              ),
            )


          
        
      
    );
  }
}