import 'package:spring/classes/vendeur.dart';

class Utilisateur{
  String _nom;
  String _prenom;
  String _email;
  String _tel;
  String _username;
  String _password;

  /** constructeur*/
  Utilisateur(this._nom,this._prenom,this._email,this._tel,this._username,this._password);

  /** getters & setters*/
  String get nom => _nom;
  set nom(String value){_nom=value;}

  String get prenom =>_prenom;
  set prenom(String value){_prenom=value;}

  String get email=>_email;
  set email(String value){_email=value;}

  String get tel=>_tel;
  set tel(String value){_tel=value;}

  String get username=>_username;
  set username(String value){_username=value;}

  String get password => _password;
  set password(String value) {_password = value;}

  /** to string*/
  @override
  String toString() {
    return 'nom: $_nom, prenom: $_prenom, email: $_email, tel: $_tel, username: $_username, password: $_password}';
  }

  /** equals*/
  @override
  bool operator == (Object other)=>identical(this,other) || other is Utilisateur && runtimeType==other.runtimeType && username==other.username;
}