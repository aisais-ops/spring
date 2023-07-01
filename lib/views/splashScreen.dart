import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/routes/routes.dart';
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
      routes: Routes.getRoutes(),
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
  String? userType;
  @override
  void initState() {
    super.initState();
    loadUserType();
    // navigate to the new page after 3 seconds
    /*Timer(Duration(seconds: 3), () => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => LoginLancher())));*/

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
          context, userType == "vendeur" ? 'dashboardLancher' : 'homeLancher'),
    );
    
  }

  Future<String?> loadUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString('typeUser') == null
        ? "Geust"
        : prefs.getString('typeUser');
    setState(() {});
    return userType;
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
