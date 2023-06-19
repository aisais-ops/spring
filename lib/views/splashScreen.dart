import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spring/routes/splashScreenRoutes.dart';
import 'package:spring/views/login.dart';

class SplashScreenLancher extends StatelessWidget {
  const SplashScreenLancher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      /*routes: {
        'login': (context) => const LoginLancher(),
      },*/
      routes: SplashScreenRoutes.getRoutes(),
      
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // navigate to the new page after 3 seconds
    /*Timer(Duration(seconds: 3), () => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => LoginLancher())));*/
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'login'),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Color(0xffba9964), Colors.white])),
      child: const Center(
          child: Image(
        image: AssetImage('images/logo.png'),
        width: 150,
        height: 150,
      )),
    )));
  }
}
