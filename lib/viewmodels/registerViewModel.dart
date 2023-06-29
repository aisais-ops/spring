import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spring/models/utilisateur.dart';

class RegisterViewModel {
  Future<void> signUp(Utilisateur utilisateur) async {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    await user.add({
      'username': utilisateur.username,
      'email': utilisateur.email,
      'phone': utilisateur.tel,
    });
  }
}
