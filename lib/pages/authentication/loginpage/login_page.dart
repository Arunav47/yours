import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yours/Utils/Validator/validator.dart';
import 'package:yours/pages/authentication/signup_page/signup_page.dart';
import 'package:yours/pages/authentication/widgets/togglevisibility.dart';
import 'package:yours/pages/emotion_analysis_page/emotionanalysis_page.dart';
import 'package:yours/pages/homepage/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isNotVisible = true;
  final _key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  void login() {
    if (_key.currentState!.validate()) {
      _auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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
                image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover)),
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
                    child: const Image(
                        image: AssetImage(
                            "assets/yours-high-resolution-logo-transparent.png")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                          height: 85,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.white),
                            validator: (value) =>
                                Validator().isValidEmail(value),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white70,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 85,
                          child: TextFormField(
                            controller: passwordController,
                            style: TextStyle(color: Colors.white),
                            obscureText: isNotVisible,
                            validator: (value) =>
                                Validator().isValidPassword(value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white70,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isNotVisible = !isNotVisible;
                                    });
                                  },
                                  icon: ToggleVisibility()
                                      .visibility(isNotVisible),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.indigo),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                login();
                              }
                            },
                            child: const Text(
                              "LOGIN",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
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
