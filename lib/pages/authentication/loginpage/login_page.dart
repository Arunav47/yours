import 'package:flutter/material.dart';
import 'package:yours/pages/authentication/widgets/togglevisibility.dart';
import 'package:yours/pages/homepage/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isNotVisible = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)
            ),
            // child: Image(image: AssetImage('assets/background.jpg'), fit: BoxFit.cover,),  
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                          height: 200,
                          width: 200,
                          child: const Image(image: AssetImage("assets/yours-high-resolution-logo-transparent.png")),
                        ),
                  SizedBox(height: 20,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Welcome Back!",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
              
                        SizedBox(
                          height: 65,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email, color: Colors.white70,),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 65,
                          child: TextFormField(
                            obscureText: isNotVisible,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: Colors.white70,),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isNotVisible = !isNotVisible;
                                    });
                                  },
                                  icon: ToggleVisibility().visibility(isNotVisible),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.indigo),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?", style: TextStyle(
                          color: Colors.white
                        ),),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Sign Up",
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
