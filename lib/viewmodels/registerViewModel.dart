import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterViewModel {
  Future<void> signUp({
    required String username,
    required String email,
    required String phone,
  }) async {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    await user.add({
      'username': username,
      'email': email,
      'phone': phone,
    });
  }
}
