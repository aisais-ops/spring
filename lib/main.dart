import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spring/views/splashScreen.dart';

// the main function is the starting point for all our flutter apps
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( 
    const SplashScreenLancher(),
    //const CategorieLancher()
  );
}
