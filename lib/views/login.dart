//import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spring/models/utilisateur.dart';
import 'package:spring/routes/routes.dart';
import 'package:spring/viewmodels/authViewModel.dart';
import 'package:spring/views/seller/dashboard.dart';
import 'buyer/home.dart';
import 'register.dart';
import 'package:spring/models/vendeur.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLancher extends StatelessWidget {
  const LoginLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: Routes.getRoutes(),
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
  //final auth = FirebaseAuth.instance;
  //late String email;
  //late String password;
  Utilisateur utilisateur = Utilisateur();
  AuthViewModel authViewModel = AuthViewModel();

  /*Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

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
                height: MediaQuery.of(context).size.height * 0.50,
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
                        utilisateur.email = value;
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
                        utilisateur.password = value;
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
                        String? data = await authViewModel.signIn(utilisateur);
                  
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => data=="vendeur"?const DashboardLancher():const HomeLancher()),
                        );*/
                         Navigator.pushReplacementNamed(context,data=="vendeur"?'dashboardLancher':'homeLancher');

                        /*if (user != null) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          var v = "acheteur";
                          if (user is Vendeur) {
                            v = "vendeur";
                          }
                          await prefs.setString('typeUser', '$v');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeLancher()),
                          );
                        }*/
                        /* try {
                          var user = await auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            var v = "acheteur";
                            if (user is Vendeur) {
                              v = "vendeur";
                            }

                            await prefs.setString('typeUser', '$v');
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
                        }*/
                      },
                    ),
                    const SizedBox(height: 10),

                    /*Already Registered text*/
                    GestureDetector(
                      onTap: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterLancher()),
                        );*/
                         Navigator.pushReplacementNamed(context,'registerLancher');
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

                    /*Or join with text*/
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'OR JOIN WITH',
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    ),

                    /*google and facebook button*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*google button */
                        GestureDetector(
                          onTap: () async {
                            // Handle image press
                            UserCredential user =
                                await authViewModel.signInWithGoogle();
                          },
                          child: const Image(
                            image: AssetImage('images/logo.png'),
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),

                        /*facebook button */
                        GestureDetector(
                          onTap: () {
                            // Handle image press
                          },
                          child: const Image(
                            image: AssetImage('images/logo.png'),
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
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
