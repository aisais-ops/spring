//import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginLancher extends StatelessWidget {
  const LoginLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container Image*/
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.55,
                child: const Image(
                  image: AssetImage('images/login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              /*Form login*/
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    /*Text login*/
                    const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 50.0,
                          color: Color(0xff826035),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /*white space*/
                    const SizedBox(height: 30),

                    /*Email | Phone input*/
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Color(0xff826035), // Change the text color here
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Email | Phone',
                        hintStyle: TextStyle(color: Colors.brown),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 141, 110, 99),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    /*Password input*/
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      style: TextStyle(
                        color: Color(0xff826035), // Change the text color here
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 141, 110, 99)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 141, 110, 99),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /*Login button*/
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff986C40),
                        minimumSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          var user = await auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeLancher()),
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    const SizedBox(height: 10),

                    /*Already Registered text*/
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterLancher()),
                        );
                      },
                      child: const Center(
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 155, 120, 24),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
