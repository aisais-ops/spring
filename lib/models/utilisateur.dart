import 'package:flutter/foundation.dart';
import 'package:spring/models/vendeur.dart';

class Utilisateur {
  late String _nom;
  late String _prenom;
  late String _email;
  late String _tel;
  late String _username;
  late String _password;
  late String _role;

  /** constructeur*/
  Utilisateur({nom, prenom, email, tel, username, password, role}) {
    _nom = nom ?? "";
    _prenom = prenom ?? "";
    _email = email ?? "";
    _tel = tel ?? "";
    _username = username ?? "";
    _password = password ?? "";
    _role = role ?? "";
  }


  /** getters & setters*/
  String get nom => _nom;
  set nom(String value) {
    _nom = value;
  }

  String get prenom => _prenom;
  set prenom(String value) {
    _prenom = value;
  }

  String get email => _email;
  set email(String value) {
    _email = value;
  }

  String get tel => _tel;
  set tel(String value) {
    _tel = value;
  }

  String get username => _username;
  set username(String value) {
    _username = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }

  String get role => _role;
  set role(String value) {
    _role = value;
  }

  /** to string*/
  @override
  String toString() {
    return 'nom: $_nom, prenom: $_prenom, email: $_email, tel: $_tel, username: $_username, password: $_password}';
  }

  /** equals*/
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Utilisateur &&
          runtimeType == other.runtimeType &&
          username == other.username;
}
