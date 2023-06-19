import 'package:spring/models/utilisateur.dart';

enum Role{Gerant,ServiceFacturation,SupportClient}

class Administrateur extends Utilisateur{
  String _cin ;
  Role _role ;

  /** constructeur*/
  Administrateur(String nom,String prenom,String email,String tel,String username,String password,this._cin,this._role) : super(nom:nom, prenom:prenom, email:email, tel:tel, username:username, password:password);

  /** getters & setters*/
  String get cin => _cin;
  set cin(String value) {_cin = value;}

  Role get role => _role;
  set role(Role value) {_role = value;}

  /** to string*/
  @override
  String toString() {return '${super.toString()}, cin: $cin role: $role}';}

  /** equals*/
  @override
  bool operator ==(Object other) =>identical(this, other) || other is Administrateur && runtimeType == other.runtimeType && other.username==username;


}

