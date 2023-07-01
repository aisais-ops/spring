import 'package:spring/models/utilisateur.dart';

enum Service{Gerant,ServiceFacturation,SupportClient}

class Administrateur extends Utilisateur{
  String _cin ;
  Service _service ;

  /** constructeur*/
  Administrateur(String nom,String prenom,String email,String tel,String username,String password,this._cin,this._service) : super(nom:nom, prenom:prenom, email:email, tel:tel, username:username, password:password);

  /** getters & setters*/
  String get cin => _cin;
  set cin(String value) {_cin = value;}

  Service get service => _service;
  set service(Service value) {_service = value;}

  /** to string*/
  @override
  String toString() {return '${super.toString()}, cin: $cin role: $role}';}

  /** equals*/
  @override
  bool operator ==(Object other) =>identical(this, other) || other is Administrateur && runtimeType == other.runtimeType && other.username==username;


}

