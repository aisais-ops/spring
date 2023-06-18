import 'dart:html';

class CarteBancaire{
  String _nom_porteur;
  int _num_carte_bancaire;
  int _cvv;
  DateTime _date_expiration;

  /** constructeur*/
  CarteBancaire(this._nom_porteur,this._num_carte_bancaire,this._cvv,this._date_expiration);

  /** getters & setters*/
  String get nom_porteur=>_nom_porteur;
  set nom_prteur(String value){_nom_porteur=value;}

  DateTime get date_expiration => _date_expiration;
  set date_expiration(DateTime value) {_date_expiration = value;}

  int get cvv => _cvv;
  set cvv(int value) {_cvv = value;}

  int get num_carte_bancaire => _num_carte_bancaire;
  set num_carte_bancaire(int value) {_num_carte_bancaire = value;}

  /** to string*/
  @override
  String toString() {return "nom: $nom_porteur num carte: $num_carte_bancaire cvv: $cvv dateExpiration $date_expiration" ;}

  /** equals*/
  @override
  bool operator == (Object other)=>identical(this,other) || other is CarteBancaire && runtimeType==other.runtimeType && num_carte_bancaire==other.num_carte_bancaire;

}