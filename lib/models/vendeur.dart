import 'package:spring/models/utilisateur.dart';

class Vendeur extends Utilisateur{
  String _matricule ;
  String _nom_store ;
  String _ville ;
  String _adresse ;
  String _rib ;

  /** constructeur*/
  Vendeur(String nom,String prenom,String email,String tel,String username,String password,this._matricule, this._nom_store, this._ville, this._adresse, this._rib) : super(nom:nom, prenom:prenom, email:email, tel:tel, username:username, password:password);

  /** getters & setters*/
  String get matricule => _matricule;
  set matricule(String value) {_matricule = value;}

  String get nom_store => _nom_store;
  set nom_store(String value) {_nom_store = value;}

  String get ville => _ville;
  set ville(String value) {_ville = value;}

  String get adresse => _adresse;
  set adresse(String value) {_adresse = value;}

  String get rib => _rib;
  set rib(String value) {_rib = value;}

  /** to string*/
  @override
  String toString() {return '${super.toString()}, matricule: $matricule, nom store: $nom_store, ville: $ville, adresse: $adresse, rib: $rib}';}

  /** equals*/
  @override
  bool operator ==(Object other) =>identical(this, other) || other is Vendeur && runtimeType == other.runtimeType && matricule == other.matricule;

}
