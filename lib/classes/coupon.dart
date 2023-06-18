import 'dart:ffi';

class Coupon{
  String _code;
  Double _valeur;
  Double _type;
  Double _date_validite;
  Int _usage_limit;
  Int _reference_produit;

  /** constructeur*/
  Coupon(this._code,this._valeur,this._type,this._date_validite,this._usage_limit,this._reference_produit);

  /** getters & setters*/
  Int get reference_produit => _reference_produit;
  set reference_produit(Int value) {_reference_produit = value;}

  Int get usage_limit => _usage_limit;
  set usage_limit(Int value) {_usage_limit = value;}

  Double get date_validite => _date_validite;
  set date_validite(Double value) {_date_validite = value;}

  Double get type => _type;
  set type(Double value) {_type = value;}

  Double get valeur => _valeur;
  set valeur(Double value) {_valeur = value;}

  String get code => _code;
  set code(String value) {_code = value;}

  /** to string*/

  @override
  String toString() {return 'code: $_code, valeur: $_valeur, discount: $_type, date_validite: $_date_validite, usage_limit: $_usage_limit, reference_produit: $_reference_produit}';}

  /** equals*/
  @override
  bool operator ==(Object other) => identical(this, other) || other is Coupon && runtimeType == other.runtimeType && _code == other._code;

}