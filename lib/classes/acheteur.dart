import 'package:spring/classes/carteBancaire.dart';
import 'package:spring/classes/utilisateur.dart';

class Acheteur extends Utilisateur{
  String _adresse ;
  String _ville ;
  CarteBancaire _card ;

  /** constructeur*/
  Acheteur(String nom,String prenom,String email,String tel,String username,String password,this._adresse,this._ville,this._card) : super(nom, prenom, email, tel, username, password);

  /** getters & setters*/
  String get adresse => _adresse;
  set adresse(String value) {_adresse = value;}

  String get ville => _ville;
  set ville(String value) {_ville = value;}

  CarteBancaire get card => _card;
  set card(CarteBancaire value) {_card = value;}

  /** to string*/
  @override
  String toString() {return '${super.toString()}, adresse: $adresse ville: $ville, card: $card}';}

  /** equals*/
  @override
  bool operator ==(Object other) =>identical(this, other) || other is Acheteur && runtimeType == other.runtimeType && other.username==username;


}

