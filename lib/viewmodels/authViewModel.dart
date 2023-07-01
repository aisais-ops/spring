import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spring/models/utilisateur.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spring/models/vendeur.dart';
import 'package:flutter/material.dart';
import 'package:spring/views/buyer/home.dart';

class AuthViewModel {
  final auth = FirebaseAuth.instance;
  late BuildContext context;

  Future<String?> signIn(Utilisateur utilisateur) async {
    String role = "";
    try {
      var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: utilisateur.email, password: utilisateur.password);

      DocumentSnapshot data = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.user!.uid)
          .get();

      if (data.exists) {
        role = data.get('role');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('typeUser', '${data.get('role')}');
      }
      return role;

      /*return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: utilisateur.email, password: utilisateur.password);*/
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      //return null;
    } catch (e) {
      print(e);
      //return null;
    }
  }

  Future<void> signUp(Utilisateur utilisateur) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: utilisateur.email, password: utilisateur.password);
      /*.then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginLancher(),
              )));*/

      //CollectionReference user = ;
      //print('${user.user!.uid}');
      await FirebaseFirestore.instance
          .collection('users')
          .doc('${user.user!.uid}')
          .set({
        'username': utilisateur.username,
        'email': utilisateur.email,
        'phone': utilisateur.tel,
        'role': utilisateur.role
      });
      //return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //GOOGLE
  Future<UserCredential> signInWithGoogle() async {
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
  }
}
