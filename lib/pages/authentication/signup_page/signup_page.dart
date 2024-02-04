import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yours/Utils/Validator/validator.dart';
import 'package:yours/Utils/toastMessage/toastMessage.dart';
import 'package:yours/pages/authentication/loginpage/login_page.dart';
import 'package:yours/pages/authentication/widgets/togglevisibility.dart';
import 'package:yours/pages/emotion_analysis_page/emotionanalysis_page.dart';
import 'package:yours/pages/homepage/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   final ref = FirebaseDatabase.instance.ref('Personal Data');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  bool isNotVisible = true;
  final _key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  void signup() {
    if (_key.currentState!.validate()) {
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
            String id = emailController.text.toString(); 
            ref.child(id).set({
                                  'id' : id,
                                  'Name' : nameController.text.toString(),
                                  'e-mail' : emailController.text.toString(),
                                
                                });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
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
                        "Hello!",
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
                            controller: nameController,
                            style: TextStyle(color: Colors.white),
                            
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white70,
                                ),
                                labelText: "What do you go by?",
                                labelStyle: TextStyle(color: Colors.white70),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        
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
                                prefixIcon: Icon(
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
                                minimumSize: Size(200, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.indigo),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                signup();
                                
                              }

                            },
                            child: const Text(
                              "SIGN UP",
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
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            "Login",
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
