import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref('Personal Data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 11, 54),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/profile_pic.png',
                        height: 150, width: 150),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.white)
                ),
                enabled: false,
                initialValue: "Tester",
              ),
              SizedBox(height: 30,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.white)
                ),
                enabled: false,
                initialValue: _auth!.email,
              ),
              
            ],
          ),
        ));
  }
}
